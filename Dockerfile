FROM ruby:rc

RUN \
  gem install \
    awesome_print \
    pry-byebug

CMD pry -r 'awesome_print'
