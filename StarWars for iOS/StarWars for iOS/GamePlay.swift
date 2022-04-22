//
//  GamePlay.swift
//  StarWars
//
//  Created by Aleksey Rochev (Netology) on 19.11.2019.
//  Copyright © 2019 Aleksey Rochev (Netology). All rights reserved.
//

import Foundation

class GamePlay {
    
    //MARK: - Properties
    
    private let space = Space()
    
    func play() {
        print("Давным давно в далекой галактике")

        let deathStar = DeathStar()
        deathStar.shootHandler = space
        space.add(object: deathStar)

        let superCruiser = Dreadnought()
        superCruiser.shootHandler = space
        space.add(object: superCruiser)

        print(-1...1)

        let xWing = XWing()
        xWing.shootHandler = space
                
        space.add(object: xWing)
        
        let radarPoint = Point.generate()
        let radar = Radar(coordinate: radarPoint)
                
        radar.datasource = space
        radar.observer = xWing
        radar.toggle()        
        space.add(object: radar)
    }
    
    deinit {
        print("Game Over")
    }
}
