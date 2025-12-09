import Algorithms
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

    private func createJunctionBoxPairs(_ junctionBoxes: [JunctionBox]) -> [(
        a: JunctionBox, b: JunctionBox, distance: Double
    )] {
        return junctionBoxes.combinations(ofCount: 2).map { combination in
            let lhs = combination[0]
            let rhs = combination[1]
            let distance = lhs.distance(to: rhs)

            return (lhs, rhs, distance)
        }.min(count: self.connections, sortedBy: { lhs, rhs in lhs.distance < rhs.distance })
    }

    override func part1() -> Int {
        let junctionBoxes = parseJunctionBoxes()

        let pairs = createJunctionBoxPairs(junctionBoxes)

        var circuits: [Set<JunctionBox>] = []

        for closestPair in pairs {

            // Find all circuits with at least one of the pair
            let circuitsContainingBoxes = circuits.filter {
                $0.contains(closestPair.a) || $0.contains(closestPair.b)
            }

            // if more than one exists, join them together
            if circuitsContainingBoxes.count > 1 {
                let newCircuit = Set<JunctionBox>(
                    circuitsContainingBoxes.flatMap {
                        $0
                    })

                circuits.removeAll { circuitsContainingBoxes.contains($0) }
                circuits.append(newCircuit)
            } else {
                if let circuit = circuits.firstIndex(where: { $0.contains(closestPair.a) }) {
                    circuits[circuit].insert(closestPair.b)
                } else if let circuit = circuits.firstIndex(where: { $0.contains(closestPair.b) }) {
                    circuits[circuit].insert(closestPair.a)
                } else {
                    circuits.append(Set([closestPair.a, closestPair.b]))
                }
            }
        }

        return circuits.sorted(by: { $0.count > $1.count })[0..<3].reduce(1, { $0 * $1.count })

    }
}
