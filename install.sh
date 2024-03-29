#!/bin/bash

#安装filebeat
mkdir ~/soft
cd ~/soft
wget --no-check-certificate https://artifacts.elastic.co/downloads/beats/filebeat/filebeat-6.5.4-x86_64.rpm
yum install filebeat-6.5.4-x86_64.rpm -y

#配置开机自启动
echo 'systemctl start filebeat' >> /etc/rc.d/rc.local

#修改配置文件
mv /etc/filebeat/filebeat.yml  /etc/filebeat/filebeat-copy.yml
cp /home/filebeat_install/filebeat.yml /etc/filebeat/filebeat.yml

#启动filebeat
systemctl start filebeat

sleep 10s

#查询启动日志
tail -f /var/log/filebeat/filebeat
