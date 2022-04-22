# Tc::Generator

Terms and conditions generator gem.

The T&C generator is a software which given:

    i). A template
    ii). A dataset

transforms the template into a Document expanding the
template tags into their representation using the dataset.

## Installation

Install the gem and add to the application's Gemfile by executing:

    $ bundle add tc-generator

If bundler is not being used to manage dependencies, install the gem by executing:

    $ gem install tc-generator

## Usage

To generate a terms and conditions document we first initialize the template and the dataset. Lastly we call
the generator to output the document on the target path.

### Initialisation of template and dataset

Initialize the generator;

```ruby
Tc::Generator.configure do |configuration|
  configuration.target_folder_path     =  'path/to/target/folder'
  configuration.target_filename        =  'filename'
  configuration.dataset_path           =  'path/to/json/dataset'
  configuration.template_path          =  'path/to/erb/template'
  configuration.section_join_character = ';'
end
```

### Run the generator

```ruby
Tc::Generator::Run.call
```

After doing the steps above. One should have a document generated on the target path.

Check the `examples` folder readme to see the steps for this in action.

### Dataset format

The gem expects dataset in a json file in this format below;

```json
{
  "clauses": [
    { "id": 1, "text": "The quick brown fox" },
    { "id": 2, "text": "jumps over the lazy dog" },
    { "id": 3, "text": "And dies" },
    { "id": 4, "text": "The white horse is white" }
  ],
  "sections":
  [
    { "id": 1, "clauses_ids": [1, 2] }
  ]
}
```

### Template 

The gem expects template in a plain file in this format below;

```txt
A T&C Document
This document is made of plaintext.
Is made of [CLAUSE-3].
Is made of [CLAUSE-4].
Is made of [SECTION-1].
Your legals.
```

## Development & Testing

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Common issues

If `bin/setup` or `bundle install` fails to work because of the machine you are running it on try these below.

For your platform do;

```sh
bundle lock --add-platform [PLATFORM]
```

Then run `bundle install`.

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/Sylvance/tc-generator.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
