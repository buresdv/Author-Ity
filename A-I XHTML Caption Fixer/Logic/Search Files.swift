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
            let regexExtractRelevantCaptionTextPlacement = "(?<=\(id)\\.[A-Za-z]{3}\\\" ).(?:(?! height).)*"
            
            guard let matchedRange = contentsOfCurrentFile.range(of: regexExtractRelevantCaptionTextPlacement, options: .regularExpression) else { return }
            
            print(contentsOfCurrentFile.substring(with: matchedRange))
            
        } else {
            //writeToConsole(message: "\(file) doesn't contain \(id)", format: .warning)
        }
    }
}

func returnIndexedMemoryRange(index: Int, completionHandler: @escaping (_ result: Int) -> Void) {
    
}
