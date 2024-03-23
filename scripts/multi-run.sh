#!/bin/bash

#declare -a folders=( "privacy" )
#declare -a folders=( "advglue" "privacy" )
#declare -a folders=( "adv_demonstration" "fairness" "ood" )
#declare -a folders=( "adv_demonstration" "advglue" "fairness" "ood" "privacy" )
#declare -a folders=( "adv_demonstration" "advglue" "fairness" "ood" "privacy" "stereotype" "toxicity")
#declare -a folders=( "stereotype" )
#declare -a folders=( "ood" )
# declare -a folders=( "privacy" )
# declare -a folders=( "ood" )


#command="dt-run --config-name slurm_config --multirun +model_config=llama-2-13b-chat-wanda_2to4,llama-2-13b-wanda_2to4,vicuna-13b-v1.3-wanda_2to4"
#command="dt-run --config-name slurm_config --multirun +model_config=llama-2-13b-chat-awq-4bit,llama-2-13b-chat-awq-8bit"
#command="dt-run --config-name slurm_config --multirun +model_config=llama-2-13b-chat-wanda_1to2,llama-2-13b-chat-wanda_4to8"
#command="dt-run --config-name slurm_config --multirun +model_config=vicuna-13b-v1.3-awq-8bit"
#command="dt-run --config-name slurm_config --multirun +model_config=llama-2-13b-chat-sparsegpt_1to2,llama-2-13b-chat-sparsegpt_4to8"
#command="dt-run --config-name slurm_config --multirun +model_config=llama-2-13b-chat-mag_1to2,llama-2-13b-chat-mag_4to8"
# command="dt-run --config-name slurm_config --multirun +model_config=llama-2-13b-chat-gptq-4bit"
#command="dt-run --config-name slurm_config --multirun +model_config=llama-2-13b-chat,llama-2-13b-gptq-3bit,llama-2-13b-chat-mag_2to4,llama-2-13b-chat-sparsegpt_2to4,llama-2-13b-chat-gptq-3bit,vicuna-13b-awq-3bit,vicuna-13b-v1.3-mag_2to4"
#command="dt-run --config-name slurm_config --multirun +model_config=llama-2-13b-awq-8bit"
# command="dt-run --config-name slurm_config --multirun +model_config=llama-2-13b-gptq-3bit,llama-2-13b-chat-gptq-3bit ++ood.resume=True,True"

# declare -a folders=( "stereotype" "toxicity" )
# command="dt-run --config-name slurm_config --multirun +model_config=llama-2-13b-chat-mag_1to2,llama-2-13b-chat-mag_4to8,llama-2-13b-chat-wanda_1to2,llama-2-13b-chat-wanda_4to8,llama-2-13b-chat-sparsegpt_1to2,llama-2-13b-chat-sparsegpt_4to8"

# declare -a folders=( "advglue" )
#command="dt-run --config-name slurm_config --multirun +model_config=vicuna-13b-v1.3-gptq-3bit-cal128-seed0,vicuna-13b-v1.3-gptq-3bit-cal128-seed2,vicuna-13b-v1.3-gptq-3bit-cal256-seed2,vicuna-13b-v1.3-gptq-3bit-cal512-seed2,vicuna-13b-v1.3-gptq-4bit-cal1024-seed1,vicuna-13b-v1.3-gptq-4bit-cal128-seed0,llama-2-13b-chat-gptq-3bit-cal1024-seed2,llama-2-13b-chat-gptq-3bit-cal128-seed1,llama-2-13b-chat-gptq-4bit-cal256-seed0"
# command="dt-run --config-name slurm_config --multirun +model_config=vicuna-13b-v1.3-gptq-3bit-cal256-seed2"

# declare -a folders=( "adv_demonstration" "fairness" "ood" "privacy" "stereotype" "toxicity")

# command="dt-run --config-name slurm_config --multirun +model_config=llama-2-13b-chat-sparsegpt_2to4-seed0,llama-2-13b-chat-sparsegpt_2to4-seed1,llama-2-13b-chat-sparsegpt_2to4-seed2"

# declare -a folders=( "stereotype" "toxicity" )

# command="dt-run --config-name slurm_config --multirun +model_config=llama-2-13b-chat-awq-3bit-seed0,llama-2-13b-chat-awq-3bit-seed1,llama-2-13b-chat-awq-3bit-seed2,llama-2-13b-chat-gptq-3bit-cal128-seed0,llama-2-13b-chat-gptq-3bit-cal128-seed1,llama-2-13b-chat-gptq-3bit-cal128-seed2"

