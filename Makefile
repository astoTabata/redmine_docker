build:
	# docker-compose build

up:
	docker-compose up -d

stop:
	docker-compose stop

down:
	docker-compose down

web:
	docker-compose exec web bash

db:
	docker-compose exec db bash

reload:
	docker-compose restart

init:
	docker-compose exec web bundle exec rake generate_secret_token
	docker-compose exec web bundle exec rake db:migrate RAILS_ENV=development
	docker-compose exec web bundle exec rake redmine:load_default_data RAILS_ENV=development
	docker-compose exec web mkdir -p files tmp tmp/pdf public/plugin_assets
	# docker-compose exec web sudo chown -R apache:apache files log tmp public/plugin_assets

destroy:
	docker-compose stop
	docker-compose rm -f

server:
	docker-compose exec web bundle exec rails s -p 3000 -b '0.0.0.0' -e development
