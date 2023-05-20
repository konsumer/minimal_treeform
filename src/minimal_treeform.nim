import boxy, opengl, windy

let window = newWindow("minimal", ivec2(320, 240))
makeContextCurrent(window)
loadExtensions()
let bxy = newBoxy()

var frame: int

window.onFrame = proc() =
  bxy.beginFrame(window.size)
  
  bxy.endFrame()
  window.swapBuffers()
  inc frame

while not window.closeRequested:
  pollEvents()