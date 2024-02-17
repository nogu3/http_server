# http_server
## request
```

-v = 詳細なログ出力
-s = コンテンツ取得時の進捗状況を非表示にする
-S = -sと一緒に使い、エラーのときにエラーメッセージを表示する

curl -v -s -S \
  -H "Accept: application/json" \
  -H "Content-Type: application/json" \
  -d  '{"jsonrpc": "2.0", "method": "sum", "params": [10, 20], "id": 1}' \
   http://localhost:8080
```