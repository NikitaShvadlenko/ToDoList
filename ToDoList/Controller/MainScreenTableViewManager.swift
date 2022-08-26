import UIKit
import SharedResources

protocol ListTableView {
    func setupTableView ()
}

class MainScreenTableViewManager: NSObject {
    var employees: [Employee] = []
    var managers: [Manager] = []
    var basicWorkers: [BasicWorker] = []
    var accountants: [Accountant] = []
}

extension MainScreenTableViewManager: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        EmployeeType.allCases.count
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        2
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        UITableViewCell()
    }

    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        switch editingStyle {
        case .delete:
            print("Delete")

        default:
            print("Action Not Implemented")
        }
    }
}

// MARK: - UITableViewDelegate
extension MainScreenTableViewManager: UITableViewDelegate {
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {

        var sectionTitle: String = ""
        var image: UIImage?

        switch EmployeeType.allCases[section] {

        case .manager:
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
//        let mover = employees[sourceIndexPath.section].remove(at: sourceIndexPath.row)
//        employees[destinationIndexPath.section].insert(mover, at: destinationIndexPath.row)
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
       // dragItem.localObject = employees[indexPath.row]
        return [ dragItem ]
    }
}
