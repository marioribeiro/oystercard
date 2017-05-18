This walkthrough assumes that you have `git` installed on your machine. If not, you'll need to install it following [these instructions](https://git-scm.com/book/en/v2/Getting-Started-Installing-Git).

- Clone your `oystercard` repository to your local machine. There are detailed instructions in the [Github help system](https://help.github.com/articles/cloning-a-repository/)

- Run `gem list` to see the list of gems installed on your machine. You should see `bundler` in the list of installed gems.

- Now that you know that bundler is installed, use bundler to create a Gemfile (with a capital G, it's important) for you by running `bundle init`. This will generate a Gemfile like this:

```ruby
# A sample Gemfile
source "https://rubygems.org"

# gem "rails"
```

- Remove both comments and add this code after the `source` line:
```ruby
group :development, :test do
  gem "rspec"
end
```
You can read about the format of the Gemfile in this [brilliant tutorial](http://tosbourn.com/what-is-the-gemfile/).

- Now let's check the version of Ruby we have installed. You can find out the latest stable Ruby version on [its website](https://www.ruby-lang.org/en/downloads/). As of today, it's 2.2.3. Assuming you have RVM installed (if not, follow the instructions from the [RVM website](https://rvm.io/rvm/install)), run `rvm list` to see what Ruby version you have on your machine. The output will look similar to this:

```
rvm rubies

   ruby-1.9.3-p448 [ x86_64 ]
   ruby-2.0.0-p247 [ x86_64 ]
 * ruby-2.1.0 [ x86_64 ]
=> ruby-2.2.3 [ x86_64 ]

# => - current
# =* - current && default
#  * - default
```

If you can't see the latest Ruby version there, you'll need to install it using `rvm install 2.2.3`. Once done, verify it's successfully installed by running `ruby -v` – you will see the Ruby version.

- Now let's update our Gemfile with the latest Ruby version. This is important because there are slight differences between different version, so your code can produce different results under different Ruby versions. Therefore, all developers working on the project as well as the servers running your code should be using the same version – the one specified in the Gemfile.

Add this line to Gemfile after `source`: `ruby '2.2.3'`

- Now your Gemfile looks like this:

```
source "https://rubygems.org"

ruby '2.2.3'

group :development, :test do
  gem "rspec"
end
```

The very last step of the process is to run `bundle`. This will invoke bundler, the dependency manager, that will look into `Gemfile`, see if any of the gems need to be installed (they may already be installed), install them and save the information about the gems, their versions and dependencies into an automatically generated `Gemfile.lock`.

- Now commit these files and push it to Github.

```
git add Gemfile
git add Gemfile.lock
git commit -m 'Closing #1: added a Gemfile'
git push origin master
```

What you've just done was to add the files individually (first Gemfile, then Gemfile.lock). There's a git command to add all files in the current directory that will save you typing individual filenames but we advise you to add the files individually while you're still learning how to use git to make sure that you're adding exactly what you want and not something else.

[Next challenge](../02_initialize_rspec.md)
