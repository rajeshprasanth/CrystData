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
numelement=`grep -i "_chemical_formula_sum" *cif | gawk -F\' {'print $2'}|gawk {'print NF'}`

echo $latt_para_a
echo $latt_para_b
echo $latt_para_c

echo $latt_para_alpha
echo $latt_para_beta
echo $latt_para_gamma

echo $cell_volume

echo $space_group_number
echo $numelement

fname=$1

sqlite3 -column -header ./CrystData.db << EOS
	--create table if not exists persons (PersonId int, LastName varchar(255), FirstName varchar(255), Address varchar(255), City varchar(255));
	--insert into persons (PersonId, LastName, FirstName, Address, City)values('1', 'prashanth', 'rajesh', 'xyz', 'chennai');
	
	create table if not exists cell (
			Id             integer primary key autoincrement, Date text,
			Tracker        text,
			CellLengtha    real, 
			CellLengthb    real, 
			CellLengthc    real, 
			CellAngleAlpha real, 
			CellAngleBeta  real, 
			CellAngleGamma real, 
			CellVolume     real, 
			SpaceGroup     integer
	);
	
	insert into cell (
			Date,
			Tracker, 
			CellLengtha, 
			CellLengthb, 
			CellLengthc, 
			CellAngleAlpha, 
			CellAngleBeta, 
			CellAngleGamma, 
			CellVolume, 
			SpaceGroup
	) values (datetime('now','localtime'), '$fname', $latt_para_a, $latt_para_b, $latt_para_c, $latt_para_alpha, $latt_para_beta, $latt_para_gamma, $cell_volume, $space_group_number);
	select * from cell;
EOS

