# Apps
- World Tracking
- AR Drawing
- Planets

## ARKit - Getting Started

- Add a ARKit SceneKit View to the Main storyboard
- Use the **assistant editor** to connect the scene view to the view controller (right-click)
- Use debug options to ensure the world was properly detected and feature points are being constantly discovered
- **World origin** is your starting position in the real world
- Use **ARWorldTrackingConfiguration** to track orientation and position of the device relative to the real world at all times
- **Feature points** are information about features in the world around you
- Use **Privacy - Camera Usage Description** property to request access to the camera
- A **node** is a position in space
- **Diffuse** represents the color that is spread across the entire surface
- **Specular** represents the color that reflects off a surface. You must give the scene a source of light in order to reflect it. Enable the **autoenablesDefaultLighting** property on the scene view
- Red is the horizontal axis. Green is the vertical axis
- **SCNVector3** represents a 3D dimensional vector
- To create a sphere, draw a cube and set the radius to half the distance of W/L/H
- Primitive shapes are SCNBox, SCNCone, SCNCylinder, SCNCapsule, SCNSphere, SCNTube, SCNTorus, SCNPlane (roads), SCNPyramid, and SCNShape (Bezier path)
- You can export a SVG file to UIView class or image and load a custom shape using **Bezier** code path
- Become comfortable creating custom shapes using relative positioning
- **eulerAngles** control a node's orientation
- A child node will rotate relative to its parent node to preserve its orientation
- **viewDidLoad** is called when the UI assets are ready to work with but before they appear on the screen. UI assets can be referenced and manipulated. Use this event to do any additional setup after loading the view
- **viewDidAppear** is called after objects appear

## AR Drawing
- Inheriting the ViewController from **ARSCNViewDelegate** will give access to the renderer delegate. This delegate function is called everytime the view is about to render a scene (60 fps)
- By default, everyting in the renderer delegate takes place in a background thread. Use **DispatchQueue.main.async** to use the UI thread

## Textures and Surfaces
- You can also refer to the **texture** across a node's material
- Import an image by adding it as an image asset and using the UIImage(named:) object. Do not include the file extension in the "named" property
- **SCNAction** is an animation class used to animate a node
- Use **SCNAction.repeatForever()** to run an action forever
- Use **SCNAction.rotateBy()** to add rotation to a node
- A **specular** texture wraps a node to control how light is reflected from it
- A **diffuse** texture spreads its content across the entire node covering it
- An **emission** texture adds color or content to the node
- A **normal** texture refers to the geometrical shape of each point in the surface