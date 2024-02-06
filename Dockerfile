# Python 3.10イメージをベースに使用
# FROM python:3.10-slim
FROM nikolaik/python-nodejs:python3.11-nodejs21

# gitとNode.jsをインストール
RUN apt-get update && apt-get install -y git curl

# アプリケーションディレクトリを作成
WORKDIR /usr/src/app

# # pokemon-showdownリポジトリをクローン
RUN git clone https://github.com/smogon/pokemon-showdown.git 
WORKDIR /usr/src/app/pokemon-showdown
RUN npm install
RUN cp config/config-example.js config/config.js

# PokeLLMon 環境一式をダウンロード
COPY requirements.txt .
RUN pip install -r requirements.txt

# アプリケーションがリッスンするポートを指定
EXPOSE 8000
# アプリケーションを起動するコマンド
CMD [ "node", "pokemon-showdown", "start", "--no-security" ]
