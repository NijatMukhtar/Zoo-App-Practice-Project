//
//  Models.swift
//  LectureProject_1
//
//  Created by Nijat Mukhtarov on 28.06.22.
//

import Foundation

struct Zoopark: Codable {
    var name: String
    var image: String
    var timeInterval: String
    var xCoord: Float
    var yCoord: Float
    var workDays: [String]
    var animals: [Animal]
    var id: Int
}

struct Animal: Codable {
    var name: String
    var about: String
    var image: String
    var id: Int
}
 
