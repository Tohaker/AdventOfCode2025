import Foundation

class Day9: BaseDay {
    private func parseInput() -> [(x: Int, y: Int)] {
        self.input.map { line in

            let components = line.split(separator: ",")
            let x = Int(String(components[0]))!
            let y = Int(String(components[1]))!

            return (x, y)
        }
    }

    private func areaBetweenTwoPoints(_ a: (x: Int, y: Int), _ b: (x: Int, y: Int)) -> Int {
        if a.x == b.x {
            return abs(a.y - b.y + 1)
        }

        if a.y == b.y {
            return abs(a.x - b.x + 1)
        }

        return abs(a.x - b.x + 1) * abs(a.y - b.y + 1)
    }

    override func part1() -> Int {
        let tileFloor = parseInput()
        let tileCombinations = tileFloor.combinations(ofCount: 2).map { combo in
            areaBetweenTwoPoints(combo[0], combo[1])
        }

        return tileCombinations.max(count: 1)[0]
    }
}
