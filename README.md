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
yo = Hey::Yo.new
yo.all

# or set api_token on the Yo instance

yo = Hey::Yo.new('3858f62230ac3c915f300c664312c63f')
yo.all
```

That's it!