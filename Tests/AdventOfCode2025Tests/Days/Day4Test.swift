import Testing

@testable import AdventOfCode2025

@Test func day4part1ex1() {
    let input = """
        ..@@.@@@@.
        @@@.@.@.@@
        @@@@@.@.@@
        @.@@@@..@.
        @@.@@@@.@@
        .@@@@@@@.@
        .@.@.@.@@@
        @.@@@.@@@@
        .@@@@@@@@.
        @.@.@@@.@.
        """.components(separatedBy: "\n")

    #expect(Day4(input: input).part1() == 13)
}

@Test func day4part1() async throws {
    let day = try await Day4(day: 4)

    #expect(day.part1() == 1505)
}

@Test func day4part2ex1() {
    let input = """
        ..@@.@@@@.
        @@@.@.@.@@
        @@@@@.@.@@
        @.@@@@..@.
        @@.@@@@.@@
        .@@@@@@@.@
        .@.@.@.@@@
        @.@@@.@@@@
        .@@@@@@@@.
        @.@.@@@.@.
        """.components(separatedBy: "\n")

    #expect(Day4(input: input).part2() == 43)
}

@Test func day4part2() async throws {
    let day = try await Day4(day: 4)

    #expect(day.part2() == 9182)
}
