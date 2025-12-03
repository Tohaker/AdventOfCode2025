import ArgumentParser

@main
struct AdventOfCode2025: AsyncParsableCommand {
    @Option(help: "Specify the day to run")
    public var day: String

    mutating func run() async throws {
        var dayImplementation: BaseDay

        switch day {
        case "1":
            dayImplementation = try await Day1(day: 1)
        case "2":
            dayImplementation = try await Day2(day: 2)
        case "3":
            dayImplementation = try await Day3(day: 3)
        default:
            print("Day \(day) has not been solved yet")
            return
        }

        print("Part 1: \(dayImplementation.part1())\nPart 2: \(dayImplementation.part2())")
    }
}
