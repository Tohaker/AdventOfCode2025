import Foundation

class Day5: BaseDay {
    let rangeRegex = #/(?<start>\d+)-(?<end>\d+)/#

    private func getFreshRangesAndIngredients() -> (
        ranges: [(start: Int, end: Int)], ingredients: Set<Int>
    ) {
        var ranges: [(start: Int, end: Int)] = []
        var ingredients = Set<Int>()

        for line in self.input {
            if let match = line.firstMatch(of: rangeRegex) {
                let start = Int(String(match.start))!
                let end = Int(String(match.end))!

                ranges.append((start, end))
            } else {
                if line != "" {
                    ingredients.update(with: Int(line)!)
                }
            }
        }

        return (ranges, ingredients)
    }

    private func getEntireFreshRange() -> Int {
        var ranges: [(start: Int, end: Int)] = []

        for line in self.input {
            if let match = line.firstMatch(of: rangeRegex) {
                let start = Int(String(match.start))!
                let end = Int(String(match.end))!

                ranges.append((start, end))
            } else {
                break
            }
        }

        // Sort by the start values, so they're always in order
        ranges.sort { $0.start < $1.start }

        var dedupedRanges = [ranges[0]]

        for range in ranges[1...] {
            // If the start value is lower than the last range's end value,
            // replace the last range's end value with this range's end value
            if range.start <= dedupedRanges.last!.end {
                dedupedRanges.indices.last.map {
                    dedupedRanges[$0].end = max(range.end, dedupedRanges[$0].end)
                }
            }  // Otherwise, just append the range
            else {
                dedupedRanges.append(range)
            }
        }

        var count = 0

        for range in dedupedRanges {
            count += range.end - range.start + 1
        }

        return count
    }

    override func part1() -> Int {
        let (ranges, ingredients) = getFreshRangesAndIngredients()

        var count = 0

        for ingredient in ingredients {
            for range in ranges {
                if range.start <= ingredient && range.end >= ingredient {
                    count += 1
                    break
                }
            }
        }

        return count
    }

    override func part2() -> Int {
        return getEntireFreshRange()
    }
}
