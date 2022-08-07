import Foundation

protocol ListScreenControllerInput: AnyObject {
    func reloadList()
}

protocol ListScreenControllerOutput: AnyObject {
    func viewDidLoad(_ view: ListScreenControllerInput)
    func viewDidTapAddEmployeeButton(_ view: ListScreenControllerInput)
}
