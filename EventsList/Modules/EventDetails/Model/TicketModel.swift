//
//  TicketModel.swift
//  EventsList
//
//  Created by Vadim Chistiakov on 13.01.2023.
//

import Foundation

struct TicketModel: Decodable {
    let success: Bool
    let ticketPrice: Float
    let verificationImage: Data
    let date: Date
}
