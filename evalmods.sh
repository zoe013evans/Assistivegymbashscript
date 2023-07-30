#!/bin/bash 


#Evaluate a model: 






for i in r1_2_h1_2 r0_9_h0_9 r1_0_h1_0 r1_2_h1_0 r1_0_h1_2
do
	cp assistive_gym/configs/config_$i.ini assistive_gym/config.ini
	echo $i
	python3 -m assistive_gym.learn --env "FeedingSawyer-v1" --algo ppo --evaluate --eval-episodes 2 --seed 0 --verbose --load-policy-path ./zoe_trained_models/$i/ > zoe_trained_models/$i/eval.txt
	
done
