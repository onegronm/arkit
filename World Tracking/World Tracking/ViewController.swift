//
//  ViewController.swift
//  World Tracking
//
//  Created by Omar Negron Montero on 1/26/22.
//

import UIKit
import ARKit

class ViewController: UIViewController {
    @IBOutlet weak var sceneView: ARSCNView!
    
    // tracks orientation and position of the device relative to the real world at all times
    let configuration = ARWorldTrackingConfiguration()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // debug options to ensure the world was properly detected
        // and feature points are being constantly discovered
        // world origin is your starting position in the real world
        self.sceneView.debugOptions = [ARSCNDebugOptions.showFeaturePoints,
               ARSCNDebugOptions.showWorldOrigin]
        
        // now the device is able to track its position and orientation at all times
        self.sceneView.session.run(configuration)
        
        // adds omnidirectional light source to the scene view
        // omnidirectional is light that spreads across the entire scene
        self.sceneView.autoenablesDefaultLighting = true
    }

    
    @IBAction func add(_ sender: Any) {
//        let node = SCNNode()
        
        // box
//        // give the node a shape, units are in meters
//        node.geometry = SCNBox(width: 0.1, height: 0.1, length: 0.1, chamferRadius: 0.03)
//
        
//        node.geometry = SCNPyramid(width: 0.1, height: 0.1, length: 0.1)
//
//        node.geometry?.firstMaterial?.specular.contents = UIColor.orange
//
//         give the node a color. Diffuse represents the color that is spread across the entire surface
//        node.geometry?.firstMaterial?.diffuse.contents = UIColor.blue
//
//        let path = UIBezierPath()
//        path.move(to: CGPoint(x: 0, y:0)) // start path
//        path.addLine(to: CGPoint(x: 0, y:0.2)) // add line
//        path.addLine(to: CGPoint(x:0.2, y:0.3))
//
//        let shape = SCNShape(path: path, extrusionDepth: 0.2)
//
//        node.geometry = shape
//
//        // specify the position of the node relative to the origin
//        let x = randomNumbers(firstNum: -0.3, secondNum: 0.3)
//        let y = randomNumbers(firstNum: -0.3, secondNum: 0.3)
//        let z = randomNumbers(firstNum: -0.3, secondNum: 0.3)
//
//        // SCNVector3 represents a 3D dimensional vector
//        node.position = SCNVector3(x,y,z)
//
//
//        let cylinderNode = SCNNode(geometry: SCNCylinder(radius: 0.05, height: 0.05))
//
//        cylinderNode.geometry?.firstMaterial?.diffuse.contents = UIColor.red
//
//        // relative positioning
//        cylinderNode.position = SCNVector3(-0.3, 0.2, -0.3)
//
//        // add node to the scene
//        self.sceneView.scene.rootNode.addChildNode(node)
//
//        node.addChildNode(cylinderNode) // positioning relative to the pyramid node by making the cylinder a child of the pyramid
        
        // == rotation ==
        let pyramid = SCNNode(geometry: SCNPyramid(width: 0.1, height:0.1, length: 0.1))
        pyramid.geometry?.firstMaterial?.diffuse.contents = UIColor.blue
        pyramid.position = SCNVector3(0,0,-0.3)
        
        // eulerAngles control a node's orientation
        pyramid.eulerAngles = SCNVector3(Float(90.degreesToRadians),0,0)
        
        
        self.sceneView.scene.rootNode.addChildNode(pyramid)
        
        
        
    }
    
    @IBAction func Reset(_ sender: Any) {
        restartSession()
    }
    
    func restartSession()
    {
        // pause the scene view session
        // stops keeping track of position and orientation
        self.sceneView.session.pause()
        
        // remove the box node from the root node
        self.sceneView.scene.rootNode
            .enumerateChildNodes {
                (node, _) in
                node.removeFromParentNode()
            }
        
        // rerun the session
        self.sceneView.session.run(configuration, options:
            [.resetTracking, .removeExistingAnchors])
    }
    
    func randomNumbers(firstNum: CGFloat, secondNum: CGFloat) -> CGFloat {
        // takes a minimum and maximum float value and picks a value in between
        return CGFloat(arc4random()) / CGFloat(UINT32_MAX) * abs(firstNum - secondNum) + min(firstNum, secondNum)
    }
}

extension Int {
    var degreesToRadians: Double { return Double(self) * .pi/180}
}
