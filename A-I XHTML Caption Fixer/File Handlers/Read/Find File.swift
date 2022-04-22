//
//  Find File.swift
//  A-I XHTML Caption Fixer
//
//  Created by David Bureš on 22.04.2022.
//

import Foundation

func findFilesInFolder(inFolder folder: String, desiredExtension: String) -> [String] {
    let enumerator = AppConstants.fileManager.enumerator(atPath: folder)
    
    let filePaths = enumerator?.allObjects as! [String]
    let filePathsOfDesiredExtensions = filePaths.filter{$0.contains(desiredExtension)}
    
    return filePathsOfDesiredExtensions
}
