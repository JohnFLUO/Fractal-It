set moduleName convergence
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
set C_modelName {convergence::convergence.1}
set C_modelType { void 0 }
set C_modelArgList {
	{ clk int 1 unused {pointer 0}  }
	{ reset int 1 unused {pointer 0}  }
	{ zoom float 32 regular {pointer 0 volatile }  }
	{ offset_X float 32 regular {pointer 0 volatile }  }
	{ offset_Y float 32 regular {pointer 0 volatile }  }
	{ s_out int 8 regular {fifo 1 volatile }  }
	{ out_x int 10 regular {pointer 1 volatile }  }
	{ out_y int 9 regular {pointer 1 volatile }  }
}
set C_modelArgMapList {[ 
	{ "Name" : "clk", "interface" : "wire", "bitwidth" : 1, "direction" : "READONLY", "bitSlice":[{"low":0,"up":0,"cElement": [{"cName": "convergence.clk.m_if.Val","cData": "bool","bit_use": { "low": 0,"up": 0},"cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]}]} , 
 	{ "Name" : "reset", "interface" : "wire", "bitwidth" : 1, "direction" : "READONLY", "bitSlice":[{"low":0,"up":0,"cElement": [{"cName": "convergence.reset.m_if.Val","cData": "bool","bit_use": { "low": 0,"up": 0},"cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]}]} , 
 	{ "Name" : "zoom", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY", "bitSlice":[{"low":0,"up":31,"cElement": [{"cName": "convergence.zoom.m_if.Val","cData": "float","bit_use": { "low": 0,"up": 31},"cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]}]} , 
 	{ "Name" : "offset_X", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY", "bitSlice":[{"low":0,"up":31,"cElement": [{"cName": "convergence.offset_X.m_if.Val","cData": "float","bit_use": { "low": 0,"up": 31},"cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]}]} , 
 	{ "Name" : "offset_Y", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY", "bitSlice":[{"low":0,"up":31,"cElement": [{"cName": "convergence.offset_Y.m_if.Val","cData": "float","bit_use": { "low": 0,"up": 31},"cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]}]} , 
 	{ "Name" : "s_out", "interface" : "fifo", "bitwidth" : 8, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":7,"cElement": [{"cName": "convergence.s_out.m_if.Val.V","cData": "uint8","bit_use": { "low": 0,"up": 7},"cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]}]} , 
 	{ "Name" : "out_x", "interface" : "wire", "bitwidth" : 10, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":9,"cElement": [{"cName": "convergence.out_x.m_if.Val.V","cData": "uint10","bit_use": { "low": 0,"up": 9},"cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]}]} , 
 	{ "Name" : "out_y", "interface" : "wire", "bitwidth" : 9, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":8,"cElement": [{"cName": "convergence.out_y.m_if.Val.V","cData": "uint9","bit_use": { "low": 0,"up": 8},"cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]}]} ]}
