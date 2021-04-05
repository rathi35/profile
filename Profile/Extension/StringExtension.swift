//
//  StringExtension.swift
//  Profile
//
//
//
import UIKit

extension String {
    static func getClassString(_ class: AnyClass) -> String {
        String(describing: `class`.self)
    }
}
