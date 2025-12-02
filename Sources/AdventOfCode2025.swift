import ArgumentParser

@main
struct AdventOfCode2025: AsyncParsableCommand {
    @Option(help: "Specify the day to run")
    public var day: String

    mutating func run() async throws {
        switch day {
        case "day1":
            let day1 = try await Day1(day: 1)
            print("Part 1: \(day1.part1())\nPart 2: \(day1.part2())")
        case "day2":
            let day2 = try await Day2(day: 2)
            print("Part 1: \(day2.part1())\nPart 2: \(day2.part2())")
        default:
            print("Day \(day) has not been solved yet")
        }
    }
}
