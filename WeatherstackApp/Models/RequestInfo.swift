//
//  RequestInfo.swift
//  WeatherstackApp
//
//  Created by Richardier on 01/06/2022.
//

import Foundation

// MARK: - Request
struct Request: Codable {
    let type: String
    let query: String
    let language: String
    let unit: String
}
