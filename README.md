# demo_ansible_pull

## リポジトリの概要

Ansible の `ansible-pull` を使い、Raspberry Pi 上のシェルアプリを導入・更新する OTA のデモです。定期更新やロールバック、アンインストールまで、段階別の Playbook で試せます。

## ansible-pull とは

Git リポジトリから Playbook を取得し、実行する Ansible のコマンドです。管理対象の Raspberry Pi 側からリポジトリを取得して処理するため、中央サーバーからの接続を必要としません。

## Raspberry Pi での実行方法

Raspberry Pi OS 上で Ansible を準備し、目的に合ったスクリプトを実行します。スクリプトは `ansible-pull` でこのリポジトリの Playbook を実行します。

1. Raspberry Pi をネットワークに接続し、端末を開きます。
2. Ansible をインストールします。
   ```sh
   sudo apt update
   sudo apt install -y ansible git
   ```
3. このリポジトリを取得して、ディレクトリに移動します。
   ```sh
   git clone https://bokunimo.net/git/demo_ansible_pull.git
   cd demo_ansible_pull
   ```
4. 試したい例のスクリプトを実行します（例：初回インストール）。
   ```sh
   bash ex01_ota.sh
   ```
   `-K` による権限昇格のため、実行時にパスワードを求められます。
5. 日次更新の例では、`ex03_ota.sh` を実行すると毎日午前3時の更新ジョブが設定されます。アンインストール例は `/opt/ota-demo` とホームディレクトリ内の `ota-log` を削除するため注意してください。

## Playbook の一覧

| Playbook | 説明 |
| --- | --- |
| [ex01_ota_install](ex01_ota_install/site.yml) | アプリとログ用ファイルを用意し、サンプルアプリをインストールして実行します。 |
| [ex02_ota_update](ex02_ota_update/site.yml) | サンプルアプリを更新して実行し、更新用スクリプトを配置します。 |
| [ex03_ota_cron](ex03_ota_cron/site.yml) | 更新用スクリプトを配置し、毎日午前3時に実行する cron を設定します。 |
| [ex04_ota_rollback](ex04_ota_rollback/site.yml) | 更新前にアプリをバックアップし、更新や確認に失敗した場合は復元します。 |
| [ex04_ota_rollback_error](ex04_ota_rollback_error/site.yml) | アプリの確認を意図的に失敗させ、バックアップからのロールバックを試します。 |
| [ex05_ota_uninstall](ex05_ota_uninstall/site.yml) | cron の更新ジョブを解除し、アプリとログ用ファイルを削除します。 |
