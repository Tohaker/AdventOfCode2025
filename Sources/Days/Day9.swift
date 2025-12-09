import Foundation

struct Coord: Hashable & Equatable {
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

    static func == (lhs: Coord, rhs: Coord) -> Bool {
        lhs.x == rhs.x && lhs.y == rhs.y
    }
}

class Day9: BaseDay {
    private func parseInput() -> [Coord] {
        self.input.map { line in

            let components = line.split(separator: ",")
            let x = Int(String(components[0]))!
            let y = Int(String(components[1]))!

            return Coord(x, y)
        }
    }

    private func areaBetweenTwoPoints(_ a: Coord, _ b: Coord) -> Int {
        if a.x == b.x {
            return abs(a.y - b.y + 1)
        }

        if a.y == b.y {
            return abs(a.x - b.x + 1)
        }

        return abs(a.x - b.x + 1) * abs(a.y - b.y + 1)
    }

    private func tilesBetweenTwoPoints(_ a: Coord, _ b: Coord) -> [Coord] {
        let minX = min(a.x, b.x)
        let maxX = max(a.x, b.x)

        let minY = min(a.y, b.y)
        let maxY = max(a.y, b.y)

        var tiles: [Coord] = []

        for y in minY...maxY {
            for x in minX...maxX {
                tiles.append(Coord(x, y))
            }
        }

        return tiles
    }

    private func floodFill(node: Coord, edges: [Coord], filled: inout [Coord]) {
        if edges.contains(node) || filled.contains(node) {
            return
        }

        filled.append(node)

        floodFill(node: Coord(node.x, node.y + 1), edges: edges, filled: &filled)
        floodFill(node: Coord(node.x, node.y - 1), edges: edges, filled: &filled)
        floodFill(node: Coord(node.x + 1, node.y), edges: edges, filled: &filled)
        floodFill(node: Coord(node.x - 1, node.y), edges: edges, filled: &filled)
    }

    private func mapGreenTiles(tileFloor: [Coord]) -> Set<Coord> {
        // Find edges first, edges are connected in the order of the red tiles
        var edges: [Coord] = []
        var wrappedTileFloor = Array(tileFloor)
        wrappedTileFloor.append(tileFloor[0])

        for i in 0..<wrappedTileFloor.count - 1 {
            edges.append(
                contentsOf: tilesBetweenTwoPoints(wrappedTileFloor[i], wrappedTileFloor[i + 1]))
        }

        // Fill in between edges - mind the gap
        var filled: [Coord] = []
        // This will probably take us inside to the first corner
        let firstNode = Coord(tileFloor[0].x + 1, tileFloor[0].y + 1)

        floodFill(node: firstNode, edges: edges, filled: &filled)

        return Set(filled).union(Set(edges))
    }

    override func part1() -> Int {
        let tileFloor = parseInput()
        let tileCombinations = tileFloor.combinations(ofCount: 2).map { combo in
            areaBetweenTwoPoints(combo[0], combo[1])
        }

        return tileCombinations.max(count: 1)[0]
    }

    override func part2() -> Int {
        let redTiles = parseInput()
        let greenTiles = mapGreenTiles(tileFloor: redTiles)

        let tileCombinations = redTiles.combinations(ofCount: 2).filter({ combo in
            tilesBetweenTwoPoints(combo[0], combo[1]).allSatisfy(greenTiles.contains)
        }).map { combo in
            areaBetweenTwoPoints(combo[0], combo[1])
        }

        return tileCombinations.max(count: 1)[0]
    }
}
