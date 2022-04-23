//
//  Parse XML.swift
//  A-I XHTML Caption Fixer
//
//  Created by David Bureš on 22.04.2022.
//

import Foundation
import SwiftyXMLParser

func parseXML(rawXML: String) -> Any {
    let parsedXML = try! XML.parse(rawXML)
    
    let pathToCaption = ["AuthorIT", "Objects", "File"]
    
    if case .failure(let error) = parsedXML[pathToCaption] {
        print(error)
    }
    
    for hit in parsedXML[pathToCaption] {
        print(hit["PrintCaptionTitle"].text)
    }

    
    return parsedXML
}
