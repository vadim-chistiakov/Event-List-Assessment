//
//  EventDetailsViewModel.swift
//  EventsList


import Foundation

final class EventDetailsViewModel: EventDetailsViewModelProtocol {
    
    var event: EventDetailsModel?
    var buyTitle: String? = "Buy ticket"
    
    private let eventsListService: EventsListService
    
    init(eventsListService: EventsListService) {
        self.eventsListService = eventsListService
    }
    
    func loadDetails(completion: @escaping ResultHandler<Void>) {
        // TODO: Implement API
    }
    
    func buyTicket(completion: @escaping ResultHandler<Void>) {
        // TODO: Implement API
    }
}