# declare -a folders=( "adv_demonstration" "advglue" "fairness" "ood" "privacy" "stereotype" "toxicity")

# command="dt-run --config-name slurm_config --multirun +model_config=llama-2-7b,vicuna-7b-v1.3"

# declare -a folders=( "stereotype" "toxicity" )

# command="dt-run --config-name slurm_config --multirun +model_config=llama-2-13b-chat-gptq-4bit-cal128-seed0,llama-2-13b-chat-gptq-4bit-cal128-seed1,llama-2-13b-chat-gptq-4bit-cal128-seed2"

# declare -a folders=( "stereotype" "toxicity" )

# command="dt-run --config-name slurm_config --multirun +model_config=vicuna-7b-v1.3"

# declare -a folders=( "adv_demonstration" "advglue" "fairness" "ood" "privacy" )
# command="dt-run --config-name slurm_config --multirun +model_config=llama-2-13b-chat-awq-3bit-seed0_nosys,llama-2-13b-chat-awq-3bit-seed1_nosys,llama-2-13b-chat-awq-3bit-seed2_nosys,llama-2-13b-chat-awq-4bit-seed0_nosys,llama-2-13b-chat-awq-4bit-seed1_nosys,llama-2-13b-chat-awq-4bit-seed2_nosys"
# declare -a folders=( "adv_demonstration" "advglue" "fairness" "ood" "privacy" )
# command="dt-run --config-name slurm_config --multirun +model_config=llama-2-13b-chat-awq-3bit-seed0_trust,llama-2-13b-chat-awq-3bit-seed1_trust,llama-2-13b-chat-awq-3bit-seed2_trust,llama-2-13b-chat-awq-4bit-seed0_trust,llama-2-13b-chat-awq-4bit-seed1_trust,llama-2-13b-chat-awq-4bit-seed2_trust"
# declare -a folders=( "adv_demonstration" "advglue" "fairness" "ood" "privacy" )
# command="dt-run --config-name slurm_config --multirun +model_config=llama-2-13b-chat-awq-3bit-seed0_fact,llama-2-13b-chat-awq-3bit-seed1_fact,llama-2-13b-chat-awq-3bit-seed2_fact,llama-2-13b-chat-awq-4bit-seed0_fact,llama-2-13b-chat-awq-4bit-seed1_fact,llama-2-13b-chat-awq-4bit-seed2_fact"

# declare -a folders=( "advglue" "privacy" )
# command="dt-run --config-name slurm_config --multirun +model_config=llama-2-13b-chat-awq-4bit_nosys,llama-2-13b-chat-awq-8bit_nosys,llama-2-13b-chat_nosys"
# declare -a folders=( "advglue" "privacy" )
# command="dt-run --config-name slurm_config --multirun +model_config=llama-2-13b-chat-awq-4bit_trust,llama-2-13b-chat-awq-8bit_trust,llama-2-13b-chat_trust"

# declare -a folders=( "ood" )
# command="dt-run --config-name slurm_config --multirun +model_config=llama-2-13b-chat-gptq-3bit-cal128-seed0-no_sys,llama-2-13b-chat-gptq-3bit-cal128-seed1-no_sys,llama-2-13b-chat-gptq-3bit-cal128-seed2-no_sys,llama-2-13b-chat-gptq-4bit-cal128-seed0_nosys,llama-2-13b-chat-gptq-4bit-cal128-seed1_nosys,llama-2-13b-chat-gptq-4bit-cal128-seed2_nosys"
# command="dt-run --config-name slurm_config --multirun +model_config=llama-2-13b-chat-gptq-3bit-cal128-seed0-trust,llama-2-13b-chat-gptq-3bit-cal128-seed1-trust,llama-2-13b-chat-gptq-3bit-cal128-seed2-trust,llama-2-13b-chat-gptq-4bit-cal128-seed0_trust,llama-2-13b-chat-gptq-4bit-cal128-seed1_trust,llama-2-13b-chat-gptq-4bit-cal128-seed2_trust"



declare -a folders=( "ood" "advglue")
command="dt-run --config-name slurm_config --multirun +model_config=llama-2-70b-chat-gptq-4bit,llama-2-7b-chat-gptq-4bit"


for folder in "${folders[@]}"; do
    # get all config names without the .yaml extension
    configs=$(ls src/dt/configs/${folder}/*.yaml | xargs -n 1 basename | sed 's/.yaml//' | tr '\n' ',' | sed 's/,$//')
    eval "${command} +${folder}=${configs}"
done

# run the constructed command
#eval $command
