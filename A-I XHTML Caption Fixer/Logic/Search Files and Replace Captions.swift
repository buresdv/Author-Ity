//
//  Search Files.swift
//  A-I XHTML Caption Fixer
//
//  Created by David Bureš on 23.04.2022.
//

import Foundation

func searchFilesForImageIDsAndReplaceCaptions(forID id: Int, atPath path: String, inFiles files: [String], caption caption: String) -> Void {
    /// Go through all the files
    for file in files {
        let absolutePathToFile: String = "\(path)/\(file)"
        
        let contentsOfCurrentFile = loadContentsOfFileIntoString(atPath: absolutePathToFile)
        
        /// If the current file contains any of the possible images, proceed
        if contentsOfCurrentFile.contains(String(id)) {
            writeToConsole(message: "\(file) contains \(id)", format: .success)
            
            /// Set up regex to extract the part that contains the caption
            let regexExtractRelevantCaptionTextPlacement = "(?<=\(id)\\.[A-Za-z]{3}\\\" ).(?:(?! height).)*"
            
            /// Match
            guard let matchedRange = contentsOfCurrentFile.range(of: regexExtractRelevantCaptionTextPlacement, options: .regularExpression) else { return }
            
            let matchedString: String = contentsOfCurrentFile.substring(with: matchedRange)
            
            /// Replace the "Help Image" with the respective caption
            let replacedCaption: String = matchedString.replacingOccurrences(of: "Help Image", with: caption)
            print("""
\(matchedString) ↴
\(replacedCaption)

""")
            
        } else {
            /// Write this if the current file doesn't contain the image
            //writeToConsole(message: "\(file) doesn't contain \(id)", format: .warning)
        }
    }
}
