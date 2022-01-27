//
//  ViewController.swift
//  ARDrawing
//
//  Created by Omar Negron Montero on 1/26/22.
//

import UIKit
import ARKit


class ViewController: UIViewController, ARSCNViewDelegate {
    @IBOutlet weak var draw: UIButton!
    
    @IBOutlet weak var sceneView: ARSCNView!
    
    let configuration = ARWorldTrackingConfiguration()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.sceneView.debugOptions = [ARSCNDebugOptions.showWorldOrigin,
                                       ARSCNDebugOptions.showFeaturePoints]
        // Show FPS and rendering performance
        self.sceneView.showsStatistics = true
        self.sceneView.session.run(configuration)
        
        // to call the delegate function when a scene is rendered, declare as so
        self.sceneView.delegate = self
    }

    // called every time the view will render a scene at 60 fps
    func renderer(_ renderer: SCNSceneRenderer, willRenderScene scene: SCNScene, atTime time: TimeInterval) {
        // point of view of the sceneView (safely unwrapping)
        guard let pointOfView = sceneView.pointOfView else { return }
        
        let transform = pointOfView.transform
        
        // extract orientation of the camera
        // m31 - x field is located in the 3rd column of the matrix, row 1
        let orientation = SCNVector3(-transform.m31, -transform.m32, -transform.m33)
        
        // location of the camera
        let location = SCNVector3(transform.m41, transform.m42, transform.m43)
        
        // we have obtained the current position vector of the phone, and the orientation vector pointing in the direction of the camera
        // now we must simply combine these two vectors to be able to add nodes in front of the camera view
        let currentPositionOfCamera = orientation + location
        
        // use the main thread
        DispatchQueue.main.async {
            if self.draw.isHighlighted {
                // when the button is pressed, write a sphere node
                let sphereNode = SCNNode(geometry: SCNSphere(radius: 0.02))
                sphereNode.position = currentPositionOfCamera
                self.sceneView.scene.rootNode.addChildNode(sphereNode)
                sphereNode.geometry?.firstMaterial?.diffuse.contents = UIColor.red
            }
            else {
                // show where the user will draw
                // use a box shaped as a sphere
                let pointer = SCNNode(geometry: SCNSphere(radius: 0.01)
                )
                pointer.name = "pointer"
                pointer.position = currentPositionOfCamera
                
                // delete older pointers (removes the spheres but not the pointer)
                self.sceneView.scene.rootNode.enumerateChildNodes({
                    (node, _) in
                    if node.name == "pointer" {
                        node.removeFromParentNode()
                    }
                })
                
                // add newest pointer
                self.sceneView.scene.rootNode.addChildNode(pointer)
                pointer.geometry?.firstMaterial?.diffuse.contents = UIColor.red
            }
        }
    }
}

// modify the plus operator
func +(left: SCNVector3, right: SCNVector3) -> SCNVector3
{
    return SCNVector3Make(left.x + right.x, left.y + right.y, left.z + right.z)
}
