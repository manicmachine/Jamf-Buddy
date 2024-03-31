//
//  ComputerDetailsGroupListView.swift
//  Jamf Buddy
//
//  Created by Oliphant, Corey Dean on 12/28/23.
//

import SwiftUI

struct GroupListView: View {
    let groups: [GroupMembership]
    
    init(_ groups: [GroupMembership]) {
        self.groups = groups.sorted { $0.groupName < $1.groupName }
    }

    var body: some View {
        List {
            Section {
                ForEach(groups, id: \.groupId) { group in
                    
                    VStack(alignment: .leading) {
                        PropertyView(property: "Group Name", value: group.groupName, allowScrolling: true)
                    
                        HStack(alignment: .top) {
                            PropertyView(property: "Group ID", value: group.groupId)
                            PropertyView(property: "Smart Group", value: group.smartGroup.description)
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    GroupListView(Computer.mockData!.groupMemberships!)
}
