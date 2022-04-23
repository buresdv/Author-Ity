//
//  Search Files.swift
//  A-I XHTML Caption Fixer
//
//  Created by David Bureš on 23.04.2022.
//

import Foundation

func searchFilesForImageIDs(forID id: Int, atPath path: String, inFiles files: [String]) -> Void {
    for file in files {
        let absolutePathToFile: String = "\(path)/\(file)"
        
        let contentsOfCurrentFile = loadContentsOfFileIntoString(atPath: absolutePathToFile)
        
        if contentsOfCurrentFile.contains(String(id)) {
            writeToConsole(message: "\(file) contains \(id)", format: .success)
        } else {
            writeToConsole(message: "\(file) doesn't contain \(id)", format: .warning)
        }
    }
}
