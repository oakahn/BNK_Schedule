import Foundation

enum DateFormat: String {
    case ddmmyyyy = "dd/MM/yyyy"
    case fullDateTimeTH = "dd-MM-yyyy HH:mm:ss"
    case serviceDateFormat = "yyyy-MM-dd HH:mm:ss.SSS"
    case receipt = "dd MMMM yyyy - HH:mm:ss น."
    case home = "dd MMMM yyyy"
    case getTransaction = "yyyy/MM/dd"
    case homeCollectionCell = "dd MMM yyyy"
}

struct DateFormatComponent {
    
    private var dateString: String!
    static let shareInstance = DateFormatComponent()
    
    private func format(dateString: String, sourcePattern: DateFormat, destinationPattern: DateFormat) -> String {
        var formatedDate: String = ""
        if !dateString.isEmpty {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = sourcePattern.rawValue
            var locale = Locale(identifier: "th")
            dateFormatter.locale = locale

            guard let dateFormat = dateFormatter.date(from: dateString) else {
                return formatedDate
            }

            if LanguageComponent.currentLanguage() == LanguageComponent.thai {
                dateFormatter.dateFormat = destinationPattern.rawValue
                let gregorianCalendar = Calendar(identifier: Calendar.Identifier.buddhist)
                locale = Locale(identifier: "th")
                dateFormatter.calendar = gregorianCalendar
                dateFormatter.locale = locale
                formatedDate = dateFormatter.string(from: dateFormat).uppercased()
            } else {
                dateFormatter.dateFormat = destinationPattern.rawValue
                formatedDate = dateFormatter.string(from: dateFormat).uppercased()
            }
        }
        return formatedDate
    }
    
    func getCurrentDate(destinationPattern: DateFormat) -> String {
        var formatedDate: String = ""
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "th")
        dateFormatter.dateFormat = DateFormat.fullDateTimeTH.rawValue
        formatedDate = format(dateString: dateFormatter.string(from: Date()), sourcePattern: DateFormat.fullDateTimeTH,
                              destinationPattern: destinationPattern)
        return formatedDate
    }
    
    
    func getFullDateTimeTH(destinationPattern: DateFormat, date: Date) -> String {
        var formatedDate: String = ""
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "th")
        dateFormatter.dateFormat = DateFormat.fullDateTimeTH.rawValue
        formatedDate = format(dateString: dateFormatter.string(from: date), sourcePattern: DateFormat.fullDateTimeTH,
                              destinationPattern: destinationPattern)
        return formatedDate
    }
    
}

struct LanguageComponent {
    static let thai = "th"
    static let english = "en"
    
    static func currentLanguage() -> String {
        return thai
    }
}
