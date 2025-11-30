import Testing

@testable import AdventOfCode2025

@Test("Ends at floor 0", arguments: ["(())", "()()"]) func part1ex1(_ input: String) {
    #expect(Example.part1(input: input) == 0)
}

@Test("Ends at floor 3", arguments: ["(((", "(()(()(", "))((((("]) func part1ex2(_ input: String) {
    #expect(Example.part1(input: input) == 3)
}

@Test("Ends at floor -1", arguments: ["())", "))("]) func part1ex3(_ input: String) {
    #expect(Example.part1(input: input) == -1)
}

@Test("Ends at floor -3", arguments: [")))", ")())())"]) func part1ex4(_ input: String) {
    #expect(Example.part1(input: input) == -3)
}

@Test("Enters basement at position 1") func part2ex1() {
    #expect(Example.part2(input: ")") == 1)
}

@Test("Enters basement at position 5") func part2ex2() {
    #expect(Example.part2(input: "()())") == 5)
}

@Test("Part 1 is 74") func part1() {
    #expect(Example.part1(input: Example.dayInput) == 74)
}

@Test("Part 2 is 1795") func part2() {
    #expect(Example.part2(input: Example.dayInput) == 1795)
}
