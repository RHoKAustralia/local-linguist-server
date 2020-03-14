#!/bin/bash

docker-compose run --rm local-linguist-test rake db:create
docker-compose run --rm local-linguist-test rake db:migrate
docker-compose run --rm local-linguist-test rake db:seed
docker-compose run --rm local-linguist-test rake db:test:prepare
