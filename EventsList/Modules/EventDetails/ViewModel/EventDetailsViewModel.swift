//
//  EventDetailsViewModel.swift
//  EventsList


import Foundation

final class EventDetailsViewModel: EventDetailsViewModelProtocol {
    
    var event: EventDetailsModel?
    var buyTitle: String? = "Buy ticket"
    
    func loadDetails(completion: @escaping ResultHandler<Void>) {
        // TODO: Implement API
    }
    
    func buyTicket(completion: @escaping ResultHandler<Void>) {
        // TODO: Implement API
    }
}
