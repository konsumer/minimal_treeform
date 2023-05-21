# this will test boxy (and pixie) and windy

import boxy, opengl, opengl/glut

let windowSize = ivec2(200, 200)

proc display() {.cdecl.}

glutInit()
glutInitDisplayMode(GLUT_DOUBLE)

glutInitWindowSize(windowSize.x, windowSize.y)
discard glutCreateWindow("minimal")
glutDisplayFunc(display)
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
proc display() {.cdecl.} =
  bxy.beginFrame(windowSize)
  bxy.drawImage("heart", center =vec2(100, 100), angle = 0)
  bxy.endFrame()
  glutSwapBuffers()
  inc frame
  glutPostRedisplay()

glutMainLoop()
