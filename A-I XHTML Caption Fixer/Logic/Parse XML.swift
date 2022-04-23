//
//  Parse XML.swift
//  A-I XHTML Caption Fixer
//
//  Created by David Bureš on 22.04.2022.
//

import Foundation
import SwiftyXMLParser

func parseXML(rawXML: String) -> [Int: String] {
    let parsedXML = try! XML.parse(rawXML)
    
    let pathToCaption = ["AuthorIT", "Objects", "File"]
    
    var finalDictionary = [Int: String]()
    
    if case .failure(let error) = parsedXML[pathToCaption] {
        fatalError("Posral se parser: \(error)")
    } else {
        for hit in parsedXML[pathToCaption] {
            let imageID: Int! = Int(hit["Object", "VersionRoot"].text!)
            let captionText: String? = hit["PrintCaptionTitle"].text
            
            if captionText != nil {
                finalDictionary[imageID] = captionText
            }
        }
    }
    print(finalDictionary)
    return finalDictionary
}
