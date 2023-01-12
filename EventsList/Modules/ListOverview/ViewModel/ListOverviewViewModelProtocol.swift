//
//  ListOverviewViewModelProtocol.swift
//  EventsList


import Foundation

protocol ListOverviewViewModelProtocol {
    func loadData(completion: @escaping ResultHandler<[EventModel]>)
    var events: [EventModel] { get }
}
