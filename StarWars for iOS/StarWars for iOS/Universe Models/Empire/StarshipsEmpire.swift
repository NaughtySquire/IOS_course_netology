//
//  StarshipsEmpire.swift
//  StarWars
//
//  Created by Aleksey Rochev (Netology) on 19.11.2019.
//  Copyright © 2019 Aleksey Rochev (Netology). All rights reserved.
//

import Foundation

class DeathStar: StarshipImp {
        
    // MARK: - Constants
    
    private enum Constants {
        static let health = 1000
    }

    // MARK: - Lifecycle
    
    init() {
        super.init(name: "Death Star",
                   fraction: .empare,
                   weapons: [SuperLazer()])
        health = Constants.health
    }
    
    deinit {
        print("Люк, я твой отец!")
    }
}

class Dreadnought: StarshipImp{
    // MARK: - Constants

    private enum Constants {
        static let health = 300
    }

    // MARK: - Lifecycle

    init() {
        var tWeapons: [Weapons] = []
        for _ in 0..<10{
            tWeapons.append(Lagergun())
        }
        super.init(name: "Heavy-cruiser",
                   fraction: .empare,
                    weapons: tWeapons)
        health = Constants.health
    }

    deinit {
        print("Бадабум!!!")
    }
}

