//
//  FileManager+DocumentsDirectory.swift
//  NameMomento
//
//  Created by Rishav Gupta on 26/06/23.
//

import Foundation

extension FileManager {
    static var documentsDirectory: URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
}
