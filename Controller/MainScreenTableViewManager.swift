//
//  MainScreenTableViewManager.swift
//  ToDoListBasic
//
//  Created by Nikita Shvad on 12.07.2022.
//

import Foundation
import UIKit

class MainScreenTableViewManager: NSObject {

}

extension MainScreenTableViewManager: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        10
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
}
