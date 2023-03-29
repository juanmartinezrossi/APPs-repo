object {
	obj_name=REPORT1
	exe_name=REPORT
	inputs {
		name=input_0
		remote_itf=output_2
		remote_obj=SOURCE_SINK
	}
	outputs {
		name=output_0
		remote_itf=input_1
		remote_obj=CHANNEL_TESTSYNCHRO
	}
}
#########################################################################REPORT
########################################
object {
	obj_name=SOURCE_SINK
	exe_name=DATASOURCESINK_REPORTP21
	force_pe=0
	inputs {
		name=input_0
		remote_itf=output_0
		remote_obj=UNCRC
	}
	outputs {
		name=output_0
		remote_itf=input_0
		remote_obj=CRC
	}
	inputs {
		name=input_1
		remote_itf=output_1
		remote_obj=MAPPINGV
	}
	inputs {
		name=input_2
		remote_itf=output_1
		remote_obj=UNCRC
	}
	outputs {
		name=output_2
		remote_itf=input_0
		remote_obj=REPORT1
	}
}
########################################
########################################
object {
	obj_name=CRC
	exe_name=CRC
	force_pe=0
	inputs {
		name=input_0
		remote_itf=output_0
		remote_obj=SOURCE_SINK
	}
	outputs {
		name=output_0
		remote_itf=input_0
		remote_obj=LTETURBOTX
	}
}
########################################
########################################
object {
	obj_name=LTETURBOTX
	exe_name=LTEturboCOD2
	force_pe=0
	inputs {
		name=input_0
		remote_itf=output_0
		remote_obj=CRC
	}
	outputs {
		name=output_0
		remote_itf=input_0
		remote_obj=SCRAMBLING
	}
}
########################################
########################################################SCRAMBLING
object {
	obj_name=SCRAMBLING
	exe_name=SCRAMBLING
	force_pe=0
	inputs {
		name=input_0
		remote_itf=output_0
		remote_obj=LTETURBOTX
	}
	outputs {
		name=output_0
		remote_itf=input_0
		remote_obj=MOD_16QAM
	}
}
########################################################SCRAMBLING
########################################
object {
	obj_name=MOD_16QAM
	exe_name=MOD_QAM
	force_pe=0
	inputs {
		name=input_0
		remote_itf=output_0
		remote_obj=SCRAMBLING
	}
	outputs {
		name=output_0
		remote_itf=input_0
		remote_obj=MAPPINGV	
	}
}


########################################################MAPPINGIV
object {
	obj_name=MAPPINGV				
	exe_name=DOWNLINK_MAPPING
	force_pe=0		
	inputs {
		name=input_0
		remote_itf=output_0
		remote_obj=MOD_16QAM
	}
	outputs {
		name=output_0
		remote_itf=input_0
		remote_obj=GRAPH_MAPPINGV
	}
	outputs {
		name=output_1
		remote_itf=input_1
		remote_obj=SOURCE_SINK
	}
	outputs {
		name=output_2
		remote_itf=input_0
		remote_obj=EVM_REPORT
	}
}
########################################################MAPPINGIV



########################################EVM_REPORT
object {
	obj_name=EVM_REPORT				
	exe_name=EVM_REPORT
#----DATA INTERFACES
	inputs {
		name=input_0
		remote_itf=output_0
		remote_obj=MAPPINGV
	}
	outputs {
		name=output_0
		remote_itf=input_0
		remote_obj=GRAPH_MAPPINGV2
	}
	inputs {
		name=input_1
		remote_itf=output_0
		remote_obj=GRAPH_EQUALIZED
	}
	outputs {
		name=output_1
		remote_itf=input_0
		remote_obj=DEMAPPING
	}
#----DATA INTERFACES
#----CTRL REPORT INTERFACES
	inputs {
		name=input_2
		remote_itf=output_1
		remote_obj=CHANNEL_TESTSYNCHRO
	}
	outputs {
		name=output_2
		remote_itf=input_1
		remote_obj=UNCRC
	}
#----CTRL REPORT INTERFACES
}



########################################################GRAPH_MAPPINGV2
object {
	obj_name=GRAPH_MAPPINGV2				
	exe_name=GRAPH
	force_pe=0
	inputs {
		name=input_0
		remote_itf=output_0
		remote_obj=EVM_REPORT
	}
}

