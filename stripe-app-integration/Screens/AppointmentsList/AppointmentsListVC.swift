//
//  AppointmentsListVC.swift
//  stripe-app-integration
//
//  Created by Guilherme Strutzki on 30/05/22.
//

import UIKit

class AppointmentsListVC: UIViewController {
    private let viewModel = AppointmentsListVM()
    private let contentView = AppointmentsListView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        contentView.setup(viewModel: viewModel)
        navigationItem.title = "Consultas"
    }
    
    override func loadView() {
        view = contentView
    }
}
