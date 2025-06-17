FROM ruby:3.2.8
RUN apt-get update -qq && apt-get install -y nodejs postgresql-client
WORKDIR /app
RUN gem install bundler
COPY Gemfile Gemfile.lock ./
RUN bundle install
COPY . .
RUN bundle exec rake assets:precompile
EXPOSE 3000
CMD ["rails", "server", "-b", "0.0.0.0"]
