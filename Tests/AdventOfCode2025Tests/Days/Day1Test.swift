import Testing

@testable import AdventOfCode2025

@Test func day1part1ex1() {
    let input = """
        L68
        L30
        R48
        L5
        R60
        L55
        L1
        L99
        R14
        L82
        """.components(separatedBy: "\n")

    #expect(Day1(input: input).part1() == 3)
}

@Test func day1part1() async throws {
    let day = try await Day1(day: 1)

    #expect(day.part1() == 1078)
}

@Test func day1part2ex1() {
    let input = """
        L68
        L30
        R48
        L5
        R60
        L55
        L1
        L99
        R14
        L82
        """.components(separatedBy: "\n")

    #expect(Day1(input: input).part2() == 6)
}

@Test func day1part2() async throws {
    let day = try await Day1(day: 1)

    #expect(day.part2() == 6412)
}
