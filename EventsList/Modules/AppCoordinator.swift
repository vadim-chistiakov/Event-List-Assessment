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
        let vm = ListOverviewViewModel()
        let vc = ListOverviewViewController(viewModel: vm)
        vc.completion = { [weak self] in
            self?.showEventDetails()
        }
        navigationController.setViewControllers([vc], animated: false)
    }
    
    private func showEventDetails() {
        let vm = EventDetailsViewModel()
        let vc = EventDetailsViewController(viewModel: vm)
        navigationController.pushViewController(vc, animated: true)
    }
}
