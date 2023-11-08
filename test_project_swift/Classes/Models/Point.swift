//
//  Point.swift
//  test_project_swift
//
//  Created by User on 06.11.2023.
//

import Foundation


class Point: CustomStringConvertible {
    var x: Double
    var y: Double
    var description: String {
        return "(\(x), \(y))"
    }
    init(x: Double, y: Double) {
        self.x = x
        self.y = y
    }
    
    func move(dx: Double, dy: Double) -> Void {
        x += dx
        y += dy
    }
    
    func distance(point: Point) -> Double {
        return (((point.x - x) * (point.x - x)) + ((point.y - y) * (point.y - y))).squareRoot()
    }
}
