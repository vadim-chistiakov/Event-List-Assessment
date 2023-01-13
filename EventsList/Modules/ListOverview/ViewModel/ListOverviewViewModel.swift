//
//  ListOverviewViewModel.swift
//  EventsList


import Foundation

final class ListOverviewViewModel: ListOverviewViewModelProtocol {
    
    private(set) var events: [EventModel] = []
    
    private let eventsListService: EventsListService
    
    init(eventsListService: EventsListService) {
        self.eventsListService = eventsListService
    }
    
    func loadData(completion: @escaping ResultHandler<[EventModel]>) {
        Task {
            let result = await eventsListService.loadEvents()
            switch result {
            case .success(let events):
                self.events = events
                DispatchQueue.main.async {
                    completion(.success(events))
                }
            case .failure(let failure):
                print(failure.customMessage)
            }
        }
        // TODO: Get data from API
//        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1) { [weak self] in
//            let now = Date()
//            let calendar = Calendar.current
//
//            let events = [1,2,3,4,5].map {
//                EventModel(
//                    id: "X\($0)",
//                    title: "Event \($0)",
//                    price: Float($0*100),
//                    date: calendar.date(byAdding: .hour, value: -$0, to: now)!)
//            }
//            self?.events = events
//            completion(.success(events))
//        }
    }
}
