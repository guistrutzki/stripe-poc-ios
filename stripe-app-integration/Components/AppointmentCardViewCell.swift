//
//  AppointmentCardViewCell.swift
//  stripe-app-integration
//
//  Created by Guilherme Strutzki on 31/05/22.
//

import UIKit

class AppointmentCardViewCell: UITableViewCell {
    private let containerStack: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 12
        view.backgroundColor = UIColor(named: "Primary")
        view.setShadow(shadowColor: UIColor(named: "Shadow") ?? .black,
                       shadowOpacity: 0.2,
                       shadowRadius: 5,
                       shadowOffset: CGSize(width: 5, height: 5))
        return view
    }()
    
    private let contentStack: UIStackView = {
        let stack = UIStackView()
        stack.alignment = .top
        stack.axis = .vertical
        stack.spacing = 10
        return stack
    }()
    
    private let doctorNameLabel: UILabel = {
        let label = UILabel()
        label.font = .Quicksand(withWeight: .bold, size: 24)
        label.textColor = .white
        label.text = "Fulano Nunes"
        return label
    }()
    
    private let appointmentDateLabel: UILabel = {
        let label = UILabel()
        label.font = .Quicksand(withWeight: .regular, size: 14)
        label.textColor = .white
        label.text = "12 Jan, 2022, 8am - 9am"
        return label
    }()
    
    private let priceLabel: UILabel = {
        let label = UILabel()
        label.font = .Quicksand(withWeight: .bold, size: 18)
        label.textColor = .white
        label.text = "R$ 100,00"
        return label
    }()
    
    // MARK: - Init
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
        setupViews()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension AppointmentCardViewCell {
    public func setup(_ data: Appointment) {
        doctorNameLabel.text = data.doctor
        appointmentDateLabel.text = data.date
        priceLabel.text = data.value.currencyStringLocalizedWithSymbol(currency: data.currency)
    }
}

extension AppointmentCardViewCell: ViewCode {
    func configureSubviews() {
        addSubview(containerStack)
        containerStack.addSubview(contentStack)
        containerStack.addSubview(priceLabel)
        contentStack.addArrangedSubview(doctorNameLabel)
        contentStack.addArrangedSubview(appointmentDateLabel)
        
    }
    
    func configureSubviewsConstraints() {
        containerStack.snp.makeConstraints { make in
            make.bottom.equalToSuperview()
            make.height.equalTo(100)
            make.leading.trailing.equalToSuperview().inset(16)
            make.top.equalToSuperview().offset(16)
        }
        
        contentStack.snp.makeConstraints { make in
            make.top.leading.equalToSuperview()
        }
        
        doctorNameLabel.snp.makeConstraints { make in
            make.top.leading.equalToSuperview().offset(10)
        }
        
        priceLabel.snp.makeConstraints { make in
            make.trailing.bottom.equalToSuperview().inset(10)
        }
    }
    
    func configureAdditionalBehaviors() {
        backgroundColor = UIColor(named: "Background")
    }
}
