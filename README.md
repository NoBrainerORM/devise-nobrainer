NoBrainer Devise Adapter
========================

nobrainer-devise is an adapter to make
[Devise](https://github.com/plataformatec/devise/) work nicely with
[NoBrainer](http://nobrainer.io).

Installation
------------

Include in your Gemfile:

```ruby
gem 'nobrainer-devise'
```

Use devise as usual.

If devise does not work, make sure that your `config/initializers/devise.rb` file
contains `require 'devise/orm/nobrainer'`.

License
-------

MIT license.
