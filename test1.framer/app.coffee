# Set default curve
Framer.Defaults.Animation = 
	curve: "spring(80,12,0)"

# Set a background to sky color
new BackgroundLayer
	backgroundColor: "#669cf5"

# Hold all layers
container = new Layer
	width: 1000
	height: 1000
	backgroundColor: "transparent"
container.center()

# Create background circle layer
circleBg = new Layer
	width: 480, height: 480
	borderRadius: "50%"
	opacity: 0.5
	scale: 0
	backgroundColor: "#ffffff"
	superLayer: container
circleBg.center()

# Create sun layer
sun = new Layer
	width: 360, height: 360
	borderRadius: "50%"
	opacity: 100
	scale: 0
	backgroundColor: "#fbe450"
	superLayer: container
sun.center()

# Create cloud layer
cloud = new Layer
	x:sun.minX - 50, y:sun.maxY - 100
	width: 200, height: 100
	scale: 0
	backgroundColor: "#ffffff"
	superLayer: container

# Set origin to animate from to bottom left
cloud.originX = 0
cloud.originY = 1

# Set animations for all layers
animateBg = new Animation
	layer: circleBg
	properties:
		scale: 2
		opacity: 0
	curve: "liner"
	time: 0.5
animateSun = new Animation
	layer: sun
	properties:
		scale: 1
		opacity: 1
animateCloudScale = new Animation
	layer: cloud
	properties:
		scale: 1
animateCloudMove = new Animation
	layer: cloud
	properties:
		x: sun.midX
	delay: 0.2

Utils.delay 1, ->

# Start animations
animateBg.start()
animateSun.start()
animateCloudMove.start()
animateCloudScale.start()




