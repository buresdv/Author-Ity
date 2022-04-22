//
//  Read File.swift
//  A-I XHTML Caption Fixer
//
//  Created by David Bureš on 22.04.2022.
//

import Foundation

func loadContentsOfFileIntoString(atPath path: String) -> String {
    return try! String(contentsOfFile: path, encoding: .utf8)
}
