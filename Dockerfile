# Python 3.10イメージをベースに使用
FROM python:3.10-slim

# gitとNode.jsをインストール
RUN apt-get update && apt-get install -y git curl
RUN curl -fsSL https://deb.nodesource.com/setup_14.x | bash -
RUN apt install -y nodejs
# RUN apt install -y npm

# アプリケーションディレクトリを作成
WORKDIR /usr/src/app

# # pokemon-showdownリポジトリをクローン
# RUN git clone https://github.com/smogon/pokemon-showdown.git .
# RUN npm install
# RUN cp config/config-example.js config/config.js

# # アプリケーションがリッスンするポートを指定
# EXPOSE 8000
