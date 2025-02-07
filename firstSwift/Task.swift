//
//  Task.swift
//  firstSwift
//
//  Created by Bích Ngọc on 5/2/25.
//

import Foundation

struct Task: Identifiable {
    var id = UUID()
    var title: String
    var isCompleted: Bool = false 
}
