//
//  main.swift
//  A-I XHTML Caption Fixer
//
//  Created by David Bureš on 22.04.2022.
//

import Foundation

var arguments: [String] = CommandLine.arguments // Get arguments
arguments.remove(at: 0) // Remove first argument, because that's literally just the path to the program itself

let helpMessage: String = """
Jak na to:
fixImageCaptions [cesta ke složce XHTML] [cesta ke složce XML]
"""

if arguments.isEmpty || arguments[0] == "help" { // Check if the user needs help
    writeToConsole(message: helpMessage, format: .helper)
    exit(0)
    
} else if arguments.count != 2 { // Check if they put enough arguments in
    writeToConsole(message: "Neplatný počet argumentů", format: .error)
    writeToConsole(message: helpMessage, format: .helper)
    exit(0)
    
} else { // If they don't need help, proceed
    
    let xhtmlFolder: String = arguments[0]
    let xmlFolder: String = arguments[1]
    
    if !existsAtPath(atPath: xmlFolder) { // XML has to be handled first because it contains all the captions
        writeToConsole(message: "Neplatná cesta ke složce XML", format: .error)
        exit(0)
    }
    
    if !existsAtPath(atPath: xhtmlFolder) {
        writeToConsole(message: "Neplatná cesta ke složce XHTML", format: .error)
        exit(0)
        
    }
    
    // MARK: XML
    // MARK: Load XML
    let loadedXMLFile: String = findFilesInFolder(inFolder: xmlFolder, desiredExtension: ".xml").first ?? "Soubor to našlo, ale nepovedlo se ho převést na cestu. wtf jak se to stalo" // Get the name of the XML file from the array
    let loadedXMLFilePath: String = "\(xmlFolder)/\(loadedXMLFile)"
    
    let XMLContents: String = loadContentsOfFileIntoString(atPath: loadedXMLFilePath)
    
    let extractedIDsAndCaptions = parseXML(rawXML: XMLContents)
    
    
    // MARK: XHTML
    // MARK: Load XHTML
    let loadedXHTMLFiles: [String] = findFilesInFolder(inFolder: xhtmlFolder, desiredExtension: ".htm")
    
    // print(loadedXHTMLFiles)
    
    for dictionaryItem in extractedIDsAndCaptions {
        searchFilesForImageIDsAndReplaceCaptions(forID: dictionaryItem.key, atPath: xhtmlFolder, inFiles: loadedXHTMLFiles, caption: dictionaryItem.value)
    }
}
