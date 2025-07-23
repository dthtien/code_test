# Use official Ruby image as base
FROM ruby:3.3.4-alpine

WORKDIR /app

COPY Gemfile Gemfile.lock ./

# Install Ruby gems
RUN bundle install

COPY . .

RUN addgroup -g 1000 -S appgroup && \
    adduser -u 1000 -S appuser -G appgroup

# Change ownership of the app directory

USER appuser

CMD ["ruby", "bin/main.rb"]
