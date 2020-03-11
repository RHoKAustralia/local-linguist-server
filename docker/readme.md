# Running in docker

First, run `./init_db.sh`. This will take a long time on the first run,
and will be faster on subsequent runs, but you shouldn't need to run it often.

The other scripts in here should be self explanatory.

You probably need to run `./build.sh` after any code changes you make. I don't
know if there's a way to get docker to notice any code changes and rebuild.
