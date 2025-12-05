import Testing

@testable import AdventOfCode2025

@Test func day5part1ex1() {
    let input = """
        3-5
        10-14
        16-20
        12-18

        1
        5
        8
        11
        17
        32
        """.components(separatedBy: "\n")

    #expect(Day5(input: input).part1() == 3)
}

@Test func day5part1() async throws {
    let day = try await Day5(day: 5)

    #expect(day.part1() == 617)
}

@Test func day5part2ex1() {
    let input = """
        3-5
        10-14
        16-20
        12-18

        1
        5
        8
        11
        17
        32
        """.components(separatedBy: "\n")

    #expect(Day5(input: input).part2() == 14)
}

@Test func day5part2ex2() {
    let input = """
        1-10
        3-5

        1
        5
        8
        11
        17
        32
        """.components(separatedBy: "\n")

    #expect(Day5(input: input).part2() == 10)
}

@Test func day5part2() async throws {
    let day = try await Day5(day: 5)

    #expect(day.part2() == 338_258_295_736_104)
}
