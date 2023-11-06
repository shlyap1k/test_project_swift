//
//  World.swift
//  test_project_swift
//
//  Created by User on 06.11.2023.
//

import Foundation


class Game {
    let player: Player
    var monsters: [Monster?] = []
    var selectedMonster: Monster?
    
    init(countMonsters: Int) {
        self.player = Player(name: "Ashen One", point: Point(x: 0.0, y: 0.0))
        // Создаём монстров в рандомных точках
        for _ in 1...countMonsters {
            let monstersPoint = Point(x: Double(Int.random(in: 10...100)),
                                      y: Double(Int.random(in: 10...100)))
            let monster = Monster(name: "Creep", point: monstersPoint)
            monsters.append(monster)
        }
    }
    
    // Вывод информации о всех сущностях
    func printEntities() -> Void {
        print(player)
        for (index, monster) in monsters.enumerated() {
            print("№\(index) \(monster!)")
        }
    }
    
    // Передвинуть игрока к монстру
    func move(to monster: Monster?) -> Void {
        guard let point = monster?.point else { return }
        player.move(dx: point.x - player.point.x, dy: point.y - player.point.y)
    }
    
    // Выбрать монстра
    func selectMonster() -> Void {
        print("Input the number of monster you want to interact with or input cancel")
        let choice = readLine() ?? ""
        if choice.lowercased() == "cancel" {
            selectedMonster = nil
        } else if let index = Int(choice), index - 1 >= 0, index - 1 <= monsters.count {
            selectedMonster = monsters[index-1]
            print("Selected monster:")
            print(selectedMonster!)
        } else {
            print("selected wrong number")
        }
    }
    
    // Атаковать выбранного монстра
    func attack() -> Void {
        guard let monster = selectedMonster else { return }
        if monster.isAlive() {
            if player.distance(to: monster) < 10 {
                player.attack(target: monster)
                monster.attack(target: player)
            } else {
                print("you are too far to attack")
            }
        } else {
            print("Monster is died already")
        }
    }
    
    // Отменить выбор монстра
    func unselectMonster() -> Void {
        if selectedMonster != nil {
            selectedMonster = nil
        }
    }
    
    func run() -> Void {
        while monsters.map({$0?.isAlive()}).contains(true) && player.isAlive() {
            if let monster = selectedMonster {
                print("Selected monster: \(monster)\n")
                print("Player: \(player)")
                print("Input command (attack, move, heal, leave):")
                if let command = readLine() {
                    switch command {
                    case "attack":
                        attack()
                    case "move":
                        move(to: monster)
                    case "heal":
                        player.heal()
                    case "leave":
                        unselectMonster()
                    default:
                        print("Command is invalid. Try again.")
                    }
                }
            } else {
                printEntities()
                print("Input command (select, exit):")
                if let command = readLine() {
                    switch command {
                    case "select":
                        selectMonster()
                    case "exit":
                        exit(1)
                    default:
                        print("Command is invalid. Try again.")
                    }
                }
            }
        }
        print("Game over")
    }
}
