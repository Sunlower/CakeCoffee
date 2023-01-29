//
//  GameScene.swift
//  CakeCoffee
//
//  Created by Ieda Xavier on 28/01/23.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {

    private var currentNode: SKNode?

    override func didMove(to view: SKView) {
        addIngredients()
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            let location = touch.location(in: self)

            let touchedNode = self.nodes(at: location)
            for node in touchedNode.reversed() {
                if node.name == "square" {
                    self.currentNode = node
                }
            }
        }
    }

    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first, let node = self.currentNode {
            let touchLocation = touch.location(in: self)
            node.position = touchLocation
        }
    }

    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.currentNode = nil
    }

    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.currentNode = nil
    }

    func addIngredients() {
        let oilSprite = SKShapeNode(
            rectOf: CGSize(width: 40, height: 40)
        )
        oilSprite.fillColor = .yellow
        oilSprite.position = CGPoint(x: size.width/2, y: size.height/2)
        oilSprite.physicsBody?.isDynamic = true
        oilSprite.name = "square"

        let flourSprite = SKSpriteNode(
            color: .blue,
            size: CGSize(width: 50, height: 50)
        )
        flourSprite.position = CGPoint(x: size.width/2, y: size.height/2)
        flourSprite.physicsBody?.isDynamic = true
        flourSprite.name = "square"

        let suggarSprite = SKSpriteNode(
            color: .brown,
            size:  CGSize(width: 50, height: 50)
        )
        suggarSprite.position = CGPoint(x: size.width/2, y: size.height/2)
        suggarSprite.physicsBody?.isDynamic = true
        suggarSprite.name = "square"

        let bowSprite = SKSpriteNode(
            color: .white,
            size: CGSize(width: 100, height: 100)
        )
        bowSprite.position = CGPoint(x: size.width/2, y: size.height/2)
        bowSprite.physicsBody?.isDynamic = true
        bowSprite.name = "square"

        addChild(bowSprite)
        addChild(suggarSprite)
        addChild(flourSprite)
        addChild(oilSprite)
    }

}
