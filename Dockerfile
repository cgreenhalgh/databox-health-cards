FROM ruby:2.5-stretch

MAINTAINER chris.greenhalgh@nottingham.ac.uk

WORKDIR /root
RUN apt update
RUN gem install squib

#COPY . /root/work/
VOLUME /root/work
WORKDIR /root/work

CMD ["ruby", "deck.rb"]
