# Running in docker

### Initial setup.

You need to run `./build.sh` to setup the initial docker environment, and after any code changes you make.

Then run `./init_db.sh` to setup the database. This will take a long time on the first run,
and will be faster on subsequent runs, but you shouldn't need to run it often.

The other scripts in here should be self explanatory.
