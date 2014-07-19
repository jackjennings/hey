# Hey

A Ruby library for sending yo's from [Yo](http://justyo.co).

[github.com/jackjennings/hey](http://github.com/jackjennings/hey)

[![Gem Version](https://badge.fury.io/rb/hey.svg)](http://badge.fury.io/rb/hey) [![Code Climate](https://codeclimate.com/github/jackjennings/hey.png)](https://codeclimate.com/github/jackjennings/hey) [![Build Status](https://travis-ci.org/jackjennings/hey.svg)](https://travis-ci.org/jackjennings/hey)

# Installation

```
gem install hey
```

# Usage

First [get an API token](http://yoapi.justyo.co).

Then:

```ruby
Hey.api_token = '3858f62230ac3c915f300c664312c63f'
Hey::Yo.all # or yo a specific user...
Hey::Yo.user "WORLDCUP"
Hey::Subscriber.count

# or set api_token on a Yo instance:

yo = Hey::Yo.new(api_token: '3858f62230ac3c915f300c664312c63f')
yo.all
yo.user "WORLDCUP"
yo.subscribers.count
```

That's it!
