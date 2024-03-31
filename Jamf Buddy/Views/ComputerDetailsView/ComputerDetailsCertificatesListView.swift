//
//  ComputerDetailsCertificatesListView.swift
//  Jamf Buddy
//
//  Created by Oliphant, Corey Dean on 12/27/23.
//

import SwiftUI

struct ComputerDetailsCertificatesListView: View {
#if os(iOS)
    @Environment(\.horizontalSizeClass) private var horizontalSizeClass
    private var isCompact: Bool { horizontalSizeClass == .compact }
#else
    private let isCompact = false
#endif
    
    @State private var sortOrder = [KeyPathComparator(\ComputerCertificate.commonName)]
    let certificates: [ComputerCertificate]
    
    init(_ certificates: [ComputerCertificate]) {
        self.certificates = certificates.sorted { $0.commonName < $1.commonName}
    }
    
    var body: some View {
        Table(certificates, sortOrder: $sortOrder) {
            TableColumn("Common Name", value: \.commonName) { certificate in
                VStack(alignment: .leading) {
                    PropertyView(property: "Common Name", value: certificate.commonName)
                    
                    if isCompact {
                        PropertyView(property: "Certificate Status", value: certificate.certificateStatus ?? "")
                        PropertyView(property: "Issued Date", value: certificate.issuedDate?.getRelativeAndCompleteString() ?? "")
                        PropertyView(property: "Expiration Date", value: certificate.expirationDate?.getRelativeAndCompleteString() ?? "")
                        PropertyView(property: "Life Cycle Status", value: certificate.lifecycleStatus ?? "")
                        PropertyView(property: "Subject Name", value: certificate.subjectName ?? "", allowScrolling: true)
                        PropertyView(property: "Serial Number", value: certificate.serialNumber ?? "")
                        PropertyView(property: "SHA 1 Fingerprint", value: certificate.sha1Fingerprint ?? "")
                        
                        PropertyView(property: "Identity", value: certificate.identity?.description ?? "")
                        PropertyView(property: "Username", value: certificate.username ?? "")
                    }
                }
            }
        }
    }
}

#Preview {
    ComputerDetailsCertificatesListView(Computer.mockData!.certificates!)
}
