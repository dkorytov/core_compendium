#!/bin/bash 

output_tex="appndx/mstar0.5.tex"
echo "" > $output_tex
param_pattern="figs/params/cfn/simet/mstar0.5/@mass@@fit@/a_@model@"
mass=("mean" "crit")
mass_label=("M200m" "M200c")
model=("rd" "rm" "rd_rm")
model_label=("Disruption Only" "Merging Only" "Disruption and Merging")
fit=("" "/abund")
fit_label=("Profile Fit" "Profile and Abundance")
for mass_i in 0 1;do
    for fit_i in 0 1; do 
	for model_i in 0 1 2; do
	    title="${mass_label[$mass_i]}, Mstar+1, ${fit_label[$fit_i]}, ${model_label[$model_i]}"
	    param=`echo ${param_pattern} | sed "s/@mass@/${mass[${mass_i}]}/g" | sed "s/@model@/${model[${model_i}]}/g" | sed "s%@fit@%${fit[${fit_i}]}%g" | sed "s/@title@/${title}/g"`
	    sed "s%@fig_param@%${param}%g" <appndx/template.tex | sed "s/@title@/$title/g" >> $output_tex 
	done
    done
done
