//
//  ListOverviewViewModelProtocol.swift
//  EventsList


import Foundation

protocol ListOverviewViewModelProtocol {
    var events: [EventModel] { get }
    
    func loadData(completion: @escaping VoidHandler)
    func didTapSort(with actionType: SortingType)
}
