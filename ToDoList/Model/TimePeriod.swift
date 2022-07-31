import Foundation

public class TimePeriod {
    let startTime: Date
    let finishTime: Date

    init(startTime: Date, finishTime: Date) {
        self.startTime = startTime
        self.finishTime = finishTime
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
}
