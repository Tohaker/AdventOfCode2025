import Foundation

class Day3: BaseDay {
    override func part1() -> Int {
        var total = 0

        for bank in self.input {
            let batteries = bank.map { Int(String($0))! }
            if batteries.count == 0 {
                continue
            }

            let batteriesToConsider = batteries[..<(batteries.count - 1)]

            let highestFirstValue = batteriesToConsider.max()!
            let firstIndex = batteries.firstIndex(of: highestFirstValue)

            let nextBatteriesToConsider = batteries[(firstIndex! + 1)...]
            let highestSecondValue = nextBatteriesToConsider.max()!

            total += Int("\(highestFirstValue)\(highestSecondValue)")!
        }

        return total
    }

    override func part2() -> Int {
        var total = 0
        let batteriesToTurnOn = 12

        for bank in self.input {
            let batteries = bank.map { Int(String($0))! }
            if batteries.count == 0 {
                continue
            }

            var firstIndex = 0
            var joltage: [Int] = []

            for i in (1...batteriesToTurnOn).reversed() {
                let batteriesToConsider = batteries[firstIndex...(batteries.count - i)]
                let highestValue = batteriesToConsider.max()!
                joltage.append(highestValue)
                firstIndex = batteriesToConsider.firstIndex(of: highestValue)! + 1
            }

            total += Int(joltage.map { String($0) }.joined())!
        }

        return total
    }
}
