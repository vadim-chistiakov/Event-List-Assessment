//
//  SortingType.swift
//  EventsList
//
//  Created by Vadim Chistiakov on 19.01.2023.
//

enum SortingType: String, CaseIterable {
    case dateDesc = "Date <"
    case priceAsc = "Price >"
    case priceDesc = "Price <"
    case outdatedEvents = "Outdated events"
}
