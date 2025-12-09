import Testing

@testable import AdventOfCode2025

@Test func day9part1ex1() {
    let input = """
        7,1
        11,1
        11,7
        9,7
        9,5
        2,5
        2,3
        7,3
        """.components(separatedBy: "\n")

    #expect(Day9(input: input).part1() == 50)
}

@Test func day9part1() async throws {
    let day = try await Day9(day: 9)

    #expect(day.part1() == 4_763_932_976)
}

@Test func day9part2ex1() {
    let input = """
        7,1
        11,1
        11,7
        9,7
        9,5
        2,5
        2,3
        7,3
        """.components(separatedBy: "\n")

    #expect(Day9(input: input).part2() == 24)
}

@Test func day9part2() async throws {
    let day = try await Day9(day: 9)

    #expect(day.part2() == 0)
}
