//
//  PrimitivesScene.swift
//  BodyFacts
//
//  Created by Tracy Richard on 8/3/16.
//  Copyright © 2016 Jack Richard. All rights reserved.
//

import UIKit
import SceneKit
class PrimitivesScene: SCNScene {
    override init() {
        super.init()
        
          
        let sphereGeometry = SCNSphere(radius: 0.5)
        let sphereNode = SCNNode (geometry: sphereGeometry)
        sphereNode.position = SCNVector3(x: -1, y: 0, z: 0)
        let sphereGeometryB = SCNSphere(radius: 0.25)
        let sphereNde = SCNNode(geometry: sphereGeometryB)
        sphereNde.position = SCNVector3(x: 1, y: 0, z: 0)
        self.rootNode.addChildNode(sphereNode)
        self.rootNode.addChildNode(sphereNde)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
