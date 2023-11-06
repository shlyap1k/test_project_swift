//
//  Entity.swift
//  test_project_swift
//
//  Created by User on 05.11.2023.
//

import Foundation


class Entity: CustomStringConvertible {
    var health: Double
    var point: Point
    var healsCount: Int
    
    var description: String {
        return "\(type)\nName: \(name)\nHealth: \(health)/\(max_health)\nDefense: \(defense)\nDamage: \(damage)\nPoint: \(point)\n"
    }
    
    let name: String
    let max_health: Double
    let defense: Int
    let damage: Double
    let type: String
    
    init(name: String, health: Double, max_health: Double, defense: Int, healsCount: Int, point: Point, damage: Double, type: String) {
        self.name = name
        self.health = health
        self.max_health = max_health
        self.defense = defense
        self.healsCount = healsCount
        self.point = point
        self.damage = damage
        self.type = type
    }
    
    // живо ли существо
    func isAlive() -> Bool {
        return health > 0
    }
    
    // Перемещение
    func move(dx: Double, dy: Double) {
        if self.isAlive() {
            point.move(dx: dx, dy: dy)
        }
    }
    
    // Расстояние до другого существа
    func distance(to entity: Entity) -> Double {
        return point.distance(point: entity.point)
    }
    
    // Использовать хилку
    func heal() -> Void {
        if isAlive(), healsCount > 0 {
            health += max_health * 0.3
            if (health > max_health) {
                health = max_health
            }
            healsCount -= 1
        }
    }
    
    // Получить урон
    func getDamage(amount damage: Double) -> Void {
        if damage < 0 {
            print("Damage cannot be negative")
        }
        health -= damage
        print("\(name) got \(damage) damage")
        if health <= 0 {
            health = 0
            print("\(name) died")
        }
    }
    
    // Бросить кубик
    func dice(attackModifier: Int) -> Bool {
        for _ in 1...attackModifier {
            if Int.random(in: 1...6) >= 5 {
                return true
            }
        }
        return false
    }
    
    // Атаковать цель
    func attack(target entity: Entity) -> Void {
        let damage = Double(Int.random(in: 10...Int(self.damage)))
        var attackModifier = Int(self.damage) - defense + 1
        attackModifier = attackModifier >= 1 ? attackModifier : 1
        if dice(attackModifier: attackModifier) {
            entity.getDamage(amount: damage)
        }
    }
}
