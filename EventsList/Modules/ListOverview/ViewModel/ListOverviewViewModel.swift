//
//  ListOverviewViewModel.swift
//  EventsList


import Foundation

final class ListOverviewViewModel: ListOverviewViewModelProtocol {
    
    private(set) var events: [EventModel] = []
    
    private let eventsListService: EventsListService

    private var initialEvents: [EventModel] = []

    init(eventsListService: EventsListService) {
        self.eventsListService = eventsListService
    }
    
    func loadData(completion: @escaping VoidHandler) {
        Task {
            let result = await eventsListService.loadEvents()
            switch result {
            case .success(let events):
                self.initialEvents = events.map(convertModel)
                self.events = initialEvents
                DispatchQueue.main.async {
                    completion()
                }
            case .failure(let failure):
                print(failure)
            }
        }
    }
    
    func didTapSort(with actionType: SortingType) {
        switch actionType {
        case .dateDesc:
            events = initialEvents.sorted(by: {
                $0.formattedDate ?? Date() > $1.formattedDate ?? Date() }
            )
        case .priceAsc:
            events = initialEvents.sorted(by: { Int($0.price) < Int($1.price) })
        case .priceDesc:
            events = initialEvents.sorted(by: { Int($0.price) > Int($1.price) })
        case .outdatedEvents:
            events = initialEvents.filter { $0.formattedDate ?? Date() > Date() }
        }
    }

    
    //MARK: - Private methods
    
    private func convertModel(_ model: EventModel) -> EventModel {
        guard let formattedDate = String.getFormattedDate(originalDateString: model.date)
        else {
            return model
        }
        return .init(
            id: model.id,
            title: model.title,
            price: model.price,
            date: formattedDate.string,
            formattedDate: formattedDate.date
        )
    }
    
}

extension String {
    static func getFormattedDate(
        inputFormat: String = "yyyy-MM-dd'T'HH:mm:ss.SSSZ",
        outputFormat: String = "dd MMMM yyyy",
        originalDateString: String
    ) -> (string: String, date: Date)? {
        let dateFormatterInput = DateFormatter()
        dateFormatterInput.dateFormat = inputFormat
        
        let dateFormatterOutput = DateFormatter()
        dateFormatterOutput.dateFormat = outputFormat
        
        guard let date = dateFormatterInput.date(from: originalDateString)
        else { return nil }
        return (dateFormatterOutput.string(from: date), date)
    }
}
