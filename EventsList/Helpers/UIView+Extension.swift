//
//  UIView+Extension.swift
//  EventsList
//
//  Created by Vadim Chistiakov on 16.01.2023.
//

import UIKit

extension UIView {
    func addSubviews(_ views: [UIView]) {
        views.forEach { addSubview($0) }
    }
}

