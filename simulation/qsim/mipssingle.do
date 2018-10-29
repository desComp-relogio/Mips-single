onerror {exit -code 1}
vlib work
vlog -work work mipssingle.vo
vlog -work work WaveformDecoder.vwf.vt
vsim -novopt -c -t 1ps -L cycloneive_ver -L altera_ver -L altera_mf_ver -L 220model_ver -L sgate_ver -L altera_lnsim_ver work.decoder_vlg_vec_tst -voptargs="+acc"
vcd file -direction mipssingle.msim.vcd
vcd add -internal decoder_vlg_vec_tst/*
vcd add -internal decoder_vlg_vec_tst/i1/*
run -all
quit -f
