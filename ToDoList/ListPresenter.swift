import Foundation

class ListPresenter {
   weak var viewController: ListScreenControllerInput?
}

extension ListPresenter: ListScreenControllerOutput {
    func viewDidLoad(_ view: ListScreenControllerInput) {
        view.reloadList()
    }

    func viewDidTapAddEmployeeButton(_ view: ListScreenControllerInput) {
        print("Tapped Employee Button")
    }
}
