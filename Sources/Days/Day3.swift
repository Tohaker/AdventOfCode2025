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
}
