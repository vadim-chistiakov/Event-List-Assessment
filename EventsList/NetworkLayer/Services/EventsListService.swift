//
//  NetworkService.swift
//  EventsList
//
//  Created by Vadim Chistiakov on 12.01.2023.
//

import Foundation

protocol EventsListService {
    func loadEvents() async -> Result<[EventModel], RequestError>
    func loadEventDetails(id: String) async -> Result<EventDetailsModel, RequestError>
    func buyTicket(id: String) async -> Result<NoReply, RequestError>
}

struct EventsListServiceImpl: HTTPClient, EventsListService {
    
    func loadEvents() async -> Result<[EventModel], RequestError> {
        await sendRequest(
            endpoint: EventsListEndpoint.events,
            responseModel: [EventModel].self
        )
    }
    
    func loadEventDetails(id: String) async -> Result<EventDetailsModel, RequestError> {
        await sendRequest(
            endpoint: EventsListEndpoint.event(id: id),
            responseModel: EventDetailsModel.self
        )
    }
    
    func buyTicket(id: String) async -> Result<NoReply, RequestError> {
        await sendRequest(
            endpoint: EventsListEndpoint.buyTicket(id: id),
            responseModel: NoReply.self
        )
    }
}
