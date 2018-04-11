//
//  CSVReader.swift
//  CSVReader
//
//  Created by Marcel Hagmann on 11.04.18.
//  Copyright © 2018 Marcel Hagmann. All rights reserved.
//

import Foundation

import Foundation

protocol CSVReaderDelegate {
    func changed(progress: Float)
}

class CSVReader<T: Codable> {
    private var csvString: String
    var attributeNames: [String?]
    var elementSeparator: Character = ";"
    var decimalSeparator = ","
    
    var delegate: CSVReaderDelegate?
    
    
    // MARK: - Initializer
    init(csvString: String, attributeNames: [String?]) {
        self.csvString = csvString
        self.attributeNames = attributeNames
    }
    
    public func read() -> [T] {
        let jsonStrings = csvToJSON()
        
        var result: [T] = []
        
        do {
            let decoder = JSONDecoder()
            for json in jsonStrings {
                if let jsonAsData = json.data(using: .utf8) {
                    let genericObject = try decoder.decode(T.self, from: jsonAsData)
                    result.append(genericObject)
                }
            }
        } catch {
            print("CSVReader-transform-ERROR: \(error)")
        }
        return result
    }
    
    
    // MARK: - Instance Methods
    private func decodeCSV() -> [[String]] {
        var decodedResult: [[String]] = []
        
        csvString.enumerateLines { (line, _) in
            let lineElements = line.split(separator: self.elementSeparator, omittingEmptySubsequences: false)
            let lineStringElements = self.castToStringArray(subSequences: lineElements)
            decodedResult.append(lineStringElements)
        }
        
        return decodedResult
    }
    
    private func csvToJSON() -> [String] {
        var completedRows = 0
        var jsonResults: [String] = []
        
        let rows = decodeCSV()
        for row in rows {
            var attributeDict: [String:String] = [:]
            for index in 0..<attributeNames.count {
                if let attribute = attributeNames[index] {
                    let key = attribute
                    let value = row[index]
                    if !value.isEmpty {
                        attributeDict[key] = value
                    }
                }
            }
            let jsonString = toJSON(dictionary: attributeDict)
            jsonResults.append(jsonString)
            
            completedRows += 1
            let progress = Float(completedRows) / Float(rows.count)
            delegate?.changed(progress: progress)
        }
        
        return jsonResults
    }
    
    
    // MARK: - Help Methods
    private func castToStringArray(subSequences: [Substring.SubSequence]) -> [String] {
        var result: [String] = []
        for subSequence in subSequences {
            let string = String(subSequence)
            result.append(string)
        }
        return result
    }
    
    private func toJSON(dictionary: [String:String]) -> String {
        let numberFormatter = NumberFormatter()
        numberFormatter.decimalSeparator = decimalSeparator
        
        var json = "{"
        var elementCounter = 0
        
        for (key, value) in dictionary {
            let value = value.replacingOccurrences(of: "\"", with: "\\\"") // to accept " in a the text
            
            if let intValue = Int(value) {
                json.append("\"\(key)\":\(intValue)")
            } else if let doubleValue = numberFormatter.number(from: value) {
                json.append("\"\(key)\":\(doubleValue)")
            } else {
                json.append("\"\(key)\":\"\(value)\"")
            }
            
            if elementCounter < dictionary.count - 1 {
                json.append(",")
            }
            
            elementCounter += 1
        }
        
        json.append("}")
        return json
    }
    
}
