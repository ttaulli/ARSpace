//
//  ViewController.swift
//  ARSpace
//
//  Created by Tom Taulli on 8/25/17.
//  Copyright © 2017 Taulli's Taxes. All rights reserved.
//

import UIKit
import SceneKit
import ARKit

class ViewController: UIViewController, ARSCNViewDelegate {

    @IBOutlet var sceneView: ARSCNView!
    
    var planetFileName = "jupiter.jpg"
    
    var planetTab = "Jupiter"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = planetTab
        
        sceneView.delegate = self
        
        let planet = SCNSphere(radius: 0.2)
        
        let material = SCNMaterial()
        
        material.diffuse.contents = UIImage(named: planetFileName)
        
        planet.materials = [material]
        
        let node = SCNNode()
        
        node.position = SCNVector3(x: 0, y: 0.1, z: -0.5)
        
        node.geometry = planet
        
        sceneView.scene.rootNode.addChildNode(node)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Create a session configuration
        let configuration = ARWorldTrackingConfiguration()

        // Run the view's session
        sceneView.session.run(configuration)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        // Pause the view's session
        sceneView.session.pause()
    }
    
}
