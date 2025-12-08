import Foundation

class Day6: BaseDay {
    private func parseWorksheet() -> [(numbers: [Int], symbol: String)] {
        var calculations: [(numbers: [Int], symbol: String)] = []

        for line in self.input {
            for (index, match) in line.matches(of: #/(?<num>\d+)|(?<sym>\*|\+)/#).enumerated() {
                if let numMatch = match.output.num {
                    let num = Int(numMatch)!

                    if calculations.indices.contains(index) {
                        calculations[index].numbers.append(num)
                    } else {
                        calculations.append((numbers: [num], symbol: ""))
                    }
                }

                if let symMatch = match.output.sym {
                    calculations[index].symbol = String(symMatch)
                }
            }
        }

        return calculations
    }

    private func parseWorksheetProperly() -> [(numbers: [Int], symbol: String)] {
        var calculations: [(numbers: [Int], symbol: String)] = []

        let lineLength = self.input[0].count
        let lineCount = self.input.count

        var currentCalculation: (numbers: [Int], symbol: String) = ([], "")

        for i in (0..<lineLength).reversed() {
            var num = ""

            for j in 0..<lineCount {
                let char = self.input[j][self.input[j].index(self.input[j].startIndex, offsetBy: i)]

                if char == "+" || char == "*" {
                    currentCalculation.symbol = String(char)
                } else {
                    num += String(char)
                }
            }

            let number = num.trimmingCharacters(in: [" "])

            if number.count > 0 {
                currentCalculation.numbers.append(Int(number)!)
            } else {
                calculations.append(currentCalculation)
                currentCalculation.numbers = []
                currentCalculation.symbol = ""
            }
        }

        calculations.append(currentCalculation)

        return calculations
    }

    private func calculateTotal(calculations: [(numbers: [Int], symbol: String)]) -> Int {
        var total = 0

        for (numbers, symbol) in calculations {
            if symbol == "+" {
                total += numbers.reduce(0, +)
            } else if symbol == "*" {
                total += numbers.reduce(1, *)
            }
        }

        return total
    }

    override func part1() -> Int {
        let calculations = parseWorksheet()

        return calculateTotal(calculations: calculations)
    }

    override func part2() -> Int {
        let calculations = parseWorksheetProperly()

        return calculateTotal(calculations: calculations)
    }
}
