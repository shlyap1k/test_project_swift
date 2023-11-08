//
//  Player.swift
//  test_project_swift
//
//  Created by User on 05.11.2023.
//

import Foundation


class Player: Entity {
    init(name: String, point: Point) {
        super.init(name: name, health: 200, max_health: 200, defense: 15, healsCount: 4, point: point, damage: 25, type: "Player")
    }
    override var description: String {
        return "Player\nName: \(name)\nHealth: \(health)/\(max_health)\nDefense: \(defense)\nDamage: \(damage)\nHeals: \(healsCount)\nPoint: \(point)\n"
    }
}
