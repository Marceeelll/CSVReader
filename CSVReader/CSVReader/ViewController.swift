//
//  ViewController.swift
//  CSVReader
//
//  Created by Marcel Hagmann on 11.04.18.
//  Copyright © 2018 Marcel Hagmann. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var progressView: UIProgressView!
    
    // Thank you for the free data ♥️ - http://www.naehrwertdaten.ch
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let path = Bundle.main.path(forResource: "Generic Foods-Table", ofType: "txt"),
            let csvString = try? String(contentsOfFile: path) else { return }
        
        let csvReader = CSVReader<Ingredient>(csvString: csvString, attributeNames: attributesToReadFromTable)
        csvReader.decimalSeparator = ","
        csvReader.elementSeparator = ";"
        csvReader.delegate = self
        
        
        print("Start")
        let startTime = Date()
        
        let ingredientsFromCSV = csvReader.read()
        
        let endTime = Date()
        let timeToConvert = endTime.timeIntervalSince(startTime)
        print("END - Parsed \(ingredientsFromCSV.count) entries in \(timeToConvert) seconds!\n")
        
        printIngredients(ingredientsFromCSV)
    }
    
    func printIngredients(_ ingredients: [Ingredient]) {
        for ingredient in ingredients {
            print("\(ingredient.kcal) \(ingredient.kcal_unit) - \(ingredient.name_ger)")
        }
    }
    
}

extension ViewController: CSVReaderDelegate {
    func changed(progress: Float) {
        progressView.progress = progress
    }
}







let attributesToReadFromTable = ["ID",    nil,    nil,    "name_ger",    nil,    nil,    nil,    nil,    nil,    nil,
                                 nil,    nil,    nil,    nil,    nil,    nil,    nil,    nil,    nil,    nil,
                                 nil,    "kcal",    "kcal_unit",    nil,    nil,    nil,    "protein",    "protein_unit",    nil,    nil,
                                 nil,    nil,    nil,    nil,    nil,    nil,    "water",    "water_unit",    nil,    nil,
                                 nil,    "carbohydrates",    "carbohydrates_unit",    nil,    nil,    nil,    nil,    nil,    nil,    nil,
                                 nil,    "sugars",    "sugars_unit",    nil,    nil,    nil,    nil,    nil,    nil,    nil,
                                 nil,    "fat",    "fat_unit",    nil,    nil,    nil,    "cholesterol",    "cholesterol_unit",    nil,    nil,
                                 nil,    "monounsaturated",    "monounsaturated_unit",    nil,    nil,    nil,    "saturated",    "saturated_unit",    nil,    nil,
                                 nil,    "polyunsaturated",    "polyunsaturated_unit",    nil,    nil,    nil,    "vitamin_A",    "vitamin_A_unit",    nil,    nil,
                                 nil,    nil,    nil,    nil,    nil,    nil,    nil,    nil,    nil,    nil,
                                 nil,    nil,    nil,    nil,    nil,    nil,    "vitamin_b1",    "vitamin_b1_unit",    nil,    nil,
                                 nil,    "vitamin_b2",    "vitamin_b2_unit",    nil,    nil,    nil,    "vitamin_b6",    "vitamin_b6_unit",    nil,    nil,
                                 nil,    "vitamin_b12",    "vitamin_b12_unit",    nil,    nil,    nil,    nil,    nil,    nil,    nil,
                                 nil,    "folate",    "folate_unit",    nil,    nil,    nil,    "pantothenic_acid",    "pantothenic_acid_unit",   nil,     nil,    nil,
                                 "vitamin_C",    "vitamin_C_unit",    nil,    nil,    nil,    "vitamin_D",    "vitamin_D_unit",    nil,    nil,    nil,
                                 "vitamin_E",    "vitamin_E_unit",    nil,    nil,    nil,    "sodium",    "sodium_unit",    nil,    nil,    nil,
                                 "potassium",    "potassium_unit",    nil,    nil,    nil,    "chloride",    "chloride_unit",    nil,    nil,    nil,
                                 "calcium",    "calcium_unit",    nil,    nil,    nil,    "magnesium",    "magnesium_unit",    nil,    nil,    nil,
                                 "phosphorus",    "phosphorus_unit",    nil,    nil,    nil,    "iron",    "iron_unit",    nil,    nil,    nil,
                                 "iodide",    "iodide_unit",    nil,    nil,    nil,    "zinc",    "zinc_unit"]
