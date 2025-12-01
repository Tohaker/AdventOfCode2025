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

@Test func day1part1() {
    #expect(Day1(filename: "Day1.txt").part1() == 1078)
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

@Test func day1part2() {
    #expect(Day1(filename: "Day1.txt").part2() == 6412)
}
