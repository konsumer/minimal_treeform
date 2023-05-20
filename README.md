This is a minimal project to test a few [treeform](https://github.com/treeform) nim game-libs working together.

Run with `nimble test`

You should see a window with a heart on `test_graphics` and hear a xylophone for `test_sound`.


## Results

### OSX Ventura 13.3.1 (arm64)

```
Nim 1.6.10 [MacOSX: arm64]
nimble v0.13.1
```

- Graphics works
- Sound works

### OSX Ventura 13.3.1 (intel64)

```
Nim 1.6.12 [MacOSX: amd64]
nimble v0.14.0
```

- Graphics has [lots of errors](results-graphics-mac-intel.txt)
- Sound works

## Linux Docker (intel64)

```
Nim 1.6.12 [Linux: amd64]
nimble v0.13.1
```

I ran this to get it going:

```
docker run -v ${PWD}:/app -it --rm nimlang/nim bash

cd /app
apt install -y libgl1-mesa-glx libopenal-dev 
```

- Graphics compiles
- Sound compiles

Obviously, it can't open GL/audio in docker, but it seems to otherwise work.



