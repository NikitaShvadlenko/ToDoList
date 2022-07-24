import UIKit

class MainScreenTableViewManager: NSObject {
    let employeeManager = EmployeeManager()
}

extension MainScreenTableViewManager: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        employeeManager.employees.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "\(EmployeeCell.self)", for: indexPath) as? EmployeeCell
        else {
            fatalError("Could not deque cell")
        }
        cell.setupEmployeeTypeLabel(name: employeeManager.employees[indexPath.row].name, description: employeeManager.employees[indexPath.row].description)
        return cell
    }
}
