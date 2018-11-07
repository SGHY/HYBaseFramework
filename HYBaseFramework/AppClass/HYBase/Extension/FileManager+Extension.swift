
//
//  FileManager+Extension.swift
//  HYBaseFramework
//
//  Created by moovpay on 2018/11/6.
//  Copyright © 2018 moovpay. All rights reserved.
//

import Foundation
extension FileManager{
    static func URLForDirectory(directory:SearchPathDirectory) -> URL {
        return FileManager.default.urls(for: directory, in: FileManager.SearchPathDomainMask.userDomainMask).last!
    }
    
    static func pathForDirectory(directory:SearchPathDirectory) -> String {
        return NSSearchPathForDirectoriesInDomains(directory, FileManager.SearchPathDomainMask.userDomainMask, true).first!
    }
    
    static func documentsURL() -> URL {
        return FileManager.URLForDirectory(directory: FileManager.SearchPathDirectory.documentDirectory)
    }
    
    static func documentsPath() -> String {
        return FileManager .pathForDirectory(directory: FileManager.SearchPathDirectory.documentDirectory)
    }
    
    static func libraryURL() -> URL {
        return FileManager.URLForDirectory(directory: FileManager.SearchPathDirectory.libraryDirectory)
    }
    static func libraryPath() -> String {
        return FileManager .pathForDirectory(directory: FileManager.SearchPathDirectory.libraryDirectory)
    }
    
    static func cachesURL() -> URL {
        return FileManager.URLForDirectory(directory: FileManager.SearchPathDirectory.cachesDirectory)
    }
    
    static func cachesPath() -> String {
        return FileManager .pathForDirectory(directory: FileManager.SearchPathDirectory.cachesDirectory)
    }
}
