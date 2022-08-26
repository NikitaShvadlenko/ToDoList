import Foundation
import UseCase
import CoreData
import UIKit

class ListPresenter {
    var managedObjectContext: NSManagedObjectContext?
    weak var viewController: ListScreenControllerInput?
    var tableViewManager: MainScreenTableViewManager?
}

extension ListPresenter: ListScreenControllerOutput {

    func viewDidTapAddEmployeeButton(_: ListScreenControllerInput) {
        print("Tapped Employee Button")
    }

    func viewDidLoad(_ view: ListScreenControllerInput) {
    }
}

// MARK: - Private Methods
extension ListPresenter {
    
}
