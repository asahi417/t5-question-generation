# In this experiment, we down-sample the QA pairs generated by T5 Large End2End QAG to match the original dataset.
# We tested 10 different random seeds and take the average over the trials.

QAE () {
  RANDOM_SEED=${1}
  LM=${2}
  QAG=${3}
  for NAME in 'amazon' 'new_wiki' 'nyt' 'reddit'
  do
    _PATH="qa_eval_output/random_sampling.${LM}.${QAG}/${RANDOM_SEED}.${NAME}/test_result.json"
    if [ -f "${_PATH}" ]; then
      echo "${_PATH} exists."
    else
      lmqg-qae -d "lmqg/qa_squadshifts_synthetic_random" -n "${LM}.${QAG}.${NAME}.seed_${RANDOM_SEED}" --output-dir "qa_eval_output/random_sampling.${LM}.${QAG}/${RANDOM_SEED}.${NAME}" --down-sample-size-train 1000 --down-sample-size-valid 500 --ray-result-dir "ray_results/ray_${RANDOM_SEED}.${LM}.${QAG}${NAME}" --num-cpus 1
      rm -rf "ray_results/ray_${RANDOM_SEED}.${LM}.${QAG}${NAME}"
    fi
  done
}

QAE 0 "t5-large-squad" "end2end"
QAE 1 "t5-large-squad" "end2end"
QAE 2 "t5-large-squad" "end2end"
QAE 3 "t5-large-squad" "end2end"
QAE 4 "t5-large-squad" "end2end"
QAE 5 "t5-large-squad" "end2end"
QAE 6 "t5-large-squad" "end2end"
QAE 7 "t5-large-squad" "end2end"
QAE 8 "t5-large-squad" "end2end"
QAE 9 "t5-large-squad" "end2end"

QAE 0 "t5-large-squad" "pipeline"
QAE 1 "t5-large-squad" "pipeline"
QAE 2 "t5-large-squad" "pipeline"
QAE 3 "t5-large-squad" "pipeline"
QAE 4 "t5-large-squad" "pipeline"
QAE 5 "t5-large-squad" "pipeline"
QAE 6 "t5-large-squad" "pipeline"
QAE 7 "t5-large-squad" "pipeline"
QAE 8 "t5-large-squad" "pipeline"
QAE 9 "t5-large-squad" "pipeline"

QAE 0 "t5-large-squad" "multitask"
QAE 1 "t5-large-squad" "multitask"
QAE 2 "t5-large-squad" "multitask"
QAE 3 "t5-large-squad" "multitask"
QAE 4 "t5-large-squad" "multitask"
QAE 5 "t5-large-squad" "multitask"
QAE 6 "t5-large-squad" "multitask"
QAE 7 "t5-large-squad" "multitask"
QAE 8 "t5-large-squad" "multitask"
QAE 9 "t5-large-squad" "multitask"

QAE 0 "bart-large-squad" "pipeline"
QAE 1 "bart-large-squad" "pipeline"
QAE 2 "bart-large-squad" "pipeline"
QAE 3 "bart-large-squad" "pipeline"
QAE 4 "bart-large-squad" "pipeline"
QAE 5 "bart-large-squad" "pipeline"
QAE 6 "bart-large-squad" "pipeline"
QAE 7 "bart-large-squad" "pipeline"
QAE 8 "bart-large-squad" "pipeline"
QAE 9 "bart-large-squad" "pipeline"


QAE 0 "bart-large-squad" "multitask"
QAE 1 "bart-large-squad" "multitask"
QAE 2 "bart-large-squad" "multitask"
QAE 3 "bart-large-squad" "multitask"
QAE 4 "bart-large-squad" "multitask"
QAE 5 "bart-large-squad" "multitask"
QAE 6 "bart-large-squad" "multitask"
QAE 7 "bart-large-squad" "multitask"
QAE 8 "bart-large-squad" "multitask"
QAE 9 "bart-large-squad" "multitask"