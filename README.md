# Dockerでrails + potgreSQLの環境作って立ち上げるまでの手順
1. compose.yamlまで[参考ページ](https://zenn.dev/hs7/articles/2cc4d67650ba69)と一緒
2. docker-compose run web rails new . --force --database=postgresql
3. docker compose build --no-cache
4. docker-compose.ymlで指定したdbのユーザー名とパスワードを config/database.ymlに指定
```diff
default: &default
 adapter: postgresql
 encoding: unicode
 host: db
+  username: <%= ENV["POSTGRES_USER"] %>
+  password: <%= ENV["POSTGRES_PASSWORD"] %>
...
production:
 <<: *default
database: myapp_production
-  username: myapp
-  password: <%= ENV["MYAPP_DATABASE_PASSWORD"] %>
```
5. crendentials.yml.encに下記を追加
```diff
+ production:
+  secret_key_base: 任意の長い文字列
```
6. compose.yamlに
```diff
    environment:
      POSTGRES_USER: postgres
      POSTGRES_PASSWORD: password
+     SECRET_KEY_BASE: 上記で設定した文字列を追加
```
*あんまりよろしくない設定なのでenv参照にするとかが良いかもね
7. docker compose up -d