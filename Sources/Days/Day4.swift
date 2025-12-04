import Foundation

class Day4: BaseDay {
    private func extend(grid: [[String]]) -> [[String]] {
        var extendedGrid: [[String]] = []

        let width = grid[0].count

        extendedGrid.append([String](repeating: ".", count: width + 2))

        for line in grid {
            var newLine = line
            newLine.insert(".", at: 0)
            newLine.append(".")
            extendedGrid.append(newLine)
        }

        extendedGrid.append([String](repeating: ".", count: width + 2))

        return extendedGrid
    }

    private func countAdjacentRolls(grid: [[String]], x: Int, y: Int) -> Int {
        let checks = [
            grid[y][x - 1],
            grid[y][x + 1],
            grid[y - 1][x],
            grid[y + 1][x],
            grid[y - 1][x - 1],
            grid[y - 1][x + 1],
            grid[y + 1][x - 1],
            grid[y + 1][x + 1],
        ]

        return checks.filter { $0 == "@" }.count
    }

    private func markAccessibleRolls(extendedGrid: [[String]]) -> [(x: Int, y: Int)] {
        var rolls: [(x: Int, y: Int)] = []

        let height = extendedGrid.count - 2
        let width = extendedGrid[0].count - 2

        for y in 1...height {
            for x in 1...width {
                if extendedGrid[y][x] == "@"
                    && countAdjacentRolls(grid: extendedGrid, x: x, y: y) < 4
                {
                    rolls.append((x: x, y: y))
                }
            }
        }

        return rolls
    }

    override func part1() -> Int {
        let originalGrid = self.input.map { $0.map { String($0) } }
        let extendedGrid = extend(grid: originalGrid)

        return markAccessibleRolls(extendedGrid: extendedGrid).count
    }

    override func part2() -> Int {
        let originalGrid = self.input.map { $0.map { String($0) } }
        var extendedGrid = extend(grid: originalGrid)

        var rollsRemoved = 0

        while true {
            let accessibleRolls = markAccessibleRolls(extendedGrid: extendedGrid)

            if accessibleRolls.count == 0 {
                break
            }

            for roll in accessibleRolls {
                extendedGrid[roll.y][roll.x] = "."
            }

            rollsRemoved += accessibleRolls.count
        }

        return rollsRemoved
    }
}
