import nimpy
import strformat
import nuuid      # import uuid library 

proc generate(): string {.exportpy.} =
    return generateUUID()
