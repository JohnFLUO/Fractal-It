#!/bin/sh
lli=${LLVMINTERP-lli}
exec $lli \
    /net/e/floupias001/FRACTALE/fractale/Fractale-It/fractale_hls/solution1/.autopilot/db/a.g.bc ${1+"$@"}
