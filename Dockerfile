FROM ruby:alpine

RUN apk add --update build-base postgresql-dev tzdata
RUN gem install rails -v '5.2.2'

WORKDIR /app
ADD Gemfile Gemfile.lock /app/

RUN gem install bundler:1.17.2
RUN bundle update --bundler 
RUN bundle install

ADD . .

RUN bundle install --binstubs

ENV RAILS_ENV production
ENV RAKES_ENV production

EXPOSE 4000

CMD puma -C config/puma.rb
#CMD ["puma"] 

