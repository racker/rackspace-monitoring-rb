= Rackspace Cloud Monitoring Ruby Bindings

This project contains the Ruby bindings for the Rackspace Cloud Monitoring product.  It is based off the most awesome Fog cloud services library here - https://github.com/fog/fog.  This library is used heavily in the https://github.com/racker/cookbook-cloudmonitoring chef cookbook.

== Contributing
 
* Check out the latest master to make sure the feature hasn't been implemented or the bug hasn't been fixed yet.
* Check out the issue tracker to make sure someone already hasn't requested it and/or contributed it.
* Fork the project.
* Start a feature/bugfix branch.
* Commit and push until you are happy with your contribution.
* Make sure to add tests for it. This is important so I don't break it in a future version unintentionally.
* Please try not to mess with the Rakefile, version, or history. If you want to have your own version, or is otherwise necessary, that is fine, but please isolate to its own commit so I can cherry-pick around it.

== Publish a New Version

* Run tests `rake test`
* Bump version `rake version:bump:{major,minor,patch}`
* Push GEM `gem push ./pkg/gem-foo.gem`

== Copyright

Copyright (c) 2012 Rackspace Hosting Inc See LICENSE.txt for further details.
