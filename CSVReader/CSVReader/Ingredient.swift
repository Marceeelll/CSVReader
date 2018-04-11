//
//  Ingredient.swift
//  CSVReader
//
//  Created by Marcel Hagmann on 11.04.18.
//  Copyright © 2018 Marcel Hagmann. All rights reserved.
//

import Foundation

struct Ingredient: Codable {
    var name_ger: String
    var kcal: Double
    var kcal_unit: String
    var protein: Double
    var protein_unit: String
    var water: Double?
    var water_unit: String?
    var carbohydrates: Double
    var carbohydrates_unit: String
    var sugars: Double?
    var sugars_unit: String?
    var fat: Double
    var fat_unit: String
    var cholesterol: Double?
    var cholesterol_unit: String?
    var monounsaturated: Double?
    var monounsaturated_unit: String?
    var saturated: Double?
    var saturated_unit: String?
    var polyunsaturated: Double?
    var polyunsaturated_unit: String?
    var vitamin_A: Double?
    var vitamin_A_unit: String?
    var vitamin_b1: Double?
    var vitamin_b1_unit: String?
    var vitamin_b2: Double?
    var vitamin_b2_unit: String?
    var vitamin_b6: Double?
    var vitamin_b6_unit: String?
    var vitamin_b12: Double?
    var vitamin_b12_unit: String?
    var folate: Double?
    var folate_unit: String?
    var pantothenic_acid: Double?
    var pantothenic_acid_unit: String?
    var vitamin_C: Double?
    var vitamin_C_unit: String?
    var vitamin_D: Double?
    var vitamin_D_unit: String?
    var vitamin_E: Double?
    var vitamin_E_unit: String?
    var sodium: Double?
    var sodium_unit: String?
    var potassium: Double?
    var potassium_unit: String?
    var chloride: Double?
    var chloride_unit: String?
    var calcium: Double?
    var calcium_unit: String?
    var magnesium: Double?
    var magnesium_unit: String?
    var phosphorus: Double?
    var phosphorus_unit: String?
    var iron: Double?
    var iron_unit: String?
    var iodide: Double?
    var iodide_unit: String?
    var zinc: Double?
    var zinc_unit: String?
}
