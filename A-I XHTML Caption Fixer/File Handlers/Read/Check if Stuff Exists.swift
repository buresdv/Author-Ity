//
//  Check if File Exists.swift
//  A-I XHTML Caption Fixer
//
//  Created by David Bureš on 22.04.2022.
//

import Foundation

func existsAtPath(atPath path: String) -> Bool {
    if AppConstants.fileManager.fileExists(atPath: path) {
        return true
    } else {
        return false
    }
}
