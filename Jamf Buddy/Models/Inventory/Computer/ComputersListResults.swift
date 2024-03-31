//
//  ComputersListResults.swift
//  Jamf Buddy
//
//  Created by Oliphant, Corey Dean on 12/12/23.
//

import Foundation

struct ComputersListResults: Codable {
    let totalCount: Int
    let computers: [Computer]
    
    private enum CodingKeys: String, CodingKey {
        case totalCount, computers = "results"
    }
}

#if DEBUG
extension ComputersListResults {
    static let mockData: ComputersListResults? = {
        if let path = Bundle.main.path(forResource: "MockComputerListData", ofType: "json") {
            do {
                // Read the data from the file
                let data = try Data(contentsOf: URL(fileURLWithPath: path))
                
                // Decode the JSON data
                let decoder = JSONDecoder()
                decoder.dateDecodingStrategy = .formatted(.iso8601)
                
                return try! decoder.decode(ComputersListResults.self, from: data)
            } catch {
                // Handle error while reading or decoding JSON
                print("Error reading JSON file: \(error)")
                return nil
            }
        } else {
            print("JSON file not found.")
            return nil
        }
    }()
}
#endif
