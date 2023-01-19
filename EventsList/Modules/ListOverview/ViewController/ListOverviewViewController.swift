//
//  ListOverviewViewController.swift
//  EventsList

import UIKit
import SnapKit
import Combine

final class ListOverviewViewController: UIViewController {
    
    private enum Const {
        static let cellId = "eventCell"
    }
    
    private let viewModel: ListOverviewViewModelProtocol
    
    var completion: TypeToVoidHandler<String>?
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(EventCell.self, forCellReuseIdentifier: Const.cellId)
        tableView.delegate = self
        tableView.dataSource = self
        return tableView
    }()
    
    private lazy var sortingPanel = SortingPanelView()
    
    private var cancellables = Set<AnyCancellable>()
    
    init(viewModel: ListOverviewViewModelProtocol) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupLayout()
        viewModel.loadData { [weak self] in
            self?.tableView.reloadData()
        }
        sortingPanel
            .subscribe()
            .sink { [weak self] actionType in
                self?.viewModel.didTapSort(with: actionType)
                self?.tableView.reloadData()
            }
            .store(in: &cancellables)
    }
    
    private func setupUI() {
        view.backgroundColor = .white
        view.addSubviews([tableView, sortingPanel])
    }
    
    private func setupLayout() {
        sortingPanel.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview().inset(16)
            $0.top.equalTo(view.safeAreaLayoutGuide)
            $0.height.equalTo(64)
        }
        tableView.snp.makeConstraints {
            $0.top.equalTo(sortingPanel.snp.bottom)
            $0.leading.trailing.bottom.equalToSuperview()
        }
    }
    
}

extension ListOverviewViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(
        _ tableView: UITableView, numberOfRowsInSection section: Int
    ) -> Int {
        viewModel.events.count
    }
    
    func tableView(
        _ tableView: UITableView,
        cellForRowAt indexPath: IndexPath
    ) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: Const.cellId, for: indexPath) as? EventCell else { return .init() }
        let model = viewModel.events[indexPath.row]
        cell.configure(viewModel: model)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let eventId = viewModel.events[indexPath.row].id
        completion?(eventId)
    }
}
