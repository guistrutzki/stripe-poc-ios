//
//  AppointmentsListVC.swift
//  stripe-app-integration
//
//  Created by Guilherme Strutzki on 30/05/22.
//

import UIKit
import Stripe

class AppointmentsListVC: UIViewController {
    private let viewModel = AppointmentsListVM()
    private let contentView = AppointmentsListView()
    private let paymentService = PaymentService()
    private var paymentSheet: PaymentSheet?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Consultas"
        
        contentView.setup(viewModel: viewModel)
        contentView.delegate = self
    }
    
    override func loadView() {
        view = contentView
    }
    
    private func displayAlert(_ message: String) {
        let alertController = UIAlertController(title: "", message: message, preferredStyle: .alert)
        let OKAction = UIAlertAction(title: "OK", style: .default) { (action) in
            alertController.dismiss(animated: true) {
                self.navigationController?.popViewController(animated: true)
            }
        }
        alertController.addAction(OKAction)
        present(alertController, animated: true, completion: nil)
    }
    
    private func createPaymentIntent(appointment: Appointment) {
        paymentService
            .createPaymentIntent(bodyParams:
                                    PaymentIntentBody(amount: appointment.value,
                                                      currency: appointment.currency.rawValue))
        { [weak self] (result: Result<PaymentIntentResponse?, NetworkError>) in
            
            guard let self = self else { return }
            
            switch result {
            case .success(let data):
                guard let clientSecret = data?.clientSecret,
                      let publishableKey = data?.publishableKey,
                      let customerId = data?.customerId,
                      let ephemeralKey = data?.ephemeralKey
                else { return }
                
                self.createPaymentSheetInstance(clientSecret: clientSecret,
                                                publishableKey: publishableKey,
                                                customerId: customerId,
                                                ephemeralKey: ephemeralKey )
                self.presentPaymentSheet()
            case .failure(let error):
                print("Error", error.localizedDescription)
            }
        }
    }
    
    private func createPaymentSheetInstance(clientSecret: String,
                                            publishableKey: String,
                                            customerId: String,
                                            ephemeralKey: String) {
        var configuration = PaymentSheet.Configuration()
        configuration.defaultBillingDetails.address.country = "BR"
        configuration.savePaymentMethodOptInBehavior = .automatic
        configuration.merchantDisplayName = "Emer"
        configuration.customer = .init(id: customerId, ephemeralKeySecret: ephemeralKey)
        STPPaymentConfiguration().availableCountries = ["BR", "US"]
        STPAPIClient.shared.publishableKey = publishableKey
        paymentSheet = PaymentSheet(paymentIntentClientSecret: clientSecret,
                                    configuration: configuration)
    }
    
    private func presentPaymentSheet() {
        DispatchQueue.main.async {
            self.paymentSheet?.present(from: self, completion: { paymentResult in
                switch paymentResult {
                case .completed:
                    self.displayAlert("Sua transação foi autorizada com sucesso.")
                case .canceled:
                    print("Canceled")
                case .failed(let error):
                    print("Error", error.localizedDescription)
                    self.displayAlert("Oops, algo deu errado. Tente novamente.")
                }
            })
        }
    }
}


extension AppointmentsListVC: AppointmentsListViewDelegate {
    func didTappedAppointment(appointment: Appointment) {
        createPaymentIntent(appointment: appointment)
    }
}
