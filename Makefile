up:
	docker compose up -d
build:
	docker compose build
build-no-cache:
	docker compose build --no-cache
down:
	docker compose down --remove-orphans
ps:
	docker compose ps
logs:
	docker compose logs
logs-watch:
	docker compose logs --follow
log-web:
	docker compose logs web
log-web-watch:
	docker compose logs --follow web
log-db:
	docker compose logs db
log-db-watch:
	docker compose logs --follow db
login-web:
	docker compose exec web bash
login-db:
	docker compose exec db bash

