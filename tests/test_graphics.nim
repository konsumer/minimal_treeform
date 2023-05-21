# this will test boxy (and pixie) and windy

import staticglfw
import opengl
import boxy

let windowSize = ivec2(200, 200)

if init() == 0:
  raise newException(Exception, "Failed to Initialize GLFW")

windowHint(RESIZABLE, false.cint)
windowHint(CONTEXT_VERSION_MAJOR, 4)
windowHint(CONTEXT_VERSION_MINOR, 1)

var window = createWindow(windowSize.x, windowSize.y, "minimal", nil, nil)
window.makeContextCurrent()
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

let image = newImage(windowSize.x, windowSize.y)
image.fill(color(1, 1, 1, 0.1))
image.fillPath(
  path,
  color(1, 0, 0, 1),
  scale(vec2(1, 1)) *
  translate(vec2(0, 0))
)
bxy.addImage("heart", image)

var frame: int
while windowShouldClose(window) != 1:
  bxy.beginFrame(windowSize)
  bxy.drawImage("heart", center =vec2(windowSize.x/2, windowSize.y/2), angle = 0)
  bxy.endFrame()
  window.swapBuffers()
  inc frame
  pollEvents()

window.destroyWindow()
terminate()