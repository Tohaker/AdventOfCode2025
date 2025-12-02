import Foundation

class Day2: BaseDay {
    let invalidProductId = #/^(\d+)\1$/#
    let invalidProductIdPart2 = #/^(\d+)\1+$/#

    private func createProductIDRange(start: Int, end: Int) -> [Int] {
        var range: [Int] = []

        for i in start...end {
            range.append(i)
        }

        return range
    }

    private func matchProductIds(regex: Regex<(Substring, Substring)>) -> Int {
        var total = 0
        let ranges = self.input[0].components(separatedBy: ",")

        for range in ranges {
            let values = range.components(separatedBy: "-").map { Int($0) }
            let productIds = createProductIDRange(start: values[0]!, end: values[1]!)

            for productId in productIds {
                if try! regex.wholeMatch(in: String(productId)) != nil {
                    total += productId
                }
            }
        }

        return total
    }

    override func part1() -> Int {
        return matchProductIds(regex: invalidProductId)
    }

    override func part2() -> Int {
        return matchProductIds(regex: invalidProductIdPart2)
    }
}
