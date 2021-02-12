# Package

version       = "0.1.0"
author        = "Jeremy Savor"
description   = "Blinky ATtiny85"
license       = "MIT"
srcDir        = "src"
bin           = @["blinky_nim"]


# Dependencies

requires "nim >= 1.4.0"

task clean, "Clean up":
  echo "Cleaning..."
  exec "rm -rf build/"
  exec "rm -f blinky_nim blinky_nim.hex"

task blink, "Build, Compile, and Link":
  exec "nimble clean"
  echo "Building, Compiling, and Linking"
  exec "nim c --os:standalone --out:blinky_nim src/blinky_nim.nim"
  exec "avr-objcopy -O ihex -R .eeprom blinky_nim blinky_nim.hex"

task flash, "Flash with Micronucleus":
  exec "micronucleus --run blinky_nim.hex"
