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

    }
    
    let id: String
    let title: String
    let price: Float
    let date: Date
}
