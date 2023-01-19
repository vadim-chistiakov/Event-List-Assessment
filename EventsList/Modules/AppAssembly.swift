//
//  AppAssembly.swift
//  EventsList
//
//  Created by Vadim Chistiakov on 19.01.2023.
//

import Foundation

protocol AppAssemby {
    func buildListOverview(completion: (String) -> Void) -> UIViewController
    func buildEventDetails() -> UIViewController
}

final class AppAssemblyImpl: AppAssemby {
    
    func buildListOverview(completion: (String) -> Void) -> UIViewController {
        let vm = ListOverviewViewModel(
            eventsListService: EventsListServiceImpl()
        )
        let vc = ListOverviewViewController(viewModel: vm)
        vc.completion = completion
        return vc
    }
    
    func buildEventDetails() -> UIViewController {
        let vm = EventDetailsViewModel(
            eventsListService: EventsListServiceImpl(),
            eventId: eventId
        )
        return EventDetailsViewController(viewModel: vm)
    }
    
}
