//
//  EventDetailsViewModel.swift
//  EventsList


import Foundation

final class EventDetailsViewModel: EventDetailsViewModelProtocol {
    
    var event: EventDetailsModel?
    var buyTitle: String? = "Buy ticket"
    var ticket: TicketModel?
    
    private let eventsListService: EventsListService
    private let eventId: String
    
    init(
        eventsListService: EventsListService,
        eventId: String
    ) {
        self.eventsListService = eventsListService
        self.eventId = eventId
    }
    
    func loadDetails(completion: @escaping ResultHandler<Void>) {
        Task(priority: .background) {
            let result = await eventsListService.loadEventDetails(id: eventId)
            switch result {
            case .success(let success):
                self.event = success
                completion(.success(()))
            case .failure(let failure):
                print(failure)
            }
        }
    }
    
    func buyTicket(completion: @escaping ResultHandler<Void>) {
        Task(priority: .background) {
            let result = await eventsListService.buyTicket(id: eventId)
            switch result {
            case .success(let success):
                self.ticket = success
                completion(.success(()))
            case .failure(let failure):
                print(failure)
            }
        }
    }
}
