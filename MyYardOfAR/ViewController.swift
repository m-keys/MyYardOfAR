//
//  ViewController.swift
//  MyYardOfAR
//
//  Created by Александр Макаров on 14.09.2018.
//  Copyright © 2018 Александр Макаров. All rights reserved.
//

import UIKit
import SceneKit
import ARKit

class ViewController: UIViewController, ARSCNViewDelegate {

    @IBOutlet var sceneView: ARSCNView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set the view's delegate
        sceneView.delegate = self
        
        // Show statistics such as fps and timing information
        sceneView.showsStatistics = true
        
        sceneView.autoenablesDefaultLighting = true
        
        // Create a new scene
        let scene = SCNScene(named: "art.scnassets/MyYard.scn")!
        
        // Set the scene to the view
        sceneView.scene = scene
        
        tree()
    }
    
    func tree() {
        let node = SCNNode()
        node.position = SCNVector3(0, 0, -3)
        sceneView.scene.rootNode.addChildNode(node)
        
        let cylinderNode = SCNNode()
        cylinderNode.position = SCNVector3(0.7, -0.1, -0.1)
        let cylinder = SCNBox(width: 0.14, height: 0.4, length: 0.4, chamferRadius: 0.3)
        cylinder.firstMaterial?.diffuse.contents = UIColor.brown
        cylinderNode.geometry = cylinder
        node.addChildNode(cylinderNode)
        
        let sphereNode = SCNNode()
        sphereNode.position = SCNVector3(0.7, 0.2, 0)
        let sphere = SCNBox(width: 0.4, height: 0.4, length: 0.4, chamferRadius: 1)
        sphere.firstMaterial?.diffuse.contents = UIColor.green
        sphereNode.geometry = sphere
        node.addChildNode(sphereNode)
        
        let cylinderNode2 = SCNNode()
        cylinderNode2.position = SCNVector3(-0.6, -0.1, -0.1)
        let cylinder2 = SCNBox(width: 0.1, height: 0.3, length: 0.3, chamferRadius: 0.3)
        cylinder2.firstMaterial?.diffuse.contents = UIColor.brown
        cylinderNode2.geometry = cylinder2
        node.addChildNode(cylinderNode2)
        
        let sphereNode2 = SCNNode()
        sphereNode2.position = SCNVector3(-0.6, 0.1, 0)
        let sphere2 = SCNBox(width: 0.3, height: 0.3, length: 0.3, chamferRadius: 1)
        sphere2.firstMaterial?.diffuse.contents = UIColor.green
        sphereNode2.geometry = sphere2
        node.addChildNode(sphereNode2)
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
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Release any cached data, images, etc that aren't in use.
    }

    // MARK: - ARSCNViewDelegate
    
/*
    // Override to create and configure nodes for anchors added to the view's session.
    func renderer(_ renderer: SCNSceneRenderer, nodeFor anchor: ARAnchor) -> SCNNode? {
        let node = SCNNode()
     
        return node
    }
*/
    
    func session(_ session: ARSession, didFailWithError error: Error) {
        // Present an error message to the user
        
    }
    
    func sessionWasInterrupted(_ session: ARSession) {
        // Inform the user that the session has been interrupted, for example, by presenting an overlay
        
    }
    
    func sessionInterruptionEnded(_ session: ARSession) {
        // Reset tracking and/or remove existing anchors if consistent tracking is required
        
    }
}
