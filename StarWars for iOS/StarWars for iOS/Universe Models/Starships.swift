//
//  Starships.swift
//  StarWars
//
//  Created by Aleksey Rochev (Netology) on 19.11.2019.
//  Copyright © 2019 Aleksey Rochev (Netology). All rights reserved.
//

import Foundation

// MARK: - Starship

protocol Starship: CustomStringConvertible, SpaceObject {
    var name: String  { get }
    var fraction: Fraction { get }
    var canShoot: Bool { get }
}

extension Starship {
    var description: String {
        return self.name + " \(self.fraction) fraction"
    }
}

extension Starship where Self: Armed {
    var canShoot: Bool {
        return self.weapons.first(where: { $0.ammunition > 0 }) == nil ? false : true
    }
}

// MARK: - Starship Base

class StarshipImp: Starship, Shooting {
    
    // MARK: - Properties
    
    private(set) var name = ""
    private(set) var fraction = Fraction.empare
    private(set) var weapons: [Weapons]
    
    var coordinate: Point = Point.generate()
    var health: Int = 0 {
        didSet {
            if oldValue > health {
                print("Ай больно же!")
            }
        }
    }
    
    weak var shootHandler: ShootHandler?
    
    // MARK: - Lifecycle
    
    init(name: String,
         fraction: Fraction,
         weapons: [Weapons]) {
        self.name = name
        self.fraction = fraction
        self.weapons = weapons
    }
        
    // MARK: - Properties


    func fire(to coordinate: Point) throws {
        guard let weaponIndex = weapons.firstIndex(where: { $0.ammunition > 0 } ) else {
            // тутъ
            throw WeaponsError.isEmpty
        }
        let distanceToEnemy = Int(ceil(sqrt(
            pow(self.coordinate.x - coordinate.x, 2) +
            pow(self.coordinate.y - coordinate.y, 2)
        )))
        guard distanceToEnemy <= weapons[weaponIndex].distance else{
            throw WeaponsError.tooFar
        }
        //патроны теперь заканчиваются
        try weapons[weaponIndex].fire()
        var coordinateToShoot = coordinate
        let aimingOffset = -1...1
        if Int.random(in: 0..<10) < 3{
            coordinateToShoot = Point(
                x: Int(coordinate.x) + aimingOffset.randomElement()!,
                y: Int(coordinate.y) + aimingOffset.randomElement()!
            )
        }
        print("Целимся...Огонь!")
        print("Выстрел по координатам:", coordinateToShoot.x, coordinateToShoot.y)
        shootHandler?.fire(from: weapons[weaponIndex], to: coordinateToShoot)
    }
}

extension StarshipImp{
    func moveTo(_ point: Point){
        coordinate.x += round((point.x - coordinate.x) / 3)
        coordinate.y += round((point.y - coordinate.y) / 3)
        print("Перемещаемся в сектор", coordinate.x, coordinate.y)
    }
}
