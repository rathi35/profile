//
//  DateExtension.swift
//  Profile

import UIKit

extension Date {
    static let dateFormatter = DateFormatter()
    
    func dateByAddingyears(_ year: Int) -> Date? {
        guard let date = Calendar.current.date(byAdding: .year, value: year, to: self) else {
            return nil
        }
        return date
    }
    
    func dateString(with dateFormat: String) -> String {
        Date.dateFormatter.dateFormat = dateFormat
        return Date.dateFormatter.string(from: self)
    }
}
