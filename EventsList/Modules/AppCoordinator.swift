//
//  AppCoordinator.swift
//  EventsList


import UIKit

protocol Coordinator {
    func start()
}

final class AppCoordinator: Coordinator {
    
    let navigationController: UINavigationController
    
    private let assembly: AppAssembly
    
    init(
        navigationController: UINavigationController,
        assembly: AppAssembly
    ) {
        self.navigationController = navigationController
        self.assembly = assembly
    }
    
    func start() {
        showListOverview()
    }
    
    private func showListOverview() {
        let vc = assembly.buildListOverview(completion: { [weak self] eventId in
            self?.showEventDetails(eventId: eventId)
        })

        navigationController.setViewControllers([vc], animated: false)
    }
    
    private func showEventDetails(eventId: String) {
        let vc = assembly.buildEventDetails(eventId: eventId)
        navigationController.pushViewController(vc, animated: true)
    }
}
