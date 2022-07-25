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
            guard let manager = employeeManager.employees[indexPath.section][indexPath.row] as? Management
            else {
                fatalError("Fatal")
            }
            cell.configureCell(name: manager.name, salary: manager.salary, meetingHours: manager.meetingHours)
            return cell

        case .accountant:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "\(AccountantCell.self)", for: indexPath) as? AccountantCell
            else {
                fatalError("Could not deque cell")
            }
           guard let accountant = employeeManager.employees[indexPath.section][indexPath.row]  as? Accountant
            else {
               fatalError("Could not downcast to accountant")
           }
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

            guard let employee = employeeManager.employees[indexPath.section][indexPath.row] as? BasicWorker
            else {
                fatalError("Could not downcast to basic worker")
            }

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
