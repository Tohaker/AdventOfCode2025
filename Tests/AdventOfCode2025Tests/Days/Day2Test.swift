import Testing

@testable import AdventOfCode2025

@Test func day2part1ex1() {
    let input =
        "11-22,95-115,998-1012,1188511880-1188511890,222220-222224,1698522-1698528,446443-446449,38593856-38593862,565653-565659,824824821-824824827,2121212118-2121212124"

    #expect(Day2(input: [input]).part1() == 1_227_775_554)
}

@Test func day2part1() async throws {
    let day: Day2 = try await Day2(day: 2)

    #expect(day.part1() == 55_916_882_972)
}

@Test func day2part2ex1() {
    let input =
        "11-22,95-115,998-1012,1188511880-1188511890,222220-222224,1698522-1698528,446443-446449,38593856-38593862,565653-565659,824824821-824824827,2121212118-2121212124"

    #expect(Day2(input: [input]).part2() == 4_174_379_265)
}

@Test func day2part2() async throws {
    let day: Day2 = try await Day2(day: 2)

    #expect(day.part2() == 76_169_125_915)
}
