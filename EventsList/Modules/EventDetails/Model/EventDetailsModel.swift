//
//  EventDetailsModel.swift
//  EventsList


import Foundation

struct EventDetailsModel: Decodable {
    let id: String
    let title: String?
    let subtitle: String?
    let price: Float
    let phone: String?
    let address: String?
    let date: Date
}
