# CSVReader

A small project to convert a CSV Document into a model :)

## Usage

1. Create a model which implements the `Codable` protocol.
```swift
struct Ingredient: Codable {
var name_ger: String
var kcal: Double
var kcal_unit: String
}
```

2. Your CSV-file could look like this.

| ID        | name D           | energy kcal  | energy unit |
|:-------------:|:-------------:|:-----:|:------:
| 381      | Banane, roh | 95 | kilocalorie |

Now you create an array with the attribtues you want to read. Each element represents a column in your CSV-file. Columns you do not want to read you can insert a `nil`.

```swift
let attributesToReadFromTable = [nil, "name_ger", "kcal", "kcal_unit"]
```

### ⚠️ The names in the attribute array have to be the same as in your model!

3. Initialize and adjust the CSVReader.
```swift
let csvReader = CSVReader<Ingredient>(csvString: csvString, attributeNames: attributesToReadFromTable)
csvReader.decimalSeparator = ","
csvReader.elementSeparator = ";"
```

4. Implement the CSVReaderDelegate to track the proccess (if needed).
```swift
extension ViewController: CSVReaderDelegate {
func changed(progress: Float) {
progressView.progress = progress
}
}
```

5. Call the `.read()` method. 
```swift
let result = csvReader.read()
```

### Thank you - free data ♥️
Thank you for the free data - [www.naehrwertdaten.ch](http://www.naehrwertdaten.ch)
