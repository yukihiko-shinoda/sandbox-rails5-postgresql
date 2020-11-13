FROM ruby
RUN apt-get update -qq && apt-get install -y nodejs
RUN mkdir /workspace
WORKDIR /workspace
COPY Gemfile /workspace/Gemfile
COPY Gemfile.lock /workspace/Gemfile.lock
RUN bundle install
COPY . /workspace

# Add a script to be executed every time the container starts.
COPY entrypoint.sh /usr/bin/entrypoint
RUN chmod +x /usr/bin/entrypoint
ENTRYPOINT ["entrypoint"]

# Start the main process.
CMD ["rails", "server", "-b", "0.0.0.0"]
