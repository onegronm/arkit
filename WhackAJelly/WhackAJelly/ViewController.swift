//
//  ViewController.swift
//  WhackAJelly
//
//  Created by Omar Negron Montero on 1/31/22.
//

import UIKit
import ARKit

class ViewController: UIViewController {
    @IBOutlet weak var sceneView: ARSCNView!
    
    let configuration = ARWorldTrackingConfiguration()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        self.sceneView.debugOptions = [SCNDebugOptions.showWorldOrigin, SCNDebugOptions.showFeaturePoints]
        self.sceneView.session.run(configuration)
        
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(handleTap))
        self.sceneView.addGestureRecognizer(tapGestureRecognizer)
    }
    
    @IBAction func play(_ sender: Any) {
        self.addNode()
    }
    
    @IBAction func reset(_ sender: Any) {
    }
    
    func addNode()
    {
        let jellyFishScene = SCNScene(named: "Jellyfish-scn.scn")
        
        // convert the scene to a node. If recursively is set to true, it will search every node in the root node subtree. If set to false, it will only search the root node's immediate children. The sphere node is an immediate child of the root node so we can set recursively to false
        let jellyFishNode = jellyFishScene?.rootNode.childNode(withName: "Sphere", recursively: false)
        
        // place the jellyfish righ in front of us
        jellyFishNode?.position = SCNVector3(0,0,-1)
        
        self.sceneView.scene.rootNode.addChildNode(jellyFishNode!)
        
//        let node = SCNNode(geometry: SCNBox(width: 0.2, height: 0.2, length: 0.2, chamferRadius: 0))
//        node.position = SCNVector3(0,0,-1)
//        self.sceneView.scene.rootNode.addChildNode(node)
    }
    
    @objc func handleTap(sender: UITapGestureRecognizer)
    {
        // get information of what was tapped
        let sceneViewTappedOn = sender.view as! SCNView
        
        // get where the user tapped on
        let touchCoordinates = sender.location(in: sceneViewTappedOn)
        
        // if the coordinates you touched match with the coordinates of an object inside of the scene you tapped on, it will give you hit test results and information of what you touched. If there is no match, the variable will be empty
        let hitTest = sceneViewTappedOn.hitTest(touchCoordinates)
        
        if hitTest.isEmpty
        {
            print("didn't touch anything")
        }
        else
        {
            let results = hitTest.first! // unwrap it because we know we touched something
            let geometry = results.node.geometry
            print(geometry)
        }
    }
}

