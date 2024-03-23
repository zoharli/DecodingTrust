#!/bin/bash
i=0
#for target_model in "llama2-13b-chat-wanda_2to4" "llama-2-13b-wanda_2to4" "vicuna-13b-v1.3-wanda_2to4"
#for target_model in "vicuna-13b-v1.3-awq-3bit" "vicuna-13b-v1.3-awq-4bit" "vicuna-13b-v1.3-awq-8bit"
#for target_model in "llama-2-13b-chat-gptq-3bit" "llama-2-13b-chat-gptq-4bit" "llama-2-13b-chat-gptq-8bit"
#for target_model in "llama-2-13b-chat-gptq-3bit" "llama-2-13b-chat-gptq-4bit" "llama-2-13b-chat-awq-3bit" "llama-2-13b-chat-awq-4bit" "llama-2-13b-chat-awq-8bit" 
# for target_model in "llama-2-13b-chat-gptq-3bit" "llama-2-13b-chat-gptq-4bit" "llama-2-13b-wanda_2to4"
# for target_model in "vicuna-13b-v1.3-gptq-3bit-cal256-seed2" 
# for target_model in "llama-2-13b-chat-sparsegpt_2to4-seed0" "llama-2-13b-chat-sparsegpt_2to4-seed1" "llama-2-13b-chat-sparsegpt_2to4-seed2"
# for target_model in "llama-2-7b" "vicuna-7b-v1.3"
# for target_model in "llama-2-13b-chat-awq-3bit-seed0_nosys" "llama-2-13b-chat-awq-3bit-seed1_nosys" "llama-2-13b-chat-awq-3bit-seed2_nosys" "llama-2-13b-chat-awq-4bit-seed0_nosys" "llama-2-13b-chat-awq-4bit-seed1_nosys" "llama-2-13b-chat-awq-4bit-seed2_nosys"
# for target_model in "llama-2-13b-chat-awq-3bit-seed0_trust" "llama-2-13b-chat-awq-3bit-seed1_trust" "llama-2-13b-chat-awq-3bit-seed2_trust" "llama-2-13b-chat-awq-4bit-seed0_trust" "llama-2-13b-chat-awq-4bit-seed1_trust" "llama-2-13b-chat-awq-4bit-seed2_trust"
for target_model in "llama-2-13b-chat-awq-3bit-seed0_fact" "llama-2-13b-chat-awq-3bit-seed1_fact" "llama-2-13b-chat-awq-3bit-seed2_fact" "llama-2-13b-chat-awq-4bit-seed0_fact" "llama-2-13b-chat-awq-4bit-seed1_fact" "llama-2-13b-chat-awq-4bit-seed2_fact"

do
    for few_shot_num in 0 32
    do
        for test_num in 0 200
        do
            for jailbreak_prompt in 0 1 2 3 4 5
            do
                for evasive_sentence in 0 1 2 3 4 5
                do
                    if [ $jailbreak_prompt -gt 0 ] && [ $evasive_sentence -gt 0 ]; then
                        continue
                    fi
                    if [ $jailbreak_prompt -eq 0 ] && [ $evasive_sentence -eq 0 ] && [ $few_shot_num -eq 32 ] && [ $test_num -eq 200 ]; then
                        continue
                    fi
                    if [ $jailbreak_prompt -gt 0 ] || [ $evasive_sentence -gt 0 ]; then
                        if [ $few_shot_num -eq 32 ] || [ $test_num -eq 0 ]; then
                            continue
                        fi
                    fi
                    setting=ethics_commonsense_short
                    mkdir -p "logs/results/machine_ethics/${target_model}/"
                    echo "${setting} jailbreak_prompt ${jailbreak_prompt} evasive_sentence ${evasive_sentence} few_shot_num ${few_shot_num} test_num ${test_num}"
                    cat << EOF | sbatch
#!/bin/bash
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --mem=62g
#SBATCH --output="logs/results/machine_ethics/${target_model}/${setting}-${few_shot_num}-${test_num}-${jailbreak_prompt}-${evasive_sentence}.out"
#SBATCH --error="logs/results/machine_ethics/${target_model}/${setting}-${few_shot_num}-${test_num}-${jailbreak_prompt}-${evasive_sentence}.err"
#SBATCH --cpus-per-task=8
#SBATCH --partition=compute
#SBATCH --job-name=machine_ethics--${target_model}--${setting}--${few_shot_num}--${test_num}--${jailbreak_prompt}--${evasive_sentence}
#SBATCH --time=40:00:00 # hh:mm:ss for the job
#SBATCH --gres=gpu:h100:1

ml load Anaconda3/2022.10
# conda activate dt-test
source ~/.bashrc


echo "$LD_LIBRARY_PATH"

cd /scratch/user/u.zl123949/DecodingTrust || exit

NODE_LIST=$( scontrol show hostname "$SLURM_JOB_NODELIST" | sed -z 's/\n/\:4,/g' )
NODE_LIST=${NODE_LIST%?}

echo "Job is starting on $(hostname) with $SLURM_NTASKS tasks on $NODE_LIST"

echo "${target_model}"

dt-run +model_config=${target_model} +machine_ethics=${setting} ++machine_ethics.few_shot_num=${few_shot_num} ++machine_ethics.test_num=${test_num} ++machine_ethics.jailbreak_prompt=${jailbreak_prompt} ++machine_ethics.evasive_sentence=${evasive_sentence}

EOF
                done
            done
        done
    done
((i++))
done
