# Apps
- World Tracking (Basics)
- AR Drawing (Renderer Delegate)
- Planets (Textures, Surfaces, and Rotation)
- WhackAJelly (3D Models and Hit Testing)

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

## 3D Models and Hit-Testing
- Use **Aspect Fit** content mode when filling a UI object with a background image
- **#selector** is an Objective-C argument. Add **'@objc'** to expose the action to Objective-C
- Use **UITapGestureRecognizer** to detect taps on the screen
- A **hit test** will give you information of what you touched if the coordinates you touched match with the coordinates of an object inside of the scene you tapped on. If there is no match, the variable will be empty
- You can download 3D models on TurboSquid.com
- .dae is one of the models compatible with the scene view editor. .dae models come with their own camera from SceneKit. Since we have our own camera from ARKit scene view, you can remove it. It can also include light sources which you can also remove
- To import textures, drag them into Xcode solution explorer and create a reference. Then use the texture as the node's diffuse color. The texture wraps and spreads its content all around the surface of the node
- With the 3D object focused, click Editor > Convert to SceneKit scene file format (.scn). This is the recommended format to optimize Xcode performance
- To load a separate scene into the view controller, we need to have it inside an assets folder. From the solution folder, click **New file > Asset Catalog** and name it **art.scnassets**. Drag the scene into the assets folder or right-click the folder and select **Add files to art.scnassets** (update: it's no longer required to be in this folder)
- The diffuse texture will be lost by moving the scene object to the assets folder. To resolve this, reset the texture on the scene object

