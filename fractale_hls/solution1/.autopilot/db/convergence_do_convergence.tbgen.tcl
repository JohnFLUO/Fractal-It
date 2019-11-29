set moduleName convergence_do_convergence
set isTaskLevelControl 1
set isCombinational 0
set isDatapathOnly 0
set isPipelined 0
set pipeline_type none
set FunctionProtocol ap_ctrl_hs
set isOneStateSeq 0
set ProfileFlag 0
set StallSigGenFlag 0
set isEnableWaveformDebug 1
set C_modelName {convergence::do_convergence}
set C_modelType { void 0 }
set C_modelArgList {
	{ zoom int 8 regular {pointer 0 volatile }  }
	{ offset_X float 32 regular {pointer 0 volatile }  }
	{ offset_Y float 32 regular {pointer 0 volatile }  }
	{ s_out int 8 regular {fifo 1 volatile }  }
	{ out_x int 10 regular {pointer 1 volatile }  }
	{ out_y int 9 regular {pointer 1 volatile }  }
}
set C_modelArgMapList {[ 
	{ "Name" : "zoom", "interface" : "wire", "bitwidth" : 8, "direction" : "READONLY", "bitSlice":[{"low":0,"up":7,"cElement": [{"cName": "convergence.zoom.m_if.Val.V","cData": "uint8","bit_use": { "low": 0,"up": 7},"cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]}]} , 
 	{ "Name" : "offset_X", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY", "bitSlice":[{"low":0,"up":31,"cElement": [{"cName": "convergence.offset_X.m_if.Val","cData": "float","bit_use": { "low": 0,"up": 31},"cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]}]} , 
 	{ "Name" : "offset_Y", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY", "bitSlice":[{"low":0,"up":31,"cElement": [{"cName": "convergence.offset_Y.m_if.Val","cData": "float","bit_use": { "low": 0,"up": 31},"cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]}]} , 
 	{ "Name" : "s_out", "interface" : "fifo", "bitwidth" : 8, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":7,"cElement": [{"cName": "convergence.s_out.m_if.Val.V","cData": "uint8","bit_use": { "low": 0,"up": 7},"cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]}]} , 
 	{ "Name" : "out_x", "interface" : "wire", "bitwidth" : 10, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":9,"cElement": [{"cName": "convergence.out_x.m_if.Val.V","cData": "uint10","bit_use": { "low": 0,"up": 9},"cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]}]} , 
 	{ "Name" : "out_y", "interface" : "wire", "bitwidth" : 9, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":8,"cElement": [{"cName": "convergence.out_y.m_if.Val.V","cData": "uint9","bit_use": { "low": 0,"up": 8},"cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]}]} ]}
# RTL Port declarations: 
set portNum 12
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ zoom sc_in sc_lv 8 signal 0 } 
	{ offset_X sc_in sc_lv 32 signal 1 } 
	{ offset_Y sc_in sc_lv 32 signal 2 } 
	{ s_out_din sc_out sc_lv 8 signal 3 } 
	{ s_out_full_n sc_in sc_logic 1 signal 3 } 
	{ s_out_write sc_out sc_logic 1 signal 3 } 
	{ out_x sc_out sc_lv 10 signal 4 } 
	{ out_x_ap_vld sc_out sc_logic 1 outvld 4 } 
	{ out_y sc_out sc_lv 9 signal 5 } 
	{ out_y_ap_vld sc_out sc_logic 1 outvld 5 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "zoom", "direction": "in", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "zoom", "role": "default" }} , 
 	{ "name": "offset_X", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "offset_X", "role": "default" }} , 
 	{ "name": "offset_Y", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "offset_Y", "role": "default" }} , 
 	{ "name": "s_out_din", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "s_out", "role": "din" }} , 
 	{ "name": "s_out_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "s_out", "role": "full_n" }} , 
 	{ "name": "s_out_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "s_out", "role": "write" }} , 
 	{ "name": "out_x", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "out_x", "role": "default" }} , 
 	{ "name": "out_x_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "out_x", "role": "ap_vld" }} , 
 	{ "name": "out_y", "direction": "out", "datatype": "sc_lv", "bitwidth":9, "type": "signal", "bundle":{"name": "out_y", "role": "default" }} , 
 	{ "name": "out_y_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "out_y", "role": "ap_vld" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "",
		"CDFG" : "convergence_do_convergence",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "0", "ap_start" : "0", "ap_ready" : "0", "ap_done" : "0", "ap_continue" : "0", "ap_idle" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "99", "EstimateLatencyMax" : "99",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"Port" : [
			{"Name" : "clk", "Type" : "None", "Direction" : "I"},
			{"Name" : "reset", "Type" : "None", "Direction" : "I"},
			{"Name" : "zoom", "Type" : "None", "Direction" : "I"},
			{"Name" : "offset_X", "Type" : "None", "Direction" : "I"},
			{"Name" : "offset_Y", "Type" : "None", "Direction" : "I"},
			{"Name" : "s_out", "Type" : "Fifo", "Direction" : "O",
				"BlockSignal" : [
					{"Name" : "s_out_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "out_x", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "out_y", "Type" : "Vld", "Direction" : "O"}]}]}


set ArgLastReadFirstWriteLatency {
	convergence_do_convergence {
		clk {Type I LastRead -1 FirstWrite -1}
		reset {Type I LastRead -1 FirstWrite -1}
		zoom {Type I LastRead 99 FirstWrite -1}
		offset_X {Type I LastRead 99 FirstWrite -1}
		offset_Y {Type I LastRead 99 FirstWrite -1}
		s_out {Type O LastRead -1 FirstWrite 0}
		out_x {Type O LastRead -1 FirstWrite 0}
		out_y {Type O LastRead -1 FirstWrite 0}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "99", "Max" : "99"}
	, {"Name" : "Interval", "Min" : "99", "Max" : "99"}
]}

set PipelineEnableSignalInfo {[
]}

set Spec2ImplPortList { 
	zoom { ap_none {  { zoom in_data 0 8 } } }
	offset_X { ap_none {  { offset_X in_data 0 32 } } }
	offset_Y { ap_none {  { offset_Y in_data 0 32 } } }
	s_out { ap_fifo {  { s_out_din fifo_data 1 8 }  { s_out_full_n fifo_status 0 1 }  { s_out_write fifo_update 1 1 } } }
	out_x { ap_vld {  { out_x out_data 1 10 }  { out_x_ap_vld out_vld 1 1 } } }
	out_y { ap_vld {  { out_y out_data 1 9 }  { out_y_ap_vld out_vld 1 1 } } }
}
