//
//  File.swift
//  musicApp
//
//  Created by Владислав on 26.07.2021.
//

import Foundation

struct File: Codable {
    let embedded: Embedded
    let name: String?
    let type: String?
    
    enum CodingKeys: String, CodingKey {
        case embedded = "_embedded"
        case name
        case type
    }
}

struct Embedded: Codable {
    let sort: String?
    let items: [Item]
    let total: Int?
}

struct Item: Codable {
    let name: String?
    let size: Int?
    let mimeType: String?
    let file: String?
    let path, mediaType, sha256, type: String?
    let md5: String?
    let revision: Int?
}
