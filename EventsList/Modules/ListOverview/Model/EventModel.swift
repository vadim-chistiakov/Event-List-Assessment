//
//  EventModel.swift
//  EventsList


import Foundation

struct EventModel: Decodable {
    
    enum CodingKeys: String, CodingKey {
        case id = "guid"
        case title = "event"
        case price = "ticketPrice"
        case date
        case formattedDate
    }
    
    let id: String
    let title: String
    let price: Float
    let date: String
    let formattedDate: Date?
}
