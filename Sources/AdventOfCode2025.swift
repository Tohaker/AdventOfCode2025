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
        default:
            print("Day \(day) has not been solved yet")
        }
    }
}
