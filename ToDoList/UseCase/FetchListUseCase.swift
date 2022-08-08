import Foundation
import UseCase

final class FetchListUseCase: AsyncUseCase<Void, [[Employee]]> {
    private let listProvider: ListProviderProtocol

    init(listProvider: ListProviderProtocol) {
        self.listProvider = listProvider
    }

    override func executeAsync(_ requestArgument: Void, completion: @escaping (Result<[[Employee]], Error>) -> Void) {
        listProvider.fetchEmployeeData(completion: completion)
    }
}
