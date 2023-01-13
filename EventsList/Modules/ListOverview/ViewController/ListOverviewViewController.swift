//
//  ListOverviewViewController.swift
//  EventsList

import UIKit
import SnapKit

final class ListOverviewViewController: UIViewController {
    
    private let viewModel: ListOverviewViewModelProtocol
    
    var completion: TypeToVoidHandler<String>?
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.delegate = self
        tableView.dataSource = self
        return tableView
    }()
    
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
        
        viewModel.loadData { [weak self] result in
            if case Result.success = result {
                self?.tableView.reloadData()
            }
        }
    }
    
    private func setupUI() {
        view.backgroundColor = .white
        view.addSubview(tableView)
    }
    
    private func setupLayout() {
        tableView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
}

extension ListOverviewViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(
        _ tableView: UITableView, numberOfRowsInSection section: Int
    ) -> Int {
        viewModel.events.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellId = "eventCell"
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId) ?? UITableViewCell(style: .subtitle, reuseIdentifier: cellId)
        
        let model = viewModel.events[indexPath.row]
        cell.textLabel?.text = model.title
        // TODO: Use proper date formatting
        cell.detailTextLabel?.text = model.date.description
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let eventId = viewModel.events[indexPath.row].id
        completion?(eventId)
    }
}
