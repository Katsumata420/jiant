
set -e

task=$1 # MR; CR; SUBJ; MPQA
config=$2
task=`echo $task | perl -ne "print lc"`
k_fold=(0 1 2 3 4)

source user_config_template.sh

for k in ${k_fold[@]}
do
    task_name=${task}${k}
    python main.py --config_file $config \
           --overrides "run_name = ${task}-${k}, pretrain_tasks = ${task_name}, target_tasks = ${task_name}" 
done
