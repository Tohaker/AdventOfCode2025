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

    func getUnderneath() -> Coordinate {
        return Coordinate(self.x, self.y + 1)
    }

    func getSplit() -> [Coordinate] {
        return [Coordinate(self.x - 1, self.y + 1), Coordinate(self.x + 1, self.y + 1)]
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

        for y in 1..<self.input.count {
            for beam in beams.filter({ $0.y == y }) {
                // Calculate the next position of the beam
                let nextPosition = beam.getUnderneath()

                // If the position is not a splitter, move the beam
                if !splitters.contains(nextPosition) {
                    beams.insert(nextPosition)
                }
                // If the position is a splitter, split the beam instead and count
                else {
                    beams.formUnion(beam.getSplit())
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
