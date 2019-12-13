set moduleName main
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
set C_modelName {main::main}
set C_modelType { void 0 }
set C_modelArgList {
	{ clk int 1 unused {pointer 0}  }
	{ reset int 1 unused {pointer 0}  }
	{ x int 10 unused {pointer 1}  }
	{ y int 9 unused {pointer 1}  }
	{ couleur int 12 unused {pointer 1}  }
	{ zoom float 32 unused {pointer 0}  }
	{ offset_X float 32 unused {pointer 0}  }
	{ offset_Y float 32 unused {pointer 0}  }
}
set C_modelArgMapList {[ 
	{ "Name" : "clk", "interface" : "wire", "bitwidth" : 1, "direction" : "READONLY", "bitSlice":[{"low":0,"up":0,"cElement": [{"cName": "main.clk.m_if.Val","cData": "bool","bit_use": { "low": 0,"up": 0},"cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]}]} , 
 	{ "Name" : "reset", "interface" : "wire", "bitwidth" : 1, "direction" : "READONLY", "bitSlice":[{"low":0,"up":0,"cElement": [{"cName": "main.reset.m_if.Val","cData": "bool","bit_use": { "low": 0,"up": 0},"cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]}]} , 
 	{ "Name" : "x", "interface" : "wire", "bitwidth" : 10, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":9,"cElement": [{"cName": "main.x.m_if.Val.V","cData": "uint10","bit_use": { "low": 0,"up": 9},"cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]}]} , 
 	{ "Name" : "y", "interface" : "wire", "bitwidth" : 9, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":8,"cElement": [{"cName": "main.y.m_if.Val.V","cData": "uint9","bit_use": { "low": 0,"up": 8},"cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]}]} , 
 	{ "Name" : "couleur", "interface" : "wire", "bitwidth" : 12, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":11,"cElement": [{"cName": "main.couleur.m_if.Val.V","cData": "uint12","bit_use": { "low": 0,"up": 11},"cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]}]} , 
 	{ "Name" : "zoom", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY", "bitSlice":[{"low":0,"up":31,"cElement": [{"cName": "main.zoom.m_if.Val","cData": "float","bit_use": { "low": 0,"up": 31},"cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]}]} , 
 	{ "Name" : "offset_X", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY", "bitSlice":[{"low":0,"up":31,"cElement": [{"cName": "main.offset_X.m_if.Val","cData": "float","bit_use": { "low": 0,"up": 31},"cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]}]} , 
 	{ "Name" : "offset_Y", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY", "bitSlice":[{"low":0,"up":31,"cElement": [{"cName": "main.offset_Y.m_if.Val","cData": "float","bit_use": { "low": 0,"up": 31},"cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]}]} ]}
