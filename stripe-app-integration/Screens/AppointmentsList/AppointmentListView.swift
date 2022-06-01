//
//  AppointmentListView.swift
//  stripe-app-integration
//
//  Created by Guilherme Strutzki on 30/05/22.
//

import UIKit

protocol AppointmentsListViewDelegate: AnyObject {
    func didTappedAppointment(appointment: Appointment)
}

class AppointmentsListView: UIView {
    private var viewModel: AppointmentsListVM?
    
    private lazy var appointmentTableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.register(AppointmentCardViewCell.self,
                           forCellReuseIdentifier: AppointmentCardViewCell.classIdentifier())
        tableView.backgroundColor = UIColor(named: "Background")
        tableView.separatorStyle = .none
        tableView.showsVerticalScrollIndicator = false
        tableView.dataSource = self
        tableView.delegate = self
        return tableView
    }()
    
    weak var delegate: AppointmentsListViewDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Public Functions
extension AppointmentsListView {
    public func setup(viewModel: AppointmentsListVM) {
        self.viewModel = viewModel
    }
}

extension AppointmentsListView: ViewCode {
    func configureSubviews() {
        addSubview(appointmentTableView)
    }
    
    func configureSubviewsConstraints() {
        appointmentTableView.snp.makeConstraints { make in
            make.leading.trailing.bottom.top.equalToSuperview()
        }
    }
    
    func configureAdditionalBehaviors() {}
}

extension AppointmentsListView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel?.getNumberOfRows() ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: AppointmentCardViewCell.classIdentifier(),
                                                       for: indexPath) as? AppointmentCardViewCell else {
            return UITableViewCell()
        }
        
        cell.setup(viewModel!.getAppointment(index: indexPath.row))
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let ROW_HEIGHT = CGFloat(128)
        return ROW_HEIGHT
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        delegate?.didTappedAppointment(appointment: viewModel!.getAppointment(index: indexPath.row))
    }
}

extension AppointmentsListView: UITableViewDelegate {}
