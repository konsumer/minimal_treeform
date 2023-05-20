# this will test boxy (and pixie) and windy

import boxy, opengl, windy

let window = newWindow("minimal", ivec2(200, 200))
makeContextCurrent(window)
loadExtensions()

let bxy = newBoxy()

var path = parsePath("""
  M 20 60
  A 40 40 90 0 1 100 60
  A 40 40 90 0 1 180 60
  Q 180 120 100 180
  Q 20 120 20 60
  z
""")

let image = newImage(200, 200)
image.fill(color(1, 1, 1, 0.1))
image.fillPath(
  path,
  color(1, 0, 0, 1),
  scale(vec2(1, 1)) *
  translate(vec2(0, 0))
)
bxy.addImage("heart", image)

var frame: int
window.onFrame = proc() =
  bxy.beginFrame(window.size)
  bxy.drawImage("heart", center =vec2(100, 100), angle = 0)
  bxy.endFrame()
  window.swapBuffers()
  inc frame

while not window.closeRequested:
  pollEvents()