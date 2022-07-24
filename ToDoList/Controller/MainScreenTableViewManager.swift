import UIKit
import SharedResources

class MainScreenTableViewManager: NSObject {
    let employeeManager = EmployeeManager()
}

extension MainScreenTableViewManager: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        employeeManager.employees.count
    }

    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch employeeManager.employees[section][0].employeeType {

        case .management:
            return SharedResources.L10n.managerSectionName

        case .accountant:
            return SharedResources.L10n.accountantSectionName

        case .basicWorker:
            return SharedResources.L10n.workerSectionName
        }
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        employeeManager.employees[section].count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch employeeManager.employees[indexPath.section][indexPath.row].employeeType {
        case .management:

            guard let cell = tableView.dequeueReusableCell(withIdentifier: "\(ManagerCell.self)", for: indexPath) as? ManagerCell
            else {
                fatalError("Could not deque cell")
            }
            cell.setupEmployeeTypeLabel(name: employeeManager.managers[indexPath.row].name, salary: employeeManager.managers[indexPath.row].salary)
            return cell

        case .accountant:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "\(AccountantCell.self)", for: indexPath) as? AccountantCell
            else {
                fatalError("Could not deque cell")
            }
            cell.setupEmployeeTypeLabel(name: employeeManager.accountants[indexPath.row].name, salary: employeeManager.accountants[indexPath.row].salary)
            return cell

        case .basicWorker:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "\(EmployeeCell.self)", for: indexPath) as? EmployeeCell
            else {
                fatalError("Could not deque cell")
            }
            cell.setupEmployeeTypeLabel(name: employeeManager.basicWorkers[indexPath.row].name, salary: employeeManager.basicWorkers[indexPath.row].salary)
            return cell
        }
    }
}
