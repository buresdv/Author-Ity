//
//  main.swift
//  A-I XHTML Caption Fixer
//
//  Created by David Bureš on 22.04.2022.
//

import Foundation


var arguments: [String] = CommandLine.arguments // Get arguments
arguments.remove(at: 0) // Remove first argument, because that's literally just the path to the program itself

if arguments.isEmpty || arguments[0] == "help" { // Check if the user needs help
    writeToConsole(message: """
Jak na to:
fixImageCaptions [cesta ke složce XHTML] [cesta ke složce XML]
""", format: .helper)
    exit(0)
} else { // If they don't need help, proceed
    let xhtmlFolder: String = arguments[0]
    let xmlFolder: String = arguments[1]

    if !existsAtPath(atPath: xhtmlFolder) {
        writeToConsole(message: "Neplatná cesta ke složce XHTML", format: .error)
        exit(0)
    } else {
        // MARK: Load XHTML
        print(findFilesInFolder(inFolder: xhtmlFolder, desiredExtension: ".htm"))
    }

    if !existsAtPath(atPath: xmlFolder) {
        writeToConsole(message: "Neplatná cesta ke složce XML", format: .error)
        exit(0)
    } else {
        // MARK: Load XML
        print(findFilesInFolder(inFolder: xmlFolder, desiredExtension: ".xml"))
    }
}
