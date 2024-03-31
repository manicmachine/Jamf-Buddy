//
//  ComputersView.swift
//  Jamf Buddy
//
//  Created by Oliphant, Corey Dean on 12/1/23.
//
import SwiftUI

struct ComputerListView: View {
//    @Environment(\.modelContext) var modelContext
    @Environment(JpsService.self) var jpsService: JpsService
    @State var searchText: String = ""
    @State var filteredComputers: [Computer]
    var computers: [Computer]
    
    init(computers: [Computer]) {
        self.filteredComputers = computers
        self.computers = computers
    }
    
    var body: some View {
        NavigationStack {
            LabeledContent("Computers Found", value: computers.count.description)
                .padding(.horizontal)
            List(filteredComputers) { computer in
                NavigationLink(value: computer) {
                    ComputerListCellView(computer: computer)
                }
            }
            .refreshable {
                Task {
                    try await jpsService.getAllComputers()
                }
            }
            .navigationDestination(for: Computer.self) { computer in
                ComputerDetailsView(computer: computer)
            }
            .searchable(text: $searchText, placement: .toolbar)
            .onChange(of: searchText) { oldValue, newValue in
                if newValue.isEmpty {
                    filteredComputers = computers
                } else {
                    filteredComputers = filterComputers(computers: computers, searchText: searchText.lowercased())
                }
            }
        }
    }
    
    func filterComputers(computers: [Computer], searchText: String) -> [Computer] {
        guard !searchText.isEmpty else { return computers }
        
        return computers.filter { computer in
            computer.contains(searchText: searchText)
        }
    }
}

#Preview {
    ComputerListView(computers: ComputersListResults.mockData!.computers)
        .environment(JpsService())
}
