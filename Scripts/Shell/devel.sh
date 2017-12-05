#!/bin/bash
#Fri Nov 24 00:36:16 IST 2017
#
#
#========================================================================================




#========================================================================================
latt_para_a=`grep -i "_cell_length_a" $1|gawk '{print $2}'`
latt_para_b=`grep -i "_cell_length_b" $1|gawk '{print $2}'`
latt_para_c=`grep -i "_cell_length_c" $1|gawk '{print $2}'`

latt_para_alpha=`grep -i "_cell_angle_alpha" $1|gawk '{print $2}'`
latt_para_beta=`grep -i "_cell_angle_beta" $1|gawk '{print $2}'`
latt_para_gamma=`grep -i "_cell_angle_gamma" $1|gawk '{print $2}'`

cell_volume=`grep -i "_cell_volume" $1|gawk '{print $2}'`

space_group_number=`grep -i "_space_group_IT_number" $1|gawk '{print $2}'`
#space_group_hall=`grep -i "_symmetry_space_group_name_Hall" $1|gawk -F' '{print $2}'`
#space_group_H-M=`grep -i "_symmetry_space_group_name_H-M" $1|gawk '{print $2}'`
#
#
#
#--------------------------------------
#Experimental parameters
#--------------------------------------
numelement=`grep -i "_chemical_formula_sum" $1 | gawk -F\' {'print $2'}|gawk {'print NF'}`
formulasum=`grep -i "_chemical_formula_sum" $1 | gawk -F\' {'print $2'}`
clear
echo "===================================================="
echo "                      SUMMARY"
echo "==================================================="
echo "File Name "
echo "----------"
echo $1
echo ""
echo "Structural formula : "$formulasum
echo "Number of diffent atoms : " $numelement
echo "Space group Number : "$space_group_number
echo ""
echo "Cell Length, a = "$latt_para_a
echo "Cell Length, b = "$latt_para_b
echo "Cell Length, c = "$latt_para_c
echo ""
echo "Cell Angle, alpha = "$latt_para_alpha
echo "Cell Angle, beta = "$latt_para_beta
echo "Cell Angle, gamma = "$latt_para_gamma
echo ""
echo "Cell Volume, volume = "$cell_volume
echo "==================================================="


