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
        var count = 0

        if grid[y][x - 1] == "@" {
            count += 1
        }

        if grid[y][x + 1] == "@" {
            count += 1
        }

        if grid[y - 1][x] == "@" {
            count += 1
        }

        if grid[y + 1][x] == "@" {
            count += 1
        }

        if grid[y - 1][x - 1] == "@" {
            count += 1
        }

        if grid[y - 1][x + 1] == "@" {
            count += 1
        }

        if grid[y + 1][x - 1] == "@" {
            count += 1
        }

        if grid[y + 1][x + 1] == "@" {
            count += 1
        }

        return count
    }

    private func countAccessibleRolls(extendedGrid: [[String]]) -> Int {
        var total = 0

        let height = extendedGrid.count - 2
        let width = extendedGrid[0].count - 2

        for y in 1...height {
            for x in 1...width {
                if extendedGrid[y][x] == "@"
                    && countAdjacentRolls(grid: extendedGrid, x: x, y: y) < 4
                {
                    total += 1
                }
            }
        }

        return total
    }

    override func part1() -> Int {
        let originalGrid = self.input.map { $0.map { String($0) } }
        let extendedGrid = extend(grid: originalGrid)

        return countAccessibleRolls(extendedGrid: extendedGrid)
    }
}
