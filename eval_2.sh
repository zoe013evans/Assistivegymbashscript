#!/bin/bash 

for i in r1_2_h1_2 r0_9_h0_9 r1_0_h1_0 r1_2_h1_0 r1_0_h1_2
do 
	#Get the config file for this agent and put it in the main 
	cp assistive_gym/configs/config_$i.ini assistive_gym/config.ini
	echo $i 
	#echo what we're on 
	#and then for another for loop, where we evaluate it against every other 
	for j in r1_2_h1_2 r0_9_h0_9 r1_0_h1_0 r1_2_h1_0 r1_0_h1_2
	do 
		
		echo "human type $i on policy type $j" 
		echo "eval_hp_$i$j"
		python3 -m assistive_gym.learn --env "FeedingSawyer-v1" --algo ppo --evaluate --eval-episodes 100 --seed 0 --verbose --load-policy-path ./zoe_trained_models/$j/ > zoe_trained_models/$i/eval_hp_$i$j.txt
	done
done 
