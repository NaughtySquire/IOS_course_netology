//
//  WeaponsJedi.swift
//  StarWars
//
//  Created by Aleksey Rochev (Netology) on 19.11.2019.
//  Copyright © 2019 Aleksey Rochev (Netology). All rights reserved.
//

import Foundation

struct Bomb: Weapons {
    var shootingSound: String = "Буууммм!"
    var name: String = "Bomb"
    var damage: Int = 100
    var rateOfFire: Int = 2
    var ammunition: Int = 20
    var distance: Int = 3
}

struct LazerBlaster: Weapons {
    var shootingSound: String = "Пиу-пиу!"
    var name: String = "Lazer Blaster"
    var damage: Int = 20
    var rateOfFire: Int = 60
    var ammunition: Int = 200
    var distance: Int = 4
}
