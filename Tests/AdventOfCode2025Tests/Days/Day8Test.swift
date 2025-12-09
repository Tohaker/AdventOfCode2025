import Testing

@testable import AdventOfCode2025

@Test func day8part1ex1() {
    let input = """
        162,817,812
        57,618,57
        906,360,560
        592,479,940
        352,342,300
        466,668,158
        542,29,236
        431,825,988
        739,650,466
        52,470,668
        216,146,977
        819,987,18
        117,168,530
        805,96,715
        346,949,466
        970,615,88
        941,993,340
        862,61,35
        984,92,344
        425,690,689
        """.components(separatedBy: "\n")

    let day = Day8(input: input)
    day.connections = 10

    #expect(day.part1() == 40)
}

@Test func day8part1() async throws {
    let day = try await Day8(day: 8)

    #expect(day.part1() == 68112)
}
