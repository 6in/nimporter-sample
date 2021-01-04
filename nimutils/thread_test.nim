import nimpy
import strformat
import os

proc threadFunc(param: tuple[a, b: int]) {.thread.} = 
    echo fmt("This is Thread-{param.a}")

proc threadTest(): int {.exportpy.} =
    var thr: array[0..1, Thread[tuple[a, b: int]]]
    echo "start threads"
    defer:
        echo "wait threads"
    thr[0].createThread(threadFunc, (1, 1000))
    thr[1].createThread(threadFunc, (2, 1000))
    sleep(1000)
    joinThreads(thr)
