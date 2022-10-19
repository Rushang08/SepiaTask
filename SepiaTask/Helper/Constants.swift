//
//  Constants.swift
//  SepiaTask
//
//  Created by Rushang Prajapati on 18/10/22.
//

import UIKit


extension String {
    
    static let jsonFileconfig: String = "config"
    static let jsonFilepetsList: String = "pets_list"
    static let jsonFileFormat: String = "json"
    static let blank: String = ""
    static let alertTitle: String = "Oops!!"
    static let validHoursRegex: String = "^[A-Z]-[A-Z]\\s{1}(\\d{1,2}:\\d{2})\\s{1}-\\s{1}(\\d{1,2}:\\d{2})$"
    static let invalidHours: String = "You are out of your working hours! Please try again!!! "
    static let somethingWentWrong: String = "Something went wrong. Please try again."
    func toJSON() -> Any? {
        guard let data = self.data(using: .utf8, allowLossyConversion: false) else { return nil }
        return try? JSONSerialization.jsonObject(with: data, options: .mutableContainers)
    }
}

extension UIStoryboard {
    @objc static var main: UIStoryboard {
        get {
            return UIStoryboard(name: "Main", bundle: nil)
        }
    }
}

extension Formatter {
    static let today: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = .init(identifier: "en_US_POSIX")
        dateFormatter.defaultDate = Calendar.current.startOfDay(for: Date())
        dateFormatter.dateFormat = "HH:mm"
        return dateFormatter
        
    }()
}

extension UIViewController {
    func popupAlert(title: String?, message: String?, actionTitles:[String?], actions:[((UIAlertAction) -> Void)?]) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        for (index, title) in actionTitles.enumerated() {
            let action = UIAlertAction(title: title, style: .default, handler: actions[index])
            alert.addAction(action)
        }
        self.present(alert, animated: true, completion: nil)
    }
}

public func fetchWorkingHours() -> String {
    
    // Wrong config file has been sent to me, modified and applied the code.  commit:
    
    if let path = Bundle.main.path(forResource: String.jsonFileconfig, ofType: String.jsonFileFormat) {
        do {
            let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
            let jsonResult = try JSONSerialization.jsonObject(with: data, options: .mutableLeaves)
            if let jsonResult = jsonResult as? Dictionary<String, AnyObject>, let settings = jsonResult["settings"] as? [String : Any] {
                return "\(settings["workHours"]!)"
            }

        } catch {
            return " "
        }
    }
    return " "
}
