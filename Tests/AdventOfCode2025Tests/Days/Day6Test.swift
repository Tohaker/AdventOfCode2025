import Testing

@testable import AdventOfCode2025

@Test func day6part1ex1() {
    let input = """
        123 328  51 64 
         45 64  387 23 
          6 98  215 314
        *   +   *   +  
        """.components(separatedBy: "\n")

    #expect(Day6(input: input).part1() == 4_277_556)
}

@Test func day6part1() async throws {
    let day = try await Day6(day: 6)

    #expect(day.part1() == 8_108_520_669_952)
}

@Test func day6part2ex1() {
    let input = """
        123 328  51 64 
         45 64  387 23 
          6 98  215 314
        *   +   *   +  
        """.components(separatedBy: "\n")

    #expect(Day6(input: input).part2() == 3_263_827)
}

@Test func day6part2() async throws {
    let day = try await Day6(day: 6)

    #expect(day.part2() == 11_708_563_470_209)
}
