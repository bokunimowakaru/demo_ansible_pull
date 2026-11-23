#!/bin/bash
###############################################################################
# 自動実行ツール
#
#                                             (c) 2026 by 国野亘 <bokunimo.net>
###############################################################################

files=(`ls -1 pb*.sh`)
N=${#files[@]}
i=0

mkdir -p ~/ota-log/
log_path=~/ota-log/demo_ansible.log

log() {
  echo `date "+%Y/%m/%d %R"` "[AutoTest]["${files[$((i - 1))]}"]: "${1}\
      | tee -a ${log_path}
}

for i in `seq ${N}`; do
  log "################################################################"
  log "Start"
  bash ${files[$((i - 1))]} 2>&1 | tee -a ${log_path}
  log "Done"
done
