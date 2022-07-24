import Foundation

class EmployeeManager: NSObject {
    let employees: [EmployeeModel]

    override init() {
        employees = [EmployeeModel(name: "Vasia", description: "works hard")]
    }
}
