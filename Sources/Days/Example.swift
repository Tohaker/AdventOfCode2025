import Foundation

struct Example {
    static let dayInput: String = try! String(
        contentsOf: URL(fileURLWithPath: FileManager().currentDirectoryPath).appendingPathComponent(
            "Inputs/Example.txt"),
        encoding: .utf8)

    static func part1(input: String) -> Int {
        var floor = 0

        for index in input.indices {
            if input[index] == "(" {
                floor += 1
            }

            if input[index] == ")" {
                floor -= 1
            }
        }

        return floor
    }

    static func part2(input: String) -> Int {
        var floor = 0

        for index in input.indices {
            if input[index] == "(" {
                floor += 1
            }

            if input[index] == ")" {
                floor -= 1
            }

            if floor == -1 {
                return input.distance(from: input.startIndex, to: index) + 1
            }
        }

        return 0
    }
}
