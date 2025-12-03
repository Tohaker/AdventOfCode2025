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
