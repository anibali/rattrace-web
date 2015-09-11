## Generate Gemfile.lock

Whenever the dependencies in Gemfile change, a new Gemfile.lock file should be
created using the following command:

    $ docker run --rm -v "$PWD":/usr/src/app -w /usr/src/app ruby:2.2 \
      bundle install

## Building Docker image

    $ docker build -t rattrace-server .

## Running Docker container

    $ docker run --rm -it -p 8080:3000 \
      --name rattrace-server-inst rattrace-server
