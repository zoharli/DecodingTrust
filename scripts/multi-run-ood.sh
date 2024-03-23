#!/bin/bash

declare -a folders=( "ood" )
# declare -a folders=("adv_demonstration")

# command="dt-run --config-name slurm_config --multirun +model_config=autogptq,hf"
# command="dt-run --config-name slurm_config --multirun +model_config=vicuna-13b-v1.3-mag_2to4,vicuna-13b-v1.3-sparsegpt_2to4"
# command="dt-run --config-name slurm_config --multirun +model_config=llama-2-13b-chat-sparsegpt_2to4,llama-2-13b-chat-mag_2to4"
#command="dt-run --config-name slurm_config --multirun +model_config=llama-2-13b-chat,llama-2-13b-chat-mag_2to4,llama-2-13b-chat-wanda_2to4,llama-2-13b-chat-sparsegpt_2to4,llama-2-13b-chat-awq-4bit,llama-2-13b-chat-awq-8bit,llama-2-13b-chat-gptq-3bit,llama-2-13b-chat-gptq-4bit,llama-2-13b-chat-gptq-8bit,vicuna-13b-v1.3,vicuna-13b-v1.3-mag_2to4,vicuna-13b-v1.3-wanda_2to4,vicuna-13b-v1.3-sparsegpt_2to4,vicuna-13b-v1.3-awq-3bit,vicuna-13b-v1.3-awq-4bit,vicuna-13b-v1.3-awq-8bit,llama-2-13b,llama-2-13b-mag_2to4,llama-2-13b-wanda_2to4,llama-2-13b-sparsegpt_2to4,llama-2-13b-awq-3bit,llama-2-13b-awq-4bit,llama-2-13b-awq-8bit,llama-2-13b-gptq-3bit,llama-2-13b-gptq-4bit,llama-2-13b-gptq-8bit"
#command="dt-run --config-name slurm_config --multirun +model_config=vicuna-13b-v1.3-gptq-4bit,vicuna-13b-v1.3-gptq-8bit,vicuna-13b-v1.3-gptq-3bit,llama-2-13b"
#command="dt-run --config-name slurm_config --multirun +model_config=vicuna-13b-v1.3-gptq-3bit"
command="dt-run --config-name slurm_config --multirun +model_config=llama-2-13b-chat-gptq-8bit"


for folder in "${folders[@]}"; do
    # get all config names without the .yaml extension
    configs=$(ls src/dt/configs/${folder}/*.yaml | xargs -n 1 basename | sed 's/.yaml//' | tr '\n' ',' | sed 's/,$//')
    eval "${command} +${folder}=${configs}"
done

# run the constructed command
#eval $command