# RTL Port declarations: 
set portNum 8
set portList { 
	{ clk sc_in sc_logic 1 clock -1 } 
	{ reset sc_in sc_logic 1 reset -1 active_high_sync clk } 
	{ x sc_out sc_lv 10 signal 2 clk } 
	{ y sc_out sc_lv 9 signal 3 clk } 
	{ couleur sc_out sc_lv 12 signal 4 clk } 
	{ zoom sc_in sc_lv 32 signal 5 clk } 
	{ offset_X sc_in sc_lv 32 signal 6 clk } 
	{ offset_Y sc_in sc_lv 32 signal 7 clk } 
}
set NewPortList {[ 
	{ "name": "clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "clk", "role": "default" }} , 
 	{ "name": "reset", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "reset", "role": "default" }} , 
 	{ "name": "x", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "x", "role": "default" }} , 
 	{ "name": "y", "direction": "out", "datatype": "sc_lv", "bitwidth":9, "type": "signal", "bundle":{"name": "y", "role": "default" }} , 
 	{ "name": "couleur", "direction": "out", "datatype": "sc_lv", "bitwidth":12, "type": "signal", "bundle":{"name": "couleur", "role": "default" }} , 
 	{ "name": "zoom", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "zoom", "role": "default" }} , 
 	{ "name": "offset_X", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "offset_X", "role": "default" }} , 
 	{ "name": "offset_Y", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "offset_Y", "role": "default" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1", "3", "6"],
		"CDFG" : "main",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "0", "ap_start" : "0", "ap_ready" : "0", "ap_done" : "0", "ap_continue" : "0", "ap_idle" : "0",
		"Pipeline" : "Dataflow", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "1",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "2", "EstimateLatencyMax" : "401",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"InputProcess" : [],
		"OutputProcess" : [],
		"Port" : [
			{"Name" : "clk", "Type" : "None", "Direction" : "I"},
			{"Name" : "reset", "Type" : "None", "Direction" : "I"},
			{"Name" : "x", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "y", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "couleur", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "sc_fifo_chn_1", "Type" : "Fifo", "Direction" : "IO"},
			{"Name" : "zoom", "Type" : "None", "Direction" : "I"},
			{"Name" : "offset_X", "Type" : "None", "Direction" : "I"},
			{"Name" : "offset_Y", "Type" : "None", "Direction" : "I"},
			{"Name" : "clk_form", "Type" : "None", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "grp_convergence_fu_102", "Port" : "clk"}]},
			{"Name" : "reset_form", "Type" : "None", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "grp_convergence_fu_102", "Port" : "reset"}]},
			{"Name" : "zoom_form", "Type" : "None", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "grp_convergence_fu_102", "Port" : "zoom"}]},
			{"Name" : "offset_X_form", "Type" : "None", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "grp_convergence_fu_102", "Port" : "offset_X"}]},
			{"Name" : "offset_Y_form", "Type" : "None", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "grp_convergence_fu_102", "Port" : "offset_Y"}]},
			{"Name" : "sc_fifo_chn_1_form3", "Type" : "Fifo", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "grp_convergence_fu_102", "Port" : "s_out"}]},
			{"Name" : "x_form", "Type" : "Vld", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "grp_convergence_fu_102", "Port" : "out_x"}]},
			{"Name" : "y_form", "Type" : "Vld", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "grp_convergence_fu_102", "Port" : "out_y"}]},
			{"Name" : "clk_form1", "Type" : "None", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "3", "SubInstance" : "grp_dimage_fu_124", "Port" : "clk"}]},
			{"Name" : "reset_form2", "Type" : "None", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "3", "SubInstance" : "grp_dimage_fu_124", "Port" : "reset"}]},
			{"Name" : "sc_fifo_chn_1_form", "Type" : "Fifo", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "3", "SubInstance" : "grp_dimage_fu_124", "Port" : "counter"}]},
			{"Name" : "couleur_form", "Type" : "Vld", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "3", "SubInstance" : "grp_dimage_fu_124", "Port" : "couleur"}]},
			{"Name" : "convergence_ssdm_thread_M_do_convergence", "Type" : "None", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "grp_convergence_fu_102", "Port" : "convergence_ssdm_thread_M_do_convergence"}]},
			{"Name" : "dimage_ssdm_thread_M_do_image", "Type" : "None", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "3", "SubInstance" : "grp_dimage_fu_124", "Port" : "dimage_ssdm_thread_M_do_image"}]},
			{"Name" : "color", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "3", "SubInstance" : "grp_dimage_fu_124", "Port" : "color"}]}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_convergence_fu_102", "Parent" : "0", "Child" : ["2"],
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
					{"ID" : "2", "SubInstance" : "grp_convergence_do_convergence_fu_76", "Port" : "clk"}]},
			{"Name" : "reset", "Type" : "None", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "2", "SubInstance" : "grp_convergence_do_convergence_fu_76", "Port" : "reset"}]},
			{"Name" : "zoom", "Type" : "None", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "2", "SubInstance" : "grp_convergence_do_convergence_fu_76", "Port" : "zoom"}]},
			{"Name" : "offset_X", "Type" : "None", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "2", "SubInstance" : "grp_convergence_do_convergence_fu_76", "Port" : "offset_X"}]},
			{"Name" : "offset_Y", "Type" : "None", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "2", "SubInstance" : "grp_convergence_do_convergence_fu_76", "Port" : "offset_Y"}]},
			{"Name" : "s_out", "Type" : "Fifo", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "2", "SubInstance" : "grp_convergence_do_convergence_fu_76", "Port" : "s_out"}]},
			{"Name" : "out_x", "Type" : "Vld", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "2", "SubInstance" : "grp_convergence_do_convergence_fu_76", "Port" : "out_x"}]},
			{"Name" : "out_y", "Type" : "Vld", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "2", "SubInstance" : "grp_convergence_do_convergence_fu_76", "Port" : "out_y"}]},
			{"Name" : "convergence_ssdm_thread_M_do_convergence", "Type" : "None", "Direction" : "I"}]},
	{"ID" : "2", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_convergence_fu_102.grp_convergence_do_convergence_fu_76", "Parent" : "1",
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
			{"Name" : "out_y", "Type" : "Vld", "Direction" : "O"}]},
	{"ID" : "3", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_dimage_fu_124", "Parent" : "0", "Child" : ["4"],
		"CDFG" : "dimage",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "0", "ap_start" : "0", "ap_ready" : "0", "ap_done" : "0", "ap_continue" : "0", "ap_idle" : "0",
		"Pipeline" : "Dataflow", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "1",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "1", "EstimateLatencyMax" : "2",
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
					{"ID" : "4", "SubInstance" : "grp_dimage_do_image_fu_58", "Port" : "clk"}]},
			{"Name" : "reset", "Type" : "None", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "4", "SubInstance" : "grp_dimage_do_image_fu_58", "Port" : "reset"}]},
			{"Name" : "counter", "Type" : "Fifo", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "4", "SubInstance" : "grp_dimage_do_image_fu_58", "Port" : "counter"}]},
			{"Name" : "couleur", "Type" : "Vld", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "4", "SubInstance" : "grp_dimage_do_image_fu_58", "Port" : "couleur"}]},
			{"Name" : "dimage_ssdm_thread_M_do_image", "Type" : "None", "Direction" : "I"},
			{"Name" : "color", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "4", "SubInstance" : "grp_dimage_do_image_fu_58", "Port" : "color"}]}]},
	{"ID" : "4", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_dimage_fu_124.grp_dimage_do_image_fu_58", "Parent" : "3", "Child" : ["5"],
		"CDFG" : "dimage_do_image",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "0", "ap_start" : "0", "ap_ready" : "0", "ap_done" : "0", "ap_continue" : "0", "ap_idle" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "1", "EstimateLatencyMax" : "1",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"Port" : [
			{"Name" : "clk", "Type" : "None", "Direction" : "I"},
			{"Name" : "reset", "Type" : "None", "Direction" : "I"},
			{"Name" : "counter", "Type" : "Fifo", "Direction" : "I",
				"BlockSignal" : [
					{"Name" : "counter_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "couleur", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "color", "Type" : "Memory", "Direction" : "I"}]},
	{"ID" : "5", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_dimage_fu_124.grp_dimage_do_image_fu_58.color_U", "Parent" : "4"},
	{"ID" : "6", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.sc_fifo_chn_1_fifo_U", "Parent" : "0"}]}


set ArgLastReadFirstWriteLatency {
	main {
		clk {Type I LastRead -1 FirstWrite -1}
		reset {Type I LastRead -1 FirstWrite -1}
		x {Type O LastRead -1 FirstWrite -1}
		y {Type O LastRead -1 FirstWrite -1}
		couleur {Type O LastRead -1 FirstWrite -1}
		sc_fifo_chn_1 {Type IO LastRead -1 FirstWrite -1}
		zoom {Type I LastRead -1 FirstWrite -1}
		offset_X {Type I LastRead -1 FirstWrite -1}
		offset_Y {Type I LastRead -1 FirstWrite -1}
		clk_form {Type I LastRead -1 FirstWrite -1}
		reset_form {Type I LastRead -1 FirstWrite -1}
		zoom_form {Type I LastRead -1 FirstWrite -1}
		offset_X_form {Type I LastRead -1 FirstWrite -1}
		offset_Y_form {Type I LastRead -1 FirstWrite -1}
		sc_fifo_chn_1_form3 {Type O LastRead -1 FirstWrite -1}
		x_form {Type O LastRead -1 FirstWrite -1}
		y_form {Type O LastRead -1 FirstWrite -1}
		clk_form1 {Type I LastRead -1 FirstWrite -1}
		reset_form2 {Type I LastRead -1 FirstWrite -1}
		sc_fifo_chn_1_form {Type I LastRead -1 FirstWrite -1}
		couleur_form {Type O LastRead -1 FirstWrite -1}
		convergence_ssdm_thread_M_do_convergence {Type I LastRead -1 FirstWrite -1}
		dimage_ssdm_thread_M_do_image {Type I LastRead -1 FirstWrite -1}
		color {Type I LastRead -1 FirstWrite -1}}
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
		out_y {Type O LastRead -1 FirstWrite 0}}
	dimage {
		clk {Type I LastRead -1 FirstWrite -1}
		reset {Type I LastRead -1 FirstWrite -1}
		counter {Type I LastRead 0 FirstWrite -1}
		couleur {Type O LastRead -1 FirstWrite 1}
		dimage_ssdm_thread_M_do_image {Type I LastRead -1 FirstWrite -1}
		color {Type I LastRead -1 FirstWrite -1}}
	dimage_do_image {
		clk {Type I LastRead -1 FirstWrite -1}
		reset {Type I LastRead -1 FirstWrite -1}
		counter {Type I LastRead 0 FirstWrite -1}
		couleur {Type O LastRead -1 FirstWrite 1}
		color {Type I LastRead -1 FirstWrite -1}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "2", "Max" : "401"}
	, {"Name" : "Interval", "Min" : "3", "Max" : "402"}
]}

set PipelineEnableSignalInfo {[
]}

set Spec2ImplPortList { 
	x { ap_vld {  { x out_data 1 10 } } }
	y { ap_vld {  { y out_data 1 9 } } }
	couleur { ap_vld {  { couleur out_data 1 12 } } }
	zoom { ap_none {  { zoom in_data 0 32 } } }
	offset_X { ap_none {  { offset_X in_data 0 32 } } }
	offset_Y { ap_none {  { offset_Y in_data 0 32 } } }
}

set busDeadlockParameterList { 
}

# RTL port scheduling information:
set fifoSchedulingInfoList { 
	sc_fifo_chn_1_form3 { fifo_write 1 no_conditional }
	sc_fifo_chn_1_form { fifo_read 1 no_conditional }
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
