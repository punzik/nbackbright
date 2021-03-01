import os
import streams
import strutils

const
  BL_SYS_DIR = "/sys/class/backlight"

proc change_brightness(percent: int) =
  if dirExists(BL_SYS_DIR):
    for kind, path in walkDir(BL_SYS_DIR):
      let
        br_file = path & "/brightness"
        mb_file = path & "/max_brightness"
      if fileExists(br_file) and fileExists(mb_file):
        try:
          let br_stream = openFileStream(br_file)
          let br = parseInt(br_stream.readLine())
          br_stream.close()

          let mb_stream = openFileStream(mb_file)
          let mb = parseInt(mb_stream.readLine())
          mb_stream.close()

          var new_br = int(float(br) + float(mb) / 100.0 * float(percent))
          if new_br < 0: new_br = 0
          if new_br > mb: new_br = mb

          let br_write = openFileStream(br_file, fmWrite)
          br_write.writeLine(new_br)
          br_write.close()
        except:
          echo "Fail to interact with ", br_file

when isMainModule:
  if paramCount() > 0:
    let percent = parseInt(paramStr(1))
    change_brightness(percent)
