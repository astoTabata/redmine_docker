FROM ruby
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs
ENV RAILS_ROOT /var/www/rails_root
RUN mkdir -p $RAILS_ROOT
WORKDIR $RAILS_ROOT
COPY ./redmine/ .
COPY ./redmine/Gemfile /var/www/rails_root/Gemfile
COPY ./redmine/Gemfile.lock /var/www/rails_root/Gemfile.lock
EXPOSE 3000
EXPOSE 1234
RUN bundle install
