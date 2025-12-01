import Foundation

class Day1: BaseDay {
    let directionAndNumber = #/(?<dir>L|R)(?<clicks>\d+)/#

    private func part(_ isPart2: Bool) -> Int {
        var count = 0
        var position = 50

        for rotation in self.input {

            if let match = rotation.firstMatch(of: directionAndNumber) {
                let direction: String = String(match.dir)
                let clicks = Int(String(match.clicks)) ?? 0

                for i in 0..<clicks {
                    position = direction == "L" ? position - 1 : position + 1

                    if position > 99 {
                        position = 0
                    }

                    if position < 0 {
                        position = 99
                    }

                    if position == 0 && (isPart2 || i == clicks - 1) {
                        count += 1
                    }
                }
            }
        }

        return count
    }

    override func part1() -> Int {
        return part(false)
    }

    override func part2() -> Int {
        return part(true)
    }
}
