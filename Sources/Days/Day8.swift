import Foundation

struct JunctionBox: Hashable {
    let x: Int
    let y: Int
    let z: Int

    init(_ line: String) {
        let coordRegex = #/(?<x>\d+),(?<y>\d+),(?<z>\d+)/#

        if let match = line.firstMatch(of: coordRegex) {
            self.x = Int(String(match.x))!
            self.y = Int(String(match.y))!
            self.z = Int(String(match.z))!
        } else {
            self.x = 0
            self.y = 0
            self.z = 0
        }
    }

    public func distance(to: JunctionBox) -> Double {
        return
            sqrt(
                (pow(Double(self.x - to.x), 2.0) + pow(Double(self.y - to.y), 2.0)
                    + pow(Double(self.z - to.z), 2.0)))
    }

    func hash(into hasher: inout Hasher) {
        hasher.combine(self.x)
        hasher.combine(self.y)
        hasher.combine(self.z)
    }
}

class Day8: BaseDay {
    public var connections = 1000

    private func parseJunctionBoxes() -> [JunctionBox] {
        var boxes: [JunctionBox] = []

        for line in self.input {
            boxes.append(JunctionBox(line))
        }

        return boxes
    }

    private func distancesBetweenJunctionBoxes(_ junctionBoxes: [JunctionBox]) -> [(
        a: JunctionBox, b: JunctionBox, distance: Double
    )] {
        var distances:
            [(
                a: JunctionBox, b: JunctionBox, distance: Double
            )] = []

        for jb1 in junctionBoxes {
            let remainingBoxes = junctionBoxes.filter { $0 != jb1 }

            for jb2 in remainingBoxes {
                if !distances.contains(where: {
                    $0.a == jb2 && $0.b == jb1
                }) {
                    distances.append((a: jb1, b: jb2, distance: jb1.distance(to: jb2)))
                }
            }
        }

        // Sort pairs by their distances from each other
        distances.sort { $0.distance < $1.distance }

        return distances
    }

    override func part1() -> Int {
        let junctionBoxes = parseJunctionBoxes()

        let pairs = distancesBetweenJunctionBoxes(junctionBoxes)

        var circuits = junctionBoxes.map { Set([$0]) }

        for i in 0..<connections {
            let closestPair = pairs[i]

            // Sort by size of circuit each round
            circuits.sort { $0.count > $1.count }
        }

        return circuits[0..<3].reduce(1, { $0 * $1.count })

    }
}
