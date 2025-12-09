import Algorithms
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
        case "4":
            dayImplementation = try await Day4(day: 4)
        case "5":
            dayImplementation = try await Day5(day: 5)
        case "6":
            dayImplementation = try await Day6(day: 6)
        case "8":
            dayImplementation = try await Day8(day: 8)
        case "9":
            dayImplementation = try await Day9(day: 9)
        default:
            print("Day \(day) has not been solved yet")
            return
        }

        print("Part 1: \(dayImplementation.part1())")
        print("Part 2: \(dayImplementation.part2())")
    }
}
