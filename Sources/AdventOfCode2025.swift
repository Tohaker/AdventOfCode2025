import ArgumentParser

@main
struct AdventOfCode2025: ParsableCommand {
    @Option(help: "Specify the day to run")
    public var day: String

    mutating func run() throws {
        switch day {
        case "example":
            print(
                "Part 1: \(Example.part1(input: Example.dayInput))\nPart 2: \(Example.part2(input: Example.dayInput))"
            )
        case "day1":
            let day1 = Day1(filename: "Day1.txt")
            print("Part 1: \(day1.part1())\nPart 2: \(day1.part2())")
        default:
            print("Day \(day) has not been solved yet")
        }
    }
}
