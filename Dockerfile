FROM ruby:3.1

RUN \
  gem install \
    awesome_print \
    pry-byebug

CMD pry -r 'awesome_print'
