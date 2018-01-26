//
//  CSV.swift
//  swift4-pokedex
//
//  Created by FFUF on 18.01.18.
//  Copyright © 2018 FFUF. All rights reserved.
//

import Foundation

class CSV {
    func readDataFrom(file:String) -> String? {
        guard let filepath = Bundle.main.path(forResource: file, ofType: "csv")
            else {
                return nil
        }
        do {
            let contents = try String(contentsOfFile: filepath, encoding: .utf8)
            return contents
        } catch {
            print("File Read Error for file \(filepath)")
            return nil
        }
    }
    
    func cleanRows(data:String) -> [[String]] {
        var cleanFile = data
        cleanFile = cleanFile.replacingOccurrences(of: "\r", with: "\n")
        cleanFile = cleanFile.replacingOccurrences(of: "\n\n", with: "\n")
        
        var result: [[String]] = []
        let rows = cleanFile.components(separatedBy: "\n")
        
        for row in rows {
            let columns = row.components(separatedBy: ",")
            result.append(columns)
        }
        return result
    }
    
    func data(filename:String) -> [[String]] {
        let data = self.readDataFrom(file: filename)
        return cleanRows(data: data!)
    }
}
