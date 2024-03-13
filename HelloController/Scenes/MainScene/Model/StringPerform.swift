//
//  StringPerform.swift
//  HelloController
//
//  Created by Andrei Shpartou on 13/03/2024.
//

import Foundation

enum StringPerform {
    static let wordForCompare = "hello"
    static func performStringHandle(with string: inout String) -> String {
        var newString = ""
        for character in wordForCompare {
            if let charIndex = string.firstIndex(of: character) {
                newString += String(string.remove(at: charIndex))
            }
        }
        return newString
    }
}
