#!/bin/bash

docker-compose run --rm test rake db:create
docker-compose run --rm test rake db:migrate
docker-compose run --rm test rake db:seed
docker-compose run --rm test rake db:test:prepare
