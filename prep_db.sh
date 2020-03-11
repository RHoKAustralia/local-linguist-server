#!/bin/bash

set -e

rake db:create
rake db:migrate
rake db:seed
rake db:test:prepare
