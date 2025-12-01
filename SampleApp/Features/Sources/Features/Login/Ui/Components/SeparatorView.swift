//
//  SeparatorView.swift
//  Features
//
//  Created by Marcin Wawrzyniak on 29/11/2025.
//

import SwiftUI

public struct SeparatorView: View {
    var label: String = "lub"

    public init(label: String = "lub") {
        self.label = label
    }

    public var body: some View {
        HStack {
            Rectangle().fill(.quaternary).frame(height: 1)
            Text(label)
                .foregroundStyle(.secondary)
            Rectangle().fill(.quaternary).frame(height: 1)
        }
        .padding(.vertical, 4)
    }
}

#Preview {
    SeparatorView()
}
