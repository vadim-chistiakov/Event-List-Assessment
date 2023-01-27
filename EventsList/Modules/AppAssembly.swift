//
//  AppAssembly.swift
//  EventsList
//
//  Created by Vadim Chistiakov on 19.01.2023.
//

import UIKit

protocol AppAssembly {
    func buildListOverview(completion: @escaping (String) -> Void) -> UIViewController
    func buildEventDetails(eventId: String) -> UIViewController
}

final class AppAssemblyImpl: AppAssembly {
    
    func buildListOverview(completion: @escaping (String) -> Void) -> UIViewController {
        let vm = ListOverviewViewModel(
            eventsListService: EventsListServiceImpl()
        )
        let vc = ListOverviewViewController(viewModel: vm)
        vc.completion = completion
        return vc
    }
    
    func buildEventDetails(eventId: String) -> UIViewController {
        let vm = EventDetailsViewModel(
            eventsListService: EventsListServiceImpl(),
            eventId: eventId
        )
        return EventDetailsViewController(viewModel: vm)
    }
    
}
