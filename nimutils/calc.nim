import nimpy
import strformat

proc add(a: int, b: int): int {.exportpy.} =
    echo fmt("{ a + b = }")
    return a + b
