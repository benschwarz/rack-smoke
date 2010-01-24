# rack-smoke

Rack::Smoke allows you to expose Smoke sources and transcode them into JSON, XML or YAML.

## What are the benefits? 

* Pluggable caching, cache remote web services and rely on your own infrastructure
* Join Smoke sources together, reinterpret them, then offer them as a simple web service 

Rack::Smoke gives you a bunch of HTML screens (found at `/smoke`) that outline the Smoke sources that are found within your current environment.
![Rack::Smoke home screen](http://farm3.static.flickr.com/2627/3964835379_5d245a98e2.jpg)

From there, you'll be able to see the formats that you can get the stream in, or if they require any additional query strings.
![Twitter source details](http://farm3.static.flickr.com/2566/3964835179_f543c25681.jpg)


## Smoke? 

Smoke allows you to take single serve sources from around the web. Then it does a bunch of smart stuff like automagically transferring as gzip, request caching and understands the content that it gets back. YQL, Atom / RSS feeds, json and xml are all converted to ruby arrays.

Smoke-rack allows you to transcode that information and provide an API like layer of your own.

## How do I include it in my project? 

    # config.ru
    require 'rubygems'
    
    # Ensure your app has some Smoke sources
    require 'your-app'
    
    require 'smoke-rack'
    use Rack::Smoke
    
    run Sinatra::Application

Then navigate to localhost:PORT/smoke to get a list of available sources

## Installation

    gem install rack-smoke

## Note on Patches/Pull Requests
 
* Fork the project.
* Make your feature addition or bug fix.
* Add tests for it. This is important so I don't break it in a
  future version unintentionally.
* Commit, do not mess with rakefile, version, or history.
  (if you want to have your own version, that is fine but
   bump version in a commit by itself I can ignore when I pull)
* Send me a pull request. Bonus points for topic branches.

## Copyright

Copyright (c) 2010 Ben Schwarz. See LICENSE for details.
