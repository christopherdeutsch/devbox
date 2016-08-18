# devbox-cookbook

This cookbook is designed to set up a development workstation or virtual machine
in one step, using chef-zero. This isn't necessarily something you would use 
on a day-to-day basis (see: test kitchen, chef server, etc. etc.). 

It's also an exercise to get me back into chef after a long break. 
And do something weird :)

## Supported Platforms

* Debian 8.5

## Instructions

1. Download via `git clone https://github.com/christopherdeutsch/devbox.git`
2. Edit any defaults you like in `attributes/default.rb` (meh)
3. Run `rake bookstrap`

You can also run rake steps individually. See `rake -T` for a complete list.

* `rake chefdk` to install ChefDK
* `rake install` to run chef on the local host
* `rake packages` to install any packages needed for chefdk/chef

## Attributes

* `devbox.user` - username
* `devbox.packages.editor` - editor to install

## What's interesting here?

A lot of the examples out on the 'net for setting up a workstation
using chef are old, and rely on using `chef-solo` instead of `chef-zero`.
Some others are unnecessarily complex. Others require adding your workstation
as an actual chef node, which is kind of overkill for some situations.

I wanted to create something I could just check out from github and run 
with a single command. 

This isn't a common or even a recommended use case for chef.

Here's how it works:

1. Run `chef-client` with the `-z` flag so we use `chef-zero`. 
2. Instruct chef to use the file `zero.json` for attributes
3. Use `zero.rb` as the `knife.rb` configuration file

The `zero.rb` file doesn't look like a regular `knife.rb` file because
we're not running chef the way you normally would. Instead, it stubs
out just enough of a chef environment to let chef run. We rely on
Berkshelf to provide access to cookbooks.

## License and Authors

Author:: Christopher Deutsch (chef@ispeakdeutsch.com)
License:: BSD
