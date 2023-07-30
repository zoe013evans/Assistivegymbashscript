#!/bin/bash 

#SO what do we need to do 

#Activate virtual environment for Python Scripts

#Create different config files 
#Copy the config file we want and then rename it to config 



for i in r1_2_h1_2 r0_9_h0_9 r1_0_h1_0 r1_2_h1_0 r1_0_h1_2
do
	cp assistive_gym/configs/config_$i.ini assistive_gym/config.ini
	echo $i
	mkdir zoe_trained_models/$i 
	python -m assistive_gym.learn --env "FeedingSawyer-v1" --algo ppo --train --train-timesteps 2 --save-dir ./zoe_trained_models/$i
	cp assistive_gym/config.ini ./zoe_trained_models/$i
done




#Run training from bash script 

#Save model in new directory 

