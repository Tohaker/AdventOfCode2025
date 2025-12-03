import Testing

@testable import AdventOfCode2025

@Test func day3part1ex1() {
    let input = """
        987654321111111
        811111111111119
        234234234234278
        818181911112111
        """.components(separatedBy: "\n")

    #expect(Day3(input: input).part1() == 357)
}

@Test func day3part1() async throws {
    let day = try await Day3(day: 3)

    #expect(day.part1() == 17158)
}

@Test func day3part2ex1() {
    let input = """
        987654321111111
        811111111111119
        234234234234278
        818181911112111
        """.components(separatedBy: "\n")

    #expect(Day3(input: input).part2() == 3_121_910_778_619)
}

@Test func day3part2() async throws {
    let day = try await Day3(day: 3)

    #expect(day.part2() == 170_449_335_646_486)
}
