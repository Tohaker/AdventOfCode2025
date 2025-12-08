import Foundation

struct Coordinate: Hashable {
    let x: Int
    let y: Int

    init(_ x: Int, _ y: Int) {
        self.x = x
        self.y = y
    }

    func hash(into hasher: inout Hasher) {
        hasher.combine(self.x)
        hasher.combine(self.y)
    }
}

class Day7: BaseDay {
    private func locateStartingBeam() -> Coordinate {
        let firstLine = self.input.first!

        let range = firstLine.range(of: "S")!

        let x = firstLine.distance(from: firstLine.startIndex, to: range.lowerBound)

        return Coordinate(x, 0)
    }

    private func locateSplitters() -> [Coordinate] {
        var splitters: [Coordinate] = []

        for i in stride(from: 2, to: self.input.count, by: 2) {
            let line = self.input[i]

            for (x, c) in line.split(separator: "").enumerated() {
                if c == "^" {
                    splitters.append(Coordinate(x, i))
                }
            }
        }

        return splitters
    }

    private func countTachyonSplits(start: Coordinate, splitters: [Coordinate]) -> Int {
        var count = 0

        var beams = Set<Coordinate>([Coordinate(start.x, 1)])

        for y in 2..<self.input.count {
            // Filter out beams that aren't directly above this line
            for beam in beams.filter({ $0.y + 1 == y }) {
                if splitters.contains(where: { $0.x == beam.x && $0.y == beam.y + 1 }) {
                    beams.formUnion([Coordinate(beam.x - 1, y + 1), Coordinate(beam.x + 1, y + 1)])

                    count += 1
                }
            }
        }

        return count

    }

    override func part1() -> Int {
        let start = locateStartingBeam()
        let splitters = locateSplitters()

        return countTachyonSplits(start: start, splitters: splitters)
    }
}
