# Docker Ruby Dev

A Docker image with basic tools (eg. pry) installed for quick one-off containers.

## Usage

I normally source a shell function that creates a container with relevant files/directories mounted:

```sh
#
# Volume mounts in order:
#
# local folder into working directory
# pry config
# pry history
# bash history
# RubyGems credentials
# SSH credentials (git push)
# git configuration (sign commits)
# Gemfury and Heroku credentials
#
function docker-ruby() {
  mkdir -p $HOME/tmp
  touch $HOME/tmp/pry_history
  touch $HOME/tmp/bash_history

  docker run \
    -it \
    --rm \
    -w /usr/src/app \
    -v $PWD:/usr/src/app \
    -v $HOME/.pryrc:/root/.pryrc \
    -v $HOME/tmp/pry_history:/root/.pry_history \
    -v $HOME/tmp/bash_history:/root/.bash_history \
    -v $HOME/.gem:/root/.gem \
    -v $HOME/.ssh:/root/.ssh \
    -v $HOME/.gitconfig:/root/.gitconfig \
    -v $HOME/.netrc:/root/.netrc \
    johnallen3d/ruby-dev:latest "${@}"
}
```

Having this function sourced:

```sh
# drop into a Pry REPL with history and sourced configuration
> docker-ruby

# start a bash session with history
> docker-ruby bash
```
