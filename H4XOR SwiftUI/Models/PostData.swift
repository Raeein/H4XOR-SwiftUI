//
//  PostData.swift
//  H4XOR SwiftUI
//
//  Created by Raeein Bagheri on 2021-12-05.
//

import Foundation

struct Results: Decodable {
    let hits: [Post]
}

struct Post: Decodable, Identifiable {
    var id: String {
        return objectID
    }
    let objectID: String
    let points: Int
    let title: String
    let url: String?
}
