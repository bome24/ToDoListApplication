//
//  Task.swift
//  ToDoAppRxSwift
//
//  Created by BoMin on 2023/03/08.
//

import Foundation

enum Priority: Int {
    case high
    case medium
    case low
}

struct Task {
    let title: String
    let priority: Priority
}
