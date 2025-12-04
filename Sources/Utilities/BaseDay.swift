import DotEnv
import Foundation
import FoundationNetworking

class BaseDay {
    let input: [String]

    init(input: [String]) {
        self.input = input
    }

    init(filename: String) {
        self.input =
            try! String(
                contentsOf: URL(fileURLWithPath: FileManager().currentDirectoryPath)
                    .appendingPathComponent(
                        "Inputs/\(filename)"),
                encoding: .utf8
            ).split(whereSeparator: \.isNewline).map { String($0) }
    }

    init(day: Int) async throws {
        let path = ".env"

        if ProcessInfo.processInfo.environment["CI"] == nil {
            try DotEnv.load(path: path)
        }

        let url = URL(string: "https://adventofcode.com/2025/day/\(day)/input")!

        if let session = ProcessInfo.processInfo.environment["SESSION_COOKIE"] {
            var request = URLRequest(url: url)
            request.httpMethod = "GET"
            request.setValue("session=\(session)", forHTTPHeaderField: "Cookie")

            let (data, _) = try await URLSession.shared.data(for: request)

            self.input =
                String(bytes: data, encoding: String.Encoding.utf8)?.split(
                    whereSeparator: \.isNewline
                ).map { String($0) } ?? []
        } else {
            throw NSError(domain: "Missing SESSION_COOKIE environment variable", code: 400)
        }
    }

    func part1() -> Int {
        return 0
    }

    func part2() -> Int {
        return 0
    }
}
