import Foundation

class BaseDay {
    let input: [String]

    init(input: [String]) {
        self.input = input
    }

    init(filename: String) {
        self.input =
            try! String(
                contentsOf: URL(fileURLWithPath: FileManager().currentDirectoryPath)
                    .appendingPathComponent(
                        "Inputs/\(filename)"),
                encoding: .utf8
            ).components(separatedBy: "\n")
    }

    func part1() -> Int {
        return 0
    }

    func part2() -> Int {
        return 0
    }
}
