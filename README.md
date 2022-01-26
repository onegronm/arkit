## ARKit - Getting Started

- Add a ARKit SceneKit View to the Main storyboard
- Use the assistant editor to connect the scene view to the view controller (right-click)
- Debug options to ensure the world was properly detected and feature points are being constantly discovered
- World origin is your starting position in the real world
- Use ARWorldTrackingConfiguration to track orientation and position of the device relative to the real world at all times
- Feature points are information about features in the world around you
- Use Privacy - Camera Usage Description property to request access to the camera
- A node is a position in space
- Diffuse represents the color that is spread across the entire surface
- Specular represents the color that reflects off a surface. You must give the scene a source of light in order to reflect it. Enable the autoenablesDefaultLighting property on the scene view
- Red is the horizontal axis. Green is the vertical axis
- SCNVector3 represents a 3D dimensional vector
- To create a sphere, draw a cube and set the radius to half the distance of w/l/h