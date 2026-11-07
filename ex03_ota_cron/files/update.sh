#!/bin/bash
set -e      # コマンドの終了コード($!)が0以外のときに実行を中断する設定

# 開始ログを出力
echo `date "+%Y/%m/%d %R"` "[Demo Ansible][ex03]: Updater Started" | tee -a ~/ota-log/demo_ansible.log

# Playbookを実行
ansible-pull -o \
    -U https://bokunimo.net/git/demo_ansible_pull.git \
    -c local \
    ex03_ota_cron/site.yml 2>> ~/ota-log/demo_ansible.log

# 終了ログを出力
echo `date "+%Y/%m/%d %R"` "[Demo Ansible][ex03]: Updater Done jobs" | tee -a ~/ota-log/demo_ansible.log
