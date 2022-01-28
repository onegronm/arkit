//
//  ViewController.swift
//  Planets
//
//  Created by Omar Negron Montero on 1/27/22.
//

import UIKit
import ARKit

class ViewController: UIViewController {
    @IBOutlet weak var sceneView: ARSCNView!
    let configuration = ARWorldTrackingConfiguration()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.sceneView.debugOptions = [ARSCNDebugOptions.showFeaturePoints,
           ARSCNDebugOptions.showWorldOrigin]
        self.sceneView.autoenablesDefaultLighting = true
        self.sceneView.session.run(configuration)
    }

    override func viewDidAppear(_ animated: Bool) {
        let sun = planet(geometry: SCNSphere(radius:0.35), diffuse: UIImage(named: "Sun Diffuse"), specular: nil, emission: nil, normal: nil, position: SCNVector3(0,0,-1))
        
        // parents to give earth and venus different speeds of rotation
        let earthParent = SCNNode()
        let venusParent = SCNNode()
        
        // put the earth parent exactly where the sun is to give the illusion the earth is positioned around the sun
        earthParent.position = SCNVector3(0,0,-1)
        venusParent.position = SCNVector3(0,0,-1)
        
        self.sceneView.scene.rootNode.addChildNode(sun)
        self.sceneView.scene.rootNode.addChildNode(earthParent)
        self.sceneView.scene.rootNode.addChildNode(venusParent)
        
        let earth = planet(geometry: SCNSphere(radius: 0.2), diffuse: UIImage(named: "Earth"), specular: UIImage(named: "Earth Spec"), emission: UIImage(named: "Earth Emission"), normal: UIImage(named: "Earth Normal"), position: SCNVector3(1.2,0,0))
        
        let venus = planet(geometry: SCNSphere(radius: 0.1), diffuse: UIImage(named: "Venus Diffuse"), specular: nil, emission: UIImage(named: "Venus Emission"), normal: nil, position: SCNVector3(0.7,0,0))
        
        venusParent.addChildNode(venus)
        earthParent.addChildNode(earth)
        
        // rotate sun
        let action = SCNAction.rotateBy(x: 0, y: CGFloat(360.degreesToRadians), z: 0, duration: 8)
        action.speed = 0.25
        
        let forever = SCNAction.repeatForever(action)
        sun.runAction(forever)
        
        // rotate earth
        let earthParentRotation = SCNAction.rotateBy(x: 0, y: CGFloat(360.degreesToRadians), z: 0, duration: 14)
        let venusParentRotation = SCNAction.rotateBy(x: 0, y: CGFloat(360.degreesToRadians), z: 0, duration: 10)
        
        let foreverEarth = SCNAction.repeatForever(earthParentRotation)
        let foreverVenus = SCNAction.repeatForever(venusParentRotation)
        
        earthParent.runAction(foreverEarth)
        venusParent.runAction(foreverVenus)
    }
    
    func planet(geometry: SCNGeometry, diffuse: UIImage?, specular: UIImage?, emission: UIImage?, normal: UIImage?, position: SCNVector3) -> SCNNode {
        let planet = SCNNode(geometry: geometry)
        planet.geometry?.firstMaterial?.diffuse.contents = diffuse
        planet.geometry?.firstMaterial?.specular.contents = specular
        planet.geometry?.firstMaterial?.emission.contents = emission
        planet.geometry?.firstMaterial?.normal.contents = normal
        planet.position = position
        return planet
    }
}

extension Int {
    var degreesToRadians: Double  { return Double(self) * .pi/100 }
}
