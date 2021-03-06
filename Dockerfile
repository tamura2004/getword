FROM ruby

RUN apt-get update && \
	apt-get install -y \
		nodejs \
		sqlite3 \
		libsqlite3-dev && \
	rm -rf /var/lib/apt/lists/*

RUN mkdir /project

WORKDIR /project

ADD Gemfile /project/Gemfile
ADD Gemfile.lock /project/Gemfile.lock

ENV NOKOGIRI_USE_SYSTEM_LIBRARIES YES

RUN gem install bundler
RUN bundle install
