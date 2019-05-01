apt-get install python-gevent python-pip
apt-get install python-m2crypto
pip install shadowsocks

sudo vim /home/ubuntu/.local/lib/python2.7/site-packages/shadowsocks/crypto/openssl.py
%s/cleanup/reset/g    in vim

vim /etc/shadowsocks.json
{
    "server":"0.0.0.0",
    "server_port":8888,
    "local_address": "127.0.0.1",
    "local_port":1080,
    "password":"<password>",
    "timeout":800,
    "method":"aes-256-cfb"
}
