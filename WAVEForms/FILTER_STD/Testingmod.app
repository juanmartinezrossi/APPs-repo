object {
	obj_name=FILTER
	exe_name=CPLX_FILTER
#	force_pe=0
	kopts=15
	inputs {
		name=input_0
		remote_itf=output_0
		remote_obj=IMPULSE
	}
	outputs {
		name=output_0
		remote_itf=input_0
		remote_obj=module1
	}
}
#####################################################module1
object{
	obj_name=module1
	exe_name=module1
	inputs{
		name=input_0
		remote_itf=output_0
		remote_obj=FILTER
	}
	outputs{
		name=output_0
		remote_itf=input_0
		remote_obj=IMPULSE
	}
}
#####################################################module1
#########################################################################DAC_JACK0
#########################################################################CHANNEL_ANALYZER
object {
	obj_name=IMPULSE				
	exe_name=CHANNEL_ANALYZER			
	inputs {
		name=input_0
		remote_itf=output_0
		remote_obj=module1
	}
	outputs {
		name=output_0
		remote_itf=input_0
		remote_obj=FILTER
	}
	outputs {
		name=output_1
		remote_itf=input_0
		remote_obj=GRAPH_IMPULSE
	}
}
#########################################################################CHANNEL_ANALYZER
#########################################################################GRAPH
object {
	obj_name=GRAPH_IMPULSE			
	exe_name=GRAPH			
	inputs {
		name=input_0
		remote_itf=output_1
		remote_obj=IMPULSE
	}
}
