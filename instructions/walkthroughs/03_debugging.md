This challenge is somewhat unusual: it's the only challenge on the project that won't require you writing code. However, it will require you to demonstrate that you have basic debugging skills that you will absolutely need going forward. Any developer, no matter how experienced, will encounter many error messages every single working day.

Error messages are not simply indications of things going wrong, they are meant to help you to understand what the computer is actually doing and how that's different from what you want it to do. Therefore it's essential to understand the error and choose what to do next based on the information given in the error.

A common mistake inexperienced developers make is glancing over the error, not really reading and understanding it, and then just trying random code fixes to see if the error goes away. This is a waste of time. If you see an error, you should always start by understanding what it means and why it happened before attempting to update the code. This small difference in approach is one of the things that separates professional developers and amateurs.

When you try to run RSpec without having the class, you should get this error:

```
 /Users/shadchnev/dev/oystercard/spec/oystercard_spec.rb:1:in `<top (required)>': uninitialized constant Oystercard (NameError)
  from /Users/shadchnev/.rvm/gems/ruby-2.2.2/gems/rspec-core-3.3.2/lib/rspec/core/configuration.rb:1327:in `load'
  from /Users/shadchnev/.rvm/gems/ruby-2.2.2/gems/rspec-core-3.3.2/lib/rspec/core/configuration.rb:1327:in `block in load_spec_files'
  from /Users/shadchnev/.rvm/gems/ruby-2.2.2/gems/rspec-core-3.3.2/lib/rspec/core/configuration.rb:1325:in `each'
  from /Users/shadchnev/.rvm/gems/ruby-2.2.2/gems/rspec-core-3.3.2/lib/rspec/core/configuration.rb:1325:in `load_spec_files'
  from /Users/shadchnev/.rvm/gems/ruby-2.2.2/gems/rspec-core-3.3.2/lib/rspec/core/runner.rb:102:in `setup'
  from /Users/shadchnev/.rvm/gems/ruby-2.2.2/gems/rspec-core-3.3.2/lib/rspec/core/runner.rb:88:in `run'
  from /Users/shadchnev/.rvm/gems/ruby-2.2.2/gems/rspec-core-3.3.2/lib/rspec/core/runner.rb:73:in `run'
  from /Users/shadchnev/.rvm/gems/ruby-2.2.2/gems/rspec-core-3.3.2/lib/rspec/core/runner.rb:41:in `invoke'
  from /Users/shadchnev/.rvm/gems/ruby-2.2.2/gems/rspec-core-3.3.2/exe/rspec:4:in `<top (required)>'
  from /Users/shadchnev/.rvm/gems/ruby-2.2.2/bin/rspec:23:in `load'
  from /Users/shadchnev/.rvm/gems/ruby-2.2.2/bin/rspec:23:in `<main>'
  from /Users/shadchnev/.rvm/gems/ruby-2.2.2/bin/ruby_executable_hooks:15:in `eval'
  from /Users/shadchnev/.rvm/gems/ruby-2.2.2/bin/ruby_executable_hooks:15:in `<main>'
```

This is called a `stack trace`. It may look intimidating but actually it's very helpful. It shows all the files Ruby was running before it encountered an error. This usually helps you to understand what was happenening before the error occurred.

Read it from top to the bottom. The first line

```
/Users/shadchnev/dev/oystercard/spec/oystercard_spec.rb:1:in `<top (required)>': uninitialized constant Oystercard (NameError)
```

tells us the name of the file including the path (/Users/shadchnev/dev/oystercard/spec/oystercard_spec.rb), the line number (1), the type of the error (NameError) and a more specific message (uninitialized constant Oystercard). Ignore the `<top (required)>` bit for a moment.

NameError basically means that Ruby encountered a name of something it doesn't recognise. The specific message tells us that the problem is that the constant `Oystercard` is not initialized. Although Ruby refers to it as a constant, you know that Oystercard should be a class (there's a longer story here but let's keep it simple for now). So, by now you know that the code on the first line of `oystercard_spec.rb` referenced the Oystercard class but Ruby has no idea where to find it.

The other lines in the stack trace show how Ruby got to the `oystercard_spec.rb`. You can tell from the paths (`/Users/shadchnev/.rvm/gems/ruby-2.2.2/gems/rspec-core-3.3.2`) that Ruby was in files outside your project, specifically inside RSpec files themselves. In case of really tricky errors this may be useful – you have the option of going inside RSpec (and other gems) to see what's going on under the hood but don't do it just yet. For now, just ignore all files that don't belong to your project.

One way of solving this error would be to define this class and link it to this file, so that Ruby can find it.

[Next challenge](../04_adding_balance.md)
