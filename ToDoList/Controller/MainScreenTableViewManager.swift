import UIKit
import SharedResources

protocol ListTableViewManagerProtocol {
    func setEmployees(_ employees: [[Employee]])
}

class MainScreenTableViewManager: NSObject {
    private var employees = [[Employee]]()
}

// MARK: - ListTableViewManagerProtocol
extension MainScreenTableViewManager: ListTableViewManagerProtocol {
    func setEmployees(_ employees: [[Employee]]) {
        self.employees = employees
    }
}

extension MainScreenTableViewManager: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        employees.count
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        employees[section].count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        switch employees[indexPath.section][indexPath.row].employeeType {
        case .management:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "\(ManagerCell.self)", for: indexPath) as? ManagerCell
            else {
                fatalError("Could not deque cell")
            }
            guard let manager = employees[indexPath.section][indexPath.row] as? Manager
            else {
                fatalError("Could not downcast to manager")
            }
            cell.configureCell(name: manager.name, salary: manager.salary, meetingHours: manager.meetingHours.formatTimePeriodAsString())
            return cell

        case .accountant:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "\(AccountantCell.self)", for: indexPath) as? AccountantCell
            else {
                fatalError("Could not deque cell")
            }
            guard let accountant = employees[indexPath.section][indexPath.row]  as? Accountant
            else {
                fatalError("Could not downcast to accountant")
            }
            cell.configureCell(
                name: accountant.name,
                salary: accountant.salary,
                accountantType: accountant.accountantType,
                deskNumber: Int(accountant.deskNumber),
                breakHours: accountant.breakHours.formatTimePeriodAsString()
            )
            return cell

        case .basicWorker:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "\(EmployeeCell.self)", for: indexPath) as? EmployeeCell
            else {
                fatalError("Could not deque cell")
            }

            guard let employee = employees[indexPath.section][indexPath.row] as? BasicWorker
            else {
                fatalError("Could not downcast to basic worker")
            }

            cell.setupEmployeeTypeLabel(
                name: employee.name,
                salary: employee.salary,
                deskNumber: Int(employee.deskNumber),
                breakHours: employee.breakHours.formatTimePeriodAsString()
            )
            return cell
        }
    }
}

// MARK: - UITableViewDelegate
extension MainScreenTableViewManager: UITableViewDelegate {
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {

        var sectionTitle: String = ""
        var image: UIImage?

        switch employees[section][0].employeeType {

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

    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let mover = employees[sourceIndexPath.section].remove(at: sourceIndexPath.row)
        employees[destinationIndexPath.section].insert(mover, at: destinationIndexPath.row)
    }

    func tableView(_ tableView: UITableView, targetIndexPathForMoveFromRowAt sourceIndexPath: IndexPath, toProposedIndexPath proposedDestinationIndexPath: IndexPath) -> IndexPath {
        switch sourceIndexPath.section != proposedDestinationIndexPath.section {

        case true:
            return sourceIndexPath

        case false:
            return proposedDestinationIndexPath
        }
    }
}

// MARK: UITableViewDragDelegate
extension MainScreenTableViewManager: UITableViewDragDelegate {
    func tableView(_ tableView: UITableView, itemsForBeginning session: UIDragSession, at indexPath: IndexPath) -> [UIDragItem] {
        let dragItem = UIDragItem(itemProvider: NSItemProvider())
        dragItem.localObject = employees[indexPath.row]
        return [ dragItem ]
    }
}
