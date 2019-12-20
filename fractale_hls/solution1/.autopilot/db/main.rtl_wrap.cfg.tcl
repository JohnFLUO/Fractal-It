set language "SC"
set moduleName "main"
set portName0 "clk"
set isMeta0 0
set portInterface0 [list "sc_in"]
set portData0 [list "bool"]
set isClock0 1
set isReset0 0
set portAttribute0 [list $isClock0 $isReset0]
set port0 [list $portName0 $isMeta0 $portInterface0 $portData0 $portAttribute0]
lappend portList $port0
set portName1 "reset"
set isMeta1 0
set portInterface1 [list "sc_in"]
set portData1 [list "bool"]
set isClock1 0
set isReset1 1
set portAttribute1 [list $isClock1 $isReset1]
set port1 [list $portName1 $isMeta1 $portInterface1 $portData1 $portAttribute1]
lappend portList $port1
set portName2 "x"
set isMeta2 0
set portInterface2 [list "sc_out"]
set portData2 [list "sc_uint" 10]
set isClock2 0
set isReset2 0
set portAttribute2 [list $isClock2 $isReset2]
set port2 [list $portName2 $isMeta2 $portInterface2 $portData2 $portAttribute2]
lappend portList $port2
set portName3 "y"
set isMeta3 0
set portInterface3 [list "sc_out"]
set portData3 [list "sc_uint" 9]
set isClock3 0
set isReset3 0
set portAttribute3 [list $isClock3 $isReset3]
set port3 [list $portName3 $isMeta3 $portInterface3 $portData3 $portAttribute3]
lappend portList $port3
set portName4 "couleur"
set isMeta4 0
set portInterface4 [list "sc_out"]
set portData4 [list "sc_uint" 12]
set isClock4 0
set isReset4 0
set portAttribute4 [list $isClock4 $isReset4]
set port4 [list $portName4 $isMeta4 $portInterface4 $portData4 $portAttribute4]
lappend portList $port4
set portName5 "zoom"
set isMeta5 0
set portInterface5 [list "sc_in"]
set portData5 [list "sc_uint" 10]
set isClock5 0
set isReset5 0
set portAttribute5 [list $isClock5 $isReset5]
set port5 [list $portName5 $isMeta5 $portInterface5 $portData5 $portAttribute5]
lappend portList $port5
set portName6 "offset_X"
set isMeta6 0
set portInterface6 [list "sc_in"]
set portData6 [list "float"]
set isClock6 0
set isReset6 0
set portAttribute6 [list $isClock6 $isReset6]
set port6 [list $portName6 $isMeta6 $portInterface6 $portData6 $portAttribute6]
lappend portList $port6
set portName7 "offset_Y"
set isMeta7 0
set portInterface7 [list "sc_in"]
set portData7 [list "float"]
set isClock7 0
set isReset7 0
set portAttribute7 [list $isClock7 $isReset7]
set port7 [list $portName7 $isMeta7 $portInterface7 $portData7 $portAttribute7]
lappend portList $port7
set module [list $moduleName $portList]
