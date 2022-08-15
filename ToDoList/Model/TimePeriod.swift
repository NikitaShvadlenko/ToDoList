import Foundation

public class TimePeriod: NSObject {

    let startTime: Date
    let finishTime: Date

    init(startTime: Date, finishTime: Date) {
        self.startTime = startTime
        self.finishTime = finishTime
    }

    public required init?(coder: NSCoder) {
        startTime = coder.decodeObject(forKey: Keys.startTime.rawValue) as? Date ?? Date()
        finishTime = coder.decodeObject(forKey: Keys.finishTime.rawValue) as? Date ?? Date()
        super.init()
    }
}

// MARK: Public Methods
extension TimePeriod {
    public func formatTimePeriodAsString() -> String {
        let dateFormater = DateFormatter()
        dateFormater.dateFormat = "hh:mm"
        let startTimeString = dateFormater.string(from: startTime)
        let finishTimeString = dateFormater.string(from: finishTime)
        let timePeriodString = String(startTimeString + " - " + finishTimeString)

        return timePeriodString
    }

    enum Keys: String {
        case startTime
        case finishTime
    }
}

// MARK: NSCoding
extension TimePeriod: NSCoding {
    public func encode(with coder: NSCoder) {
        coder.encode(startTime, forKey: Keys.startTime.rawValue)
        coder.encode(finishTime, forKey: Keys.finishTime.rawValue)
    }
}