########################################################GRAPH_MAPPINGIV
object {
	obj_name=GRAPH_MAPPINGV				
	exe_name=GRAPH
	force_pe=0
	inputs {
		name=input_0
		remote_itf=output_0
		remote_obj=MAPPINGV
	}
	outputs {
		name=output_0
		remote_itf=input_0
		remote_obj=IFFT
	}
}
######################################################GRAPH_MAPPINGIV
######################################################IFFT
object {
	obj_name=IFFT
	exe_name=fft_ifft
	force_pe=0
	inputs {
		name=input_0
		remote_itf=output_0
		remote_obj=GRAPH_MAPPINGV
	}
	outputs {
		name=output_0
		remote_itf=input_0
		remote_obj=GRAPH_IFFT	
	}
}

######################################################IFFT
######################################################GRAPH_IFFT
object {
	obj_name=GRAPH_IFFT			
	exe_name=GRAPH
	force_pe=0
	inputs {
		name=input_0
		remote_itf=output_0
		remote_obj=IFFT
	}
	outputs {
		name=output_0
		remote_itf=input_0
		remote_obj=PSS_SYNCH
	}
}
#####################################################GRAPH_IFFT


#####################################################IFFT
object {
	obj_name=CHANNEL_TESTSYNCHRO
	exe_name=CPLX_FILTER_REPORT
	force_pe=0
#	inputs {
#		name=input_0
#		remote_itf=output_0
#		remote_obj=GRAPH_IFFT
#	}
#	outputs {
#		name=output_0
#		remote_itf=input_0
#		remote_obj=PSS_SYNCH
#	}

	inputs {
		name=input_1
		remote_itf=output_0
		remote_obj=REPORT1
	}
	outputs {
		name=output_1
		remote_itf=input_2
		remote_obj=	EVM_REPORT
	}
}
####################################################IFFT


####################################################################PSS_SYCNH	
object {
	obj_name=PSS_SYNCH		
	exe_name=PSS_SYNCHROT21
	force_pe=0
	inputs {
		name=input_0
		remote_itf=output_0
		remote_obj=GRAPH_IFFT
	}
	outputs {
		name=output_0
		remote_itf=input_0
		remote_obj=GRAPH_PSS_SYNCH
	}
	outputs {
		name=output_1
		remote_itf=input_0
		remote_obj=GRAPH_CORREL
	}
	outputs {
		name=output_2
		remote_itf=input_0
		remote_obj=CHANNEL_ESTIMATOR
	}
}
####################################################################PSS_SYNCH	
####################################################################GRAPH_PSS_SYNCH
object {
	obj_name=GRAPH_PSS_SYNCH			
	exe_name=GRAPH
	force_pe=0
	inputs {
		name=input_0
		remote_itf=output_0
		remote_obj=PSS_SYNCH	
	}
	outputs {
		name=output_0
		remote_itf=input_0
		remote_obj=FFT	
	}
}
####################################################################GRAPH_PSS_SYNCH
####################################################################CHANNEL_ESTIMATOR
object {
	obj_name=CHANNEL_ESTIMATOR			
	exe_name=CHANNEL_ESTIMATOR2
	force_pe=0
	inputs {
		name=input_0
		remote_itf=output_2
		remote_obj=PSS_SYNCH
	}
	outputs {
		name=output_0
		remote_itf=input_0
		remote_obj=GRAPH_EQUAL	
	}
}
####################################################################GRAPH_FFT
####################################################################FFT
object {
	obj_name=FFT
	exe_name=fft_ifft
	force_pe=0
	inputs {
		name=input_0
		remote_itf=output_0
		remote_obj=GRAPH_PSS_SYNCH	
	}
	outputs {
		name=output_0
		remote_itf=input_0
		remote_obj=GRAPH_FFT
	}
}
####################################################################GRAPH_FFT
object {
	obj_name=GRAPH_FFT			
	exe_name=GRAPH
	force_pe=0
	inputs {
		name=input_0
		remote_itf=output_0
		remote_obj=FFT
	}
	outputs {
		name=output_0
		remote_itf=input_0
		remote_obj=EQUALIZER	
	}
}
####################################################################GRAPH_FFT

