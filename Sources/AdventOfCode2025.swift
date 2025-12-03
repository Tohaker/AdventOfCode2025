import ArgumentParser

@main
struct AdventOfCode2025: AsyncParsableCommand {
    @Option(help: "Specify the day to run")
    public var day: String

    mutating func run() async throws {
        switch day {
        case "1":
            let day = try await Day1(day: 1)
            print("Part 1: \(day.part1())\nPart 2: \(day.part2())")
        case "2":
            let day = try await Day2(day: 2)
            print("Part 1: \(day.part1())\nPart 2: \(day.part2())")
        case "3":
            let day = try await Day3(day: 3)
            print("Part 1: \(day.part1())\nPart 2: \(day.part2())")
        default:
            print("Day \(day) has not been solved yet")
        }
    }
}
