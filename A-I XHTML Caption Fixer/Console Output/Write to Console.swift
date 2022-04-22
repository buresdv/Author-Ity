//
//  Write to Console.swift
//  A-I XHTML Caption Fixer
//
//  Created by David Bureš on 22.04.2022.
//

import Foundation

enum TextDecoration: String {
    case header     = ">>>"
    case helper     = "<?>"
    case success    = "<✔>"
    case error      = "<X>"
    case warning    = "<!>"
    case systemInfo = "..."
    case none       = ""
}

func writeToConsole(message: String, format: TextDecoration) {
    print("\(format.rawValue) \(message)")
}
