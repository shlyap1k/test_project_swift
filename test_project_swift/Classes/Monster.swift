//
//  Monster.swift
//  test_project_swift
//
//  Created by User on 05.11.2023.
//

import Foundation

class Monster: Entity {
    init(name: String, point: Point) {
        super.init(name: name, health: 50, max_health: 50, defense: 5, healsCount: 0, point: point, damage: 15, type: "Monster")
    }
}
