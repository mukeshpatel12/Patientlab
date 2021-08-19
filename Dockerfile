FROM ruby:2.6.6-alpine

RUN apk update && apk add bash build-base nodejs postgresql-dev tzdata

RUN apk add --update --virtual runtime-deps postgresql-client nodejs libffi-dev readline sqlite

# Install Yarn
ENV PATH=/root/.yarn/bin:$PATH
RUN apk add --virtual build-yarn curl && \
    touch ~/.bashrc && \
    curl -o- -L https://yarnpkg.com/install.sh | sh && \
    apk del build-yarn


RUN mkdir /project
WORKDIR /project

RUN yarn install --check-files

COPY Gemfile Gemfile.lock ./
RUN gem install bundler --no-document
RUN bundle install --no-binstubs --jobs $(nproc) --retry 3

COPY . .

CMD ["bundle", "exec", "rails", "server", "-b", "0.0.0.0"]