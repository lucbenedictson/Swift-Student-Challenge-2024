//
//  CapsuleTextView.swift
//  To Do List
//
//  Created by Luc Benedictson on 2024-02-25.
//

import SwiftUI

struct CapsuleTextView: View {
    let keyword: String
    let clicked: Bool
    let color: Color
    @ScaledMetric(relativeTo: .headline) var paddingWidth = 10 //Enusre text remains inside capsule no matter the font size
    var body: some View {
        Text(keyword)
            .font(.headline)
            .foregroundColor(.black)
            .padding(paddingWidth)
            .background(clicked ? color.opacity(0.75) : color.opacity(0.35), in: Capsule())
            .lineLimit(1)
    }
}
