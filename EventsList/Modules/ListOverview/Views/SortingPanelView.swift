//
//  SortingPanelView.swift
//  EventsList
//
//  Created by Vadim Chistiakov on 16.01.2023.
//

import UIKit
import Combine

final class SortingPanelView: UIStackView {
    
    private let subject = PassthroughSubject<SortingType, Never>()

    override init(frame: CGRect) {
        super.init(frame: frame)
        configureStack()
        configureButtons()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func subscribe() -> AnyPublisher<SortingType, Never> {
        subject.eraseToAnyPublisher()
    }
    
    //MARK: - Private methods
    
    private func configureStack() {
        axis = .horizontal
        distribution = .equalSpacing
    }
    
    private func configureButtons() {
        SortingType.allCases.enumerated().forEach { (index, value) in
            addArrangedSubview(configureButton(title: value.rawValue, tag: index))
        }
    }
    
    private func configureButton(title: String, tag: Int) -> UIButton {
        let button = UIButton()
        button.layer.cornerRadius = 10
        button.layer.masksToBounds = true
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .lightGray
        button.tag = tag
        button.setTitle(title, for: .normal)
        button.addTarget(
            self,
            action: #selector(didTapButton),
            for: .touchUpInside
        )
        return button
    }
    
    @objc
    private func didTapButton(_ button: UIButton) {
        switch button.tag {
        case 0:
            subject.send(.dateDesc)
        case 1:
            subject.send(.priceAsc)
        case 2:
            subject.send(.priceDesc)
        case 3:
            subject.send(.outdatedEvents)
        default:
            fatalError("doesn't exist")
        }
    }
    
}
