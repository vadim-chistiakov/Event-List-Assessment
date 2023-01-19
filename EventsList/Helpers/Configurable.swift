//
//  Configurable.swift
//  EventsList
//
//  Created by Vadim Chistiakov on 16.01.2023.
//

protocol Configurable {
    associatedtype ViewModel
    func configure(viewModel: ViewModel)
}
