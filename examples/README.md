# Instructions

Run `bin/console`

Configure the gem this way;

```ruby
Tc::Generator.configure do |configuration|
  configuration.target_folder_path     =  'examples/'
  configuration.target_filename        =  'result.txt'
  configuration.dataset_path           =  'examples/dataset.json'
  configuration.template_path          =  'examples/template.txt'
  configuration.section_join_character = ';'
end
```

Then run the generator this way

```ruby
Tc::Generator::Run.call
```

This will generate a `result.txt` in the examples folder that looks like this below;

```txt
A T&C Document
This document is made of plaintext.
Is made of And dies.
Is made of The white horse is white.
Is made of The quick brown fox;jumps over the lazy dog.
Your legals.
```
