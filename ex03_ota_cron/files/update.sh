#!/bin/bash
set -e      # コマンドの終了コード($!)が0以外のときに実行を中断する設定
if [ $# -ge 1 ]; then
    log_path=$1
else
    log_path=~/ota-log/demo_ansible.log
fi

# 開始ログを出力
echo `date "+%Y/%m/%d %R"` "[Demo Ansible][ex03]: Updater Started" | tee -a $log_path

# Playbookを実行
ansible-pull -o \
    -U https://bokunimo.net/git/demo_ansible_pull.git \
    -c local \
    ex03_ota_cron/site.yml 2>> $log_path

# 終了ログを出力
echo `date "+%Y/%m/%d %R"` "[Demo Ansible][ex03]: Updater Done jobs" | tee -a $log_path
