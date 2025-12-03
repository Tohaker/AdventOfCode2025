import Foundation

class Day3: BaseDay {
    private func turnOn(batteries: Int) -> Int {
        var total = 0

        for bank in self.input {
            let batteriesInBank = bank.map { Int(String($0))! }
            if batteriesInBank.count == 0 {
                continue
            }

            var firstIndex = 0
            var joltage: [Int] = []

            for i in (1...batteries).reversed() {
                let batteriesToConsider = batteriesInBank[firstIndex...(batteriesInBank.count - i)]
                let highestValue = batteriesToConsider.max()!
                joltage.append(highestValue)
                firstIndex = batteriesToConsider.firstIndex(of: highestValue)! + 1
            }

            total += Int(joltage.map { String($0) }.joined())!
        }

        return total
    }

    override func part1() -> Int {
        return turnOn(batteries: 2)
    }

    override func part2() -> Int {
        return turnOn(batteries: 12)
    }
}
