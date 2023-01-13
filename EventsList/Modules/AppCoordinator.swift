//
//  AppCoordinator.swift
//  EventsList


import UIKit

protocol Coordinator {
    func start()
}

final class AppCoordinator: Coordinator {
    
    let navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        showListOverview()
    }
    
    private func showListOverview() {
        let vm = ListOverviewViewModel(
            eventsListService: EventsListServiceImpl()
        )
        let vc = ListOverviewViewController(viewModel: vm)
        vc.completion = { [weak self] eventId in
            self?.showEventDetails(eventId: eventId)
        }
        navigationController.setViewControllers([vc], animated: false)
    }
    
    private func showEventDetails(eventId: String) {
        let vm = EventDetailsViewModel(
            eventsListService: EventsListServiceImpl(),
            eventId: eventId
        )
        let vc = EventDetailsViewController(viewModel: vm)
        navigationController.pushViewController(vc, animated: true)
    }
}
