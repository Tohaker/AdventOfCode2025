import Foundation

struct Machine {
    let indicatorLights: Int
    let buttons: [Int]
    let joltage: String

    init(line: String) {
        let sectionsRegex = #/\[(?<indicator>.+)\] (?<buttons>\(.+\))+ \{(?<joltage>.+)\}/#

        if let match = line.firstMatch(of: sectionsRegex) {
            self.joltage = String(match.joltage)

            let indicatorStr = match.indicator
            let buttonsStr = match.buttons

            self.indicatorLights = Int(
                indicatorStr.replacingOccurrences(of: ".", with: "0")
                    .replacingOccurrences(of: "#", with: "1"), radix: 2)!

            self.buttons = buttonsStr.split(separator: " ").map({
                $0.firstMatch(of: #/\((?<button>.*?)\)/#)!.button.split(separator: ",").map {
                    Int(String($0.first!))!
                }
            }).map { positions in
                var val: Int = 0

                for i in positions {
                    val ^= 1 << (indicatorStr.count - i - 1)
                }

                return val
            }
        } else {
            self.indicatorLights = 0
            self.buttons = []
            self.joltage = ""
        }
    }
}

class Day10: BaseDay {
    override func part1() -> Int {
        var total = 0

        let machines = self.input.map { Machine(line: $0) }

        for machine in machines {
            let combinations = machine.buttons.combinations(ofCount: 1...machine.buttons.count)

            for combination in combinations {
                if combination.reduce(0, ^) == machine.indicatorLights {
                    total += combination.count
                    break
                }
            }
        }

        return 0
    }
}
