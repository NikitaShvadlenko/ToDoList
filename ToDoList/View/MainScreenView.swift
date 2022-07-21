//
//  MainScreenView.swift
//  ToDoListBasic
//
//  Created by Nikita Shvad on 12.07.2022.
//

import Foundation
import UIKit
import SnapKit

class MainScreenView: UIView {

    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.estimatedRowHeight = 100
        return tableView
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Public Methods
extension MainScreenView {
    var dataSource: UITableViewDataSource? {
        get {
            tableView.dataSource
        }
        set {
            tableView.dataSource = newValue
        }
    }
}

// MARK: - Private Methods
extension MainScreenView {
    private func setupView() {
        self.addSubview(tableView)
        tableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}
