# PokéLLMon

これは、「PokéLLMon: A Human-Parity Agent for Pokémon battles with Large Language Models（ポケモンバトルのための人間と同等レベルのエージェント、PokéLLMon）」という論文の実装です。<div align="center">
  <img src="./resource/LLM_attrition_strategy.gif" alt="PokemonBattle">
</div>

ドキュメントは3日以内に完全に更新されます。
## 必要条件:

```sh
python >= 3.8
openai >= 1.7.2
```


## 設定
### ローカルのポケモンショーダウンサーバー（バトルエンジン）の設定
1. Node.js v10以上をインストールします。
2. ポケモンショーダウンのリポジトリをクローンしてセットアップします：

```sh
git clone https://github.com/smogon/pokemon-showdown.git
cd pokemon-showdown
npm install
cp config/config-example.js config/config.js
node pokemon-showdown start --no-security
ブラウザで "http://localhost:8000/" にアクセスします。
```


### OpenAI APIの設定

GPT-4 APIを [https://platform.openai.com/account/api-keys](https://platform.openai.com/account/api-keys)  から取得します。
### プレイヤーの設定

[https://play.pokemonshowdown.com/](https://play.pokemonshowdown.com/)  でアカウントに登録し、パスワードを取得します。

```sh
from poke_env import AccountConfiguration
# ローカルサーバーでは認証は不要です
my_account_config = AccountConfiguration("your_username", "your_password")
player = Player(account_configuration=my_account_config)

# 公式のショーダウンサーバーでは認証が必要です
from poke_env import AccountConfiguration, ShowdownServerConfiguration
my_account_config = AccountConfiguration("your_username", "your_password")
player = Player(account_configuration=my_account_config, server_configuration=ShowdownServerConfiguration)
```


## ポケモンバトルをしよう!!
### ローカルでヒューリスティックボットと対戦

```sh
python vs_bot.py # PokéLLMonのためにあなたのユーザー名とパスワードを入力します
```


### ローカルで人間のプレイヤーと対戦

まず、ローカルサーバー上で別のアカウントに手動でログインし、"[Gen 8] Random Battle"を選択します。

```sh
python vs_local_player.py # PokéLLMonのためにあなたのユーザー名とパスワードを入力します
```


### ポケモンショーダウンでランダープレイヤーと対戦

[https://play.pokemonshowdown.com/](https://play.pokemonshowdown.com/)  で開いてログインします。

```sh
python vs_ladder_player.py # ローカルサーバーを設定する必要はありません。PokéLLMonのためにあなたのユーザー名とパスワードを入力します。
```


## 謝辞

この環境は [Poke Env](https://github.com/hsahovic/poke-env)  に基づいて実装されています。
