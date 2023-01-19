//
//  EventCell.swift
//  EventsList
//
//  Created by Vadim Chistiakov on 16.01.2023.
//

import UIKit

final class EventCell: UITableViewCell, Configurable {
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = .preferredFont(forTextStyle: .headline)
        return label
    }()
    
    private lazy var dateLabel: UILabel = {
        let label = UILabel()
        label.font = .italicSystemFont(ofSize: 14)
        return label
    }()
    
    private lazy var priceLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .right
        label.textColor = .gray
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(viewModel: EventModel) {
        titleLabel.text = viewModel.title
        dateLabel.text = viewModel.date
        priceLabel.text = "\(viewModel.price)"
    }
    
    //MARK: - Private methods
    
    private func configureUI() {
        contentView.addSubviews([titleLabel, dateLabel, priceLabel])
        titleLabel.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(16)
            make.top.equalToSuperview().inset(4)
        }
        dateLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(16)
            make.bottom.equalToSuperview()
            make.top.equalTo(titleLabel.snp.bottom).offset(4)
        }
        priceLabel.snp.makeConstraints { make in
            make.trailing.equalToSuperview().inset(16)
            make.leading.equalTo(dateLabel.snp.trailing).offset(10)
            make.top.equalTo(titleLabel.snp.bottom).offset(4)
            make.bottom.equalToSuperview()
        }
    }
}
