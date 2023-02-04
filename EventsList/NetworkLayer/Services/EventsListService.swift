//
//  NetworkService.swift
//  EventsList
//
//  Created by Vadim Chistiakov on 12.01.2023.
//

import Foundation
import EasyNetwork

protocol EventsListService {
    func loadEvents() async -> Result<[EventModel], RequestError>
    func loadEventDetails(id: String) async -> Result<EventDetailsModel, RequestError>
    func buyTicket(id: String) async -> Result<TicketModel, RequestError>
}

struct EventsListServiceImpl: EasyNetworkClient, EventsListService {
    
    func loadEvents() async -> Result<[EventModel], RequestError> {
        await sendRequest(
            endpoint: EventsListEndpoint.events,
            responseModelType: [EventModel].self
        )
    }
    
    func loadEventDetails(id: String) async -> Result<EventDetailsModel, RequestError> {
        await sendRequest(
            endpoint: EventsListEndpoint.event(id: id),
            responseModelType: EventDetailsModel.self
        )
    }
    
    func buyTicket(id: String) async -> Result<TicketModel, RequestError> {
        await sendRequest(
            endpoint: EventsListEndpoint.buyTicket(id: id),
            responseModelType: TicketModel.self
        )
    }
}
