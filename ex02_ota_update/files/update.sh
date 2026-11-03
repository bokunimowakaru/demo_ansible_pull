#!/bin/bash
set -e      // コマンドの終了コード($!)が0以外のときに実行を中断します
echo `date "+%Y/%m/%d %R"` "[Demo Ansible][ex02]: Updater Started" | tee -a /tmp/demo_ansible.log

# Playbookを実行
ansible-pull -o
    -U https://bokunimo.net/git/demo_ansible_pull.git \
    -i localhost, \
    -c local \
    ex02_ota_update/site.yml 2>> /tmp/demo_ansible.log
echo `date "+%Y/%m/%d %R"` "[Demo Ansible][ex02]: Updater Done jobs" | tee -a /tmp/demo_ansible.log
