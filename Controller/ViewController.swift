//
//  ViewController.swift
//  ToDoListBasic
//
//  Created by Nikita Shvad on 12.07.2022.
//

import UIKit

class ViewController: UIViewController {

    private let mainScreenView = MainScreenView()
    private let mainScreenManager = MainScreenTableViewManager()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        mainScreenView.dataSource = mainScreenManager
    }
}

// MARK: - Private Methods
extension ViewController {
    private func setupView() {
        view.addSubview(mainScreenView)
        view.translatesAutoresizingMaskIntoConstraints = false
        mainScreenView.frame = self.view.frame
    }
}