####################################################################GRAPH_EQUAL
object {
	obj_name=GRAPH_EQUAL
	exe_name=GRAPH
	force_pe=0
	inputs {
		name=input_0
		remote_itf=output_0
		remote_obj=CHANNEL_ESTIMATOR
	}
	outputs {
		name=output_0
		remote_itf=input_1
		remote_obj=EQUALIZER
	}
}
####################################################################GRAPH_EQUAL
####################################################################EQUALIZER
object {
	obj_name=EQUALIZER
	exe_name=EQUALIZER1
	force_pe=0		
	inputs {
		name=input_0
		remote_itf=output_0
		remote_obj=GRAPH_FFT
	}
	inputs {
		name=input_1
		remote_itf=output_0
		remote_obj=GRAPH_EQUAL
	}
	outputs {
		name=output_0
		remote_itf=input_0
		remote_obj=GRAPH_EQUALIZED
	}
	outputs {
		name=output_1
		remote_itf=input_0
		remote_obj=CHECK_CHANNEL
	}
}
####################################################################EQUALIZER
####################################################################GRAPH_EQUALIZED
object {
	obj_name=GRAPH_EQUALIZED			
	exe_name=GRAPH
	force_pe=0	
	inputs {
		name=input_0
		remote_itf=output_0
		remote_obj=EQUALIZER
	}
	outputs {
		name=output_0
		remote_itf=input_1
		remote_obj=EVM_REPORT
	}
}
####################################################################GRAPH_EQUALIZED

####################################################################DEMAPPING
object {
	obj_name=DEMAPPING
	exe_name=DOWNLINK_DEMAPPING
	force_pe=0	
	inputs {
		name=input_0
		remote_itf=output_1
		remote_obj=EVM_REPORT
	}
	outputs {
		name=output_0
		remote_itf=input_0
		remote_obj=GRAPH_DEMAPPING
	}
}
####################################################################DEMAPPING
####################################################################GRAPH_FFT
object {
	obj_name=GRAPH_DEMAPPING			
	exe_name=GRAPH
	force_pe=0
	inputs {
		name=input_0
		remote_itf=output_0
		remote_obj=DEMAPPING
	}
	outputs {
		name=output_0
		remote_itf=input_0
		remote_obj=DEMOD_16QAM
	}
}
####################################################################GRAPH_FFT

#EVM_REPORT

####################################################################DEMOD16QAM
object {
	obj_name=DEMOD_16QAM
	exe_name=MOD_QAM
	force_pe=0
	inputs {
		name=input_0
		remote_itf=output_0
		remote_obj=GRAPH_DEMAPPING
	}
	outputs {
		name=output_0
		remote_itf=input_0
		remote_obj=DESCRAMBLING
	}
}
####################################################################DEMOD16QAM
################################################DESCRAMBLING
object {
	obj_name=DESCRAMBLING
	exe_name=SCRAMBLING
	force_pe=0
	inputs {
		name=input_0
		remote_itf=output_0
		remote_obj=DEMOD_16QAM
	}
	outputs {
		name=output_0
		remote_itf=input_0
		remote_obj=LTETURBORXFLOATS
	}
}
################################################DESCRAMBLING
#######################################################################TURBODECODER
object {
	obj_name=LTETURBORXFLOATS
	exe_name=LTEturboCOD2
	force_pe=0
	inputs {
		name=input_0
		remote_itf=output_0
		remote_obj=DESCRAMBLING
	}
	outputs {
		name=output_0
		remote_itf=input_0
		remote_obj=UNCRC
	}
}
#######################################################################TURBODECODER
#######################################################################UNCRC
object {
	obj_name=UNCRC
	exe_name=CRC_REPORT
	force_pe=0
	inputs {
		name=input_0
		remote_itf=output_0
		remote_obj=LTETURBORXFLOATS
	}
	outputs {
		name=output_0
		remote_itf=input_0
		remote_obj=SOURCE_SINK
	}
	inputs {
		name=input_1
		remote_itf=output_2
		remote_obj=EVM_REPORT
	}
	outputs {
		name=output_1
		remote_itf=input_2
		remote_obj=SOURCE_SINK
	}
}
#######################################################################UNCRC

####################################################################CHECK_CHANNEL
object {
	obj_name=CHECK_CHANNEL			
	exe_name=GRAPH
	inputs {
		name=input_0
		remote_itf=output_1
		remote_obj=EQUALIZER
	}
}
####################################################################CHECK_CHANNEL

####################################################################GRAPH_CORREL
object {
	obj_name=GRAPH_CORREL			
	exe_name=GRAPH
	force_pe=0
	inputs {
		name=input_0
		remote_itf=output_1
		remote_obj=PSS_SYNCH	
	}
}
####################################################################GRAPH_CORREL


############################END