# RTL Port declarations: 
set portNum 10
set portList { 
	{ clk sc_in sc_logic 1 clock -1 } 
	{ reset sc_in sc_logic 1 reset -1 active_high_sync clk } 
	{ zoom sc_in sc_lv 32 signal 2 clk } 
	{ offset_X sc_in sc_lv 32 signal 3 clk } 
	{ offset_Y sc_in sc_lv 32 signal 4 clk } 
	{ s_out_din sc_out sc_lv 8 signal 5 clk } 
	{ s_out_full_n sc_in sc_logic 1 signal 5 clk } 
	{ s_out_write sc_out sc_logic 1 signal 5 clk } 
	{ out_x sc_out sc_lv 10 signal 6 clk } 
	{ out_y sc_out sc_lv 9 signal 7 clk } 
}
set NewPortList {[ 
	{ "name": "clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "clk", "role": "default" }} , 
 	{ "name": "reset", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "reset", "role": "default" }} , 
 	{ "name": "zoom", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "zoom", "role": "default" }} , 
 	{ "name": "offset_X", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "offset_X", "role": "default" }} , 
 	{ "name": "offset_Y", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "offset_Y", "role": "default" }} , 
 	{ "name": "s_out_din", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "s_out", "role": "din" }} , 
 	{ "name": "s_out_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "s_out", "role": "full_n" }} , 
 	{ "name": "s_out_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "s_out", "role": "write" }} , 
 	{ "name": "out_x", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "out_x", "role": "default" }} , 
 	{ "name": "out_y", "direction": "out", "datatype": "sc_lv", "bitwidth":9, "type": "signal", "bundle":{"name": "out_y", "role": "default" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1"],
		"CDFG" : "convergence",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "0", "ap_start" : "0", "ap_ready" : "0", "ap_done" : "0", "ap_continue" : "0", "ap_idle" : "0",
		"Pipeline" : "Dataflow", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "1",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "1", "EstimateLatencyMax" : "400",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"InputProcess" : [],
		"OutputProcess" : [],
		"Port" : [
			{"Name" : "clk", "Type" : "None", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "grp_convergence_do_convergence_fu_76", "Port" : "clk"}]},
			{"Name" : "reset", "Type" : "None", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "grp_convergence_do_convergence_fu_76", "Port" : "reset"}]},
			{"Name" : "zoom", "Type" : "None", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "grp_convergence_do_convergence_fu_76", "Port" : "zoom"}]},
			{"Name" : "offset_X", "Type" : "None", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "grp_convergence_do_convergence_fu_76", "Port" : "offset_X"}]},
			{"Name" : "offset_Y", "Type" : "None", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "grp_convergence_do_convergence_fu_76", "Port" : "offset_Y"}]},
			{"Name" : "s_out", "Type" : "Fifo", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "grp_convergence_do_convergence_fu_76", "Port" : "s_out"}]},
			{"Name" : "out_x", "Type" : "Vld", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "grp_convergence_do_convergence_fu_76", "Port" : "out_x"}]},
			{"Name" : "out_y", "Type" : "Vld", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "grp_convergence_do_convergence_fu_76", "Port" : "out_y"}]},
			{"Name" : "convergence_ssdm_thread_M_do_convergence", "Type" : "None", "Direction" : "I"}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_convergence_do_convergence_fu_76", "Parent" : "0",
		"CDFG" : "convergence_do_convergence",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "0", "ap_start" : "0", "ap_ready" : "0", "ap_done" : "0", "ap_continue" : "0", "ap_idle" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "399", "EstimateLatencyMax" : "399",
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
	convergence {
		clk {Type I LastRead -1 FirstWrite -1}
		reset {Type I LastRead -1 FirstWrite -1}
		zoom {Type I LastRead 399 FirstWrite -1}
		offset_X {Type I LastRead 399 FirstWrite -1}
		offset_Y {Type I LastRead 399 FirstWrite -1}
		s_out {Type O LastRead -1 FirstWrite 0}
		out_x {Type O LastRead -1 FirstWrite 0}
		out_y {Type O LastRead -1 FirstWrite 0}
		convergence_ssdm_thread_M_do_convergence {Type I LastRead -1 FirstWrite -1}}
	convergence_do_convergence {
		clk {Type I LastRead -1 FirstWrite -1}
		reset {Type I LastRead -1 FirstWrite -1}
		zoom {Type I LastRead 399 FirstWrite -1}
		offset_X {Type I LastRead 399 FirstWrite -1}
		offset_Y {Type I LastRead 399 FirstWrite -1}
		s_out {Type O LastRead -1 FirstWrite 0}
		out_x {Type O LastRead -1 FirstWrite 0}
		out_y {Type O LastRead -1 FirstWrite 0}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "1", "Max" : "400"}
	, {"Name" : "Interval", "Min" : "2", "Max" : "401"}
]}

set PipelineEnableSignalInfo {[
]}

set Spec2ImplPortList { 
	zoom { ap_none {  { zoom in_data 0 32 } } }
	offset_X { ap_none {  { offset_X in_data 0 32 } } }
	offset_Y { ap_none {  { offset_Y in_data 0 32 } } }
	s_out { ap_fifo {  { s_out_din fifo_data 1 8 }  { s_out_full_n fifo_status 0 1 }  { s_out_write fifo_update 1 1 } } }
	out_x { ap_vld {  { out_x out_data 1 10 } } }
	out_y { ap_vld {  { out_y out_data 1 9 } } }
}

set busDeadlockParameterList { 
}

# RTL port scheduling information:
set fifoSchedulingInfoList { 
	s_out { fifo_write 1 has_conditional }
}

# RTL bus port read request latency information:
set busReadReqLatencyList { 
}

# RTL bus port write response latency information:
set busWriteResLatencyList { 
}

# RTL array port load latency information:
set memoryLoadLatencyList { 
}
