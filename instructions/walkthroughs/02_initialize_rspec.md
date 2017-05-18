So, the main goal of this issue is to generate RSpec conventional (default) files and create an empty test suite for the Oystercard class.

Google 'generate rspec conventional files' to find out that there is a [command line option `--init`](https://relishapp.com/rspec/rspec-core/docs/command-line/init-option) that will do it for you. Running it in your project directory will create a `spec/` folder with `spec_helper.rb` inside it, and a `.rspec` file in your project directory. Use RSpec documentation to find out what both these files are. Take a look at their contents. It's ok if not everything in `spec_helper.rb` is clear just yet – you'll understand it later.

Now you need to create an empty test suite for the Oystercard class. Google 'ruby class name convention' to find out that if the class name is Oystercard, the file name should be `oystercard.rb` (all lowercase). In the same fashion, use Google to find out that if you're testing Oystercard class, your tests should go into `spec/oystercard_spec.rb`. Create this file using `touch` command:

```
touch spec/oystercard_spec.rb
```

Now, the issue asks you to create a `describe` block inside the test. Google 'spec describe' to find a link to [RSpec's basic structure](https://www.relishapp.com/rspec/rspec-core/docs/example-groups/basic-structure-describe-it). Consult other sources apart from RSpec documentation as well, for example [Treehouse](http://blog.teamtreehouse.com/an-introduction-to-rspec). Finally, add this into `spec/oystercard_spec.rb` using SublimeText or another programming editor (Atom, Vim, etc):

```ruby
describe Oystercard do
end
```

Now all the files you created need to be added to a staging area (place were the files stay before they are committed) of git:

```
git add spec
git add .rspec
```

The first command will add the folder and everything in it. Now, do `git status` to make sure that the list of files in the staging area is correct (there's nothing else), and there's nothing outside the staging area. If you're happy with what `git status` tells you, commit the files and push them:

```
git commit -m 'complete challenge #02: add rspec conventional files'
git push origin master
```

The `git push` command will sync the changed you made locally (that you staged and committed) to your Github account (where you cloned this repo from). Now go to your Github repo and check that the commit you made is there. Verify that the three files in the commit are the ones you added in the command line.

[Next challenge](../03_debugging.md)
