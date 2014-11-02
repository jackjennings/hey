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

There are two ways of setting you API token, depending on your requirements. If your program is only working with a single API token, you can set it in an initializer or at the start of your script.

```ruby
Hey.api_token = "3858f62230ac3c915f300c664312c63f"
```

If you need to use multiple API tokens, any `hey` class will accept an `api_token` on initialization.

```ruby
Hey::Yo.new api_token: "3858f62230ac3c915f300c664312c63f" 
```

An API token set when initializing an object takes precidence over the API token set on the `Hey` module.

## Yo All

Sends a yo to all of the account's subscribers.

```ruby
Hey::Yo.all
# or
yo = Hey::Yo.new api_token: "..."
yo.all
```

Accepts either `link` or `location` in a hash of parameters (optional).

```ruby
Hey::Yo.all link: "https://github.com/jackjennings/hey"
```

## Yo User

Sends a yo to a specific user.

```ruby
Hey::Yo.user "WORLDCUP"
# or
yo = Hey::Yo.new api_token: "..."
yo.user "WORLDCUP"
```

Accepts either `link` or `location` in a hash of parameters (optional).

```ruby
Hey::Yo.user "WORLDCUP" link: "https://github.com/jackjennings/hey"
```

## Subscriber Count

Returns the number of subscribers.

```ruby
Hey::Subscriber.count
# or
yo = Hey::Yo.new api_token: "3858f62230ac3c915f300c664312c63f"
yo.subscribers.count
```

That's it!
