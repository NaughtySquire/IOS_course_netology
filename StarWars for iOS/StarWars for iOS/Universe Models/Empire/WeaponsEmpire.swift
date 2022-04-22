//
//  StartshipsWeapons.swift
//  StarWars
//
//  Created by Aleksey Rochev (Netology) on 19.11.2019.
//  Copyright © 2019 Aleksey Rochev (Netology). All rights reserved.
//

import Foundation

struct SuperLazer: Weapons {
    var shootingSound: String = "Скиу-дыщ!"
    var name: String = "Ultimate super lazer"
    var damage: Int = 10000
    var rateOfFire: Int = 1
    var ammunition: Int = 2
    var distance: Int = 10_000
}

struct Lagergun: Weapons {
    var shootingSound: String = "Пи-пи-пи-пи-пиу!!!"
    var name: String = "Lagergun"
    var damage: Int = 50
    var rateOfFire: Int = 100
    var ammunition: Int = 1000
    var distance: Int = 3
}
