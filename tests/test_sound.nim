# this will test slappy

import math, os, slappy, vmath

slappyInit()

let sound = newSound("tests/xylophone-sweep.ogg")
var source = sound.play()
source.looping = true

echo "rotating sound in 3d, 1 rotation"
for i in 0..360:
  let a = float(i) / 180 * PI
  source.pos = vec3(sin(a), cos(a), 0)
  sleep(20)
source.stop()
sleep(500)

slappyClose()