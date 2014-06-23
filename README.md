# Hey

A Ruby library for sending yo's from [Yo](http://justyo.co).

github.com/jackjennings/hey

# Installation

```
gem install hey
```

# Usage

```ruby
Hey.api_token = '3858f62230ac3c915f300c664312c63f'
Hey::Yo.all

# or set api_token on a Yo instance

Hey::Yo.new(api_token: '3858f62230ac3c915f300c664312c63f').all
```

That's it!