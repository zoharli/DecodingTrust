squeue -u u.zl123949 | grep dt-main | awk '{print $1}' | xargs -n 1 scontrol show job | grep -oE 'StdOut=(.*)' | sed 's/StdOut=//' | xargs -n 1 head | grep "Loading Hugging Face model for config"
