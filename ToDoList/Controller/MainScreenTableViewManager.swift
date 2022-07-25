import UIKit
import SharedResources

class MainScreenTableViewManager: NSObject {
    let employeeManager = EmployeeManager()
}

extension MainScreenTableViewManager: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        employeeManager.employees.count
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
            let accountant = employeeManager.accountants[indexPath.row]
            cell.configureCell(
                name: accountant.name,
                salary: accountant.salary,
                accountantType: accountant.accountantType,
                deskNumber: accountant.deskNumber,
                breakHours: accountant.breakHours
            )
            return cell

        case .basicWorker:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "\(EmployeeCell.self)", for: indexPath) as? EmployeeCell
            else {
                fatalError("Could not deque cell")
            }
            let employee = employeeManager.basicWorkers[indexPath.row]
            cell.setupEmployeeTypeLabel(
                name: employee.name,
                salary: employee.salary,
                deskNumber: employee.deskNumber,
                employeeBreakHours: employee.breakHours
            )
            return cell
        }
    }
}

extension MainScreenTableViewManager: UITableViewDelegate {
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {

        var sectionTitle: String = ""
        var image: UIImage?

        switch employeeManager.employees[section][0].employeeType {

        case .management:
            sectionTitle = SharedResources.L10n.managerSectionName
            image = UIImage(sfSymbol: SharedResources.SFSymbol.managerIcon)

        case .accountant:
            sectionTitle = SharedResources.L10n.accountantSectionName
            image = UIImage(sfSymbol: SharedResources.SFSymbol.accountantIcon)

        case .basicWorker:
            sectionTitle = SharedResources.L10n.workerSectionName
            image = UIImage(sfSymbol: SharedResources.SFSymbol.basicWorkerIcon)
        }

        let headerView = HeaderView()
        guard let image = image else {
            fatalError("image does not exist")
        }

        headerView.configureHeader(title: sectionTitle, icon: image)
        return headerView
    }
}
