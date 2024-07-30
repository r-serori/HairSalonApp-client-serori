# ベースイメージの指定 (フロントエンド用)
FROM node:21.5.0-alpine 

# フロントエンドアプリケーション用の作業ディレクトリを作成
WORKDIR /app

# フロントエンドの依存関係をインストール
COPY package*.json ./
RUN npm install

# フロントエンドのコードをコピーしてビルド
COPY . ./
RUN npm run build

# Next.js の開発サーバーを起動するコマンド
CMD ["npm", "run", "start"]

# コンテナがリッスンするポートを指定
EXPOSE 3000
