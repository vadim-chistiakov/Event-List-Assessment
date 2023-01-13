//
//  EventDetailsViewController.swift
//  EventsList


import UIKit
import SnapKit

final class EventDetailsViewController: UIViewController {
    
    private let viewModel: EventDetailsViewModelProtocol
    
    init(viewModel: EventDetailsViewModelProtocol) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        viewModel.loadDetails { [weak self] _ in
//            updateUI
        }
    }
}
