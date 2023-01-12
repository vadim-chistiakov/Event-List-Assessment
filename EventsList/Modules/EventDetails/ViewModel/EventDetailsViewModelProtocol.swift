//
//  EventDetailsViewModelProtocol.swift
//  EventsList


import Foundation

protocol EventDetailsViewModelProtocol {
    var event: EventDetailsModel? { get }
    var buyTitle: String? { get }
    
    func loadDetails(completion: @escaping ResultHandler<Void>)
    func buyTicket(completion: @escaping ResultHandler<Void>)
}
