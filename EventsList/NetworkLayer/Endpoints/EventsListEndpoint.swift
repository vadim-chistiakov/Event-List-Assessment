//
//  EventsListEndpoint.swift
//  EventsList
//
//  Created by Vadim Chistiakov on 12.01.2023.
//

import Foundation
import EasyNetwork

enum EventsListEndpoint {
    case events
    case event(id: String)
    case buyTicket(id: String)
}

extension EventsListEndpoint: Endpoint {
    
    var path: String {
        switch self {
        case .events:
            return "/events"
        case .event(let id):
            return "/event/\(id)"
        case .buyTicket(let id):
            return "/event/\(id)/buy"
        }
    }

    var method: RequestMethod {
        switch self {
        case .events, .event:
            return .get
        case .buyTicket:
            return .post
        }
    }
    
    var body: [String : String]? {
        nil
    }
}
