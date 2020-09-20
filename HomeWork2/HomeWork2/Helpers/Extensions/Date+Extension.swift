import Foundation

extension Date {
    func currentDate() -> String {
        let formatter = DateFormatter()
        formatter.setLocalizedDateFormatFromTemplate("yyyy-MM-dd")
        return formatter.string(from: self)
    }
}
