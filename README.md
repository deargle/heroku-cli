Heroku CLI
----------------

This Alpine-based heroku cli docker container also installs `git` and `docker-cli`, so that `heroku git` and `heroku container` commands work.

Use the container as follows:

```
docker run --rm \
    -e HEROKU_API_KEY=$HEROKU_API_KEY \
    -e HOME="$PWD" \
    -v /var/run/docker.sock:/var/run/docker.sock \
    -v "$PWD:$PWD" \
    -w="$PWD" \
    deargle/heroku-cli:latest
```

* `docker.sock` is mounted so that `docker-cli` can work
* `HOME` is set to `PWD` so that `heroku container:login` will save the credentials to a find-able place
* you should set `HEROKU_API_KEY` to your heroku api key.

Make a handy-dandy alias:

```
echo alias heroku="'"'docker run --rm \
    -e HEROKU_API_KEY=$HEROKU_API_KEY \
    -e HOME="$PWD" \
    -v /var/run/docker.sock:/var/run/docker.sock \
    -v "$PWD:$PWD" \
    -w="$PWD" \
    deargle/heroku-cli:latest'"'" >> ~/.bashrc

. ~/.bashrc
```
