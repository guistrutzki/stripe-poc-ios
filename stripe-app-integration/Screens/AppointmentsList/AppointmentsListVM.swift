//
//  AppointmentsListVM.swift
//  stripe-app-integration
//
//  Created by Guilherme Strutzki on 31/05/22.
//

import Foundation

enum Currency: String {
    case USD
    case BRL
}

enum AppLocale: String {
    case ptBR = "pt_BR"
    case enUS = "en_US"
}

struct Appointment {
    let doctor: String
    let value: Double
    let currency: Currency
    let locale: AppLocale
    let date: String
}

class AppointmentsListVM {
    let appointments: [Appointment] = [
        Appointment(doctor: "Fulano Nunes",
                    value: 100,
                    currency: .BRL,
                    locale: .ptBR,
                    date: "12 Jan, 2022, 8am - 9am"),
        Appointment(doctor: "Godofredo Silva",
                    value: 200,
                    currency: .BRL,
                    locale: .ptBR,
                    date: "14 Jan, 2022, 2pm - 3pm"),
        Appointment(doctor: "John Doe",
                    value: 50,
                    currency: .USD,
                    locale: .enUS,
                    date: "15 Jan, 2022, 3pm - 4pm"),

    ]
    
    public func getAppointment(index: Int) -> Appointment {
        return appointments[index]
    }
    
    public func getNumberOfRows() -> Int {
        appointments.count
    }
}
