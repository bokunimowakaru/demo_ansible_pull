#!/bin/bash
###############################################################################
# 更新用ツール update.sh for Ansible
#
#                                             (c) 2025 by 国野亘 <bokunimo.net>
###############################################################################

target="pb04_ota_rollback/site.yml"
log_label="[Updater][pb04]: "
sleep_max=60

set -e      # コマンドの終了コード($!)が0以外のときに実行を中断する設定
# 引数入力のログ出力先を確認
if [ $# -ge 1 ]; then
    log_path="$(realpath -m -- "${1}")"
    if [ -z "$log_path" ]; then
        log_path=~/ota-log/demo_ansible.log
    fi
else
    log_path=~/ota-log/demo_ansible.log
fi
# 開始ログを出力
echo `date "+%Y/%m/%d %R"` ${log_label}"Started" | tee -a $log_path
echo `date "+%Y/%m/%d %R"` ${log_label}"target    = "${target}| tee -a $log_path
echo `date "+%Y/%m/%d %R"` ${log_label}"log_path  = "${log_path}| tee -a $log_path
echo `date "+%Y/%m/%d %R"` ${log_label}"sleep_max = "${sleep_max}" secs" | tee -a $log_path
sleep $(( RANDOM % sleep_max ))
echo `date "+%Y/%m/%d %R"` ${log_label}"Start ansible-pull" | tee -a $log_path

# Playbookを実行
ansible-pull -o \
    -U https://bokunimo.net/git/demo_ansible_pull.git \
    -c local \
    ${target} 2>> $log_path

# 終了ログを出力
echo `date "+%Y/%m/%d %R"` ${log_label}"Done jobs" | tee -a $log_path

exit 0
