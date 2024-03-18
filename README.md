# Operation Generators Test Unit

Operation Generators Test Unit is a utility library designed to add the test file to the files required for new Business Logic actions with Dry Rb ecosystem.

This library doesn't make sense without [dry-operation_generators](https://github.com/joel/dry-operation_generators)

Generates the counterpart test files:

```shell
test/components/identity/operations/users/create/
├── acction_test.rb
├── contract_test.rb
├── operation_test.rb
├── register_test.rb
├── repository_test.rb
├── schema_test.rb
└── validation_test.rb
```

Please check out [operation_generators](https://github.com/joel/dry-operation_generators)

## Installation

Install the gem and add to the application's Gemfile by executing:

    $ bundle add operation_generators-test_unit

If Bundler is not being used to manage dependencies, install the gem by executing:

    $ gem install operation_generators-test_unit

NOTE: The gem needs to be required as `test_unit`

    $ gem "operation_generators-test_unit", require: "test_unit"

Otherwise, you can require "test_unit" on your code.

## Usage

Once installed, you can print out the Rails Generators Help:

```shell
rails generate --help
```

You should see

```shell
TestUnit:
  test_unit:channel
  test_unit:generator
  test_unit:install
  test_unit:mailbox
  test_unit:observer
  test_unit:operations:setup
  test_unit:plugin
```

You will need to run the Setup to make the generators available in the Host Application.

```shell
rails generate test_unit:operations:setup --force
# => initializer  operation_generators-test_unit.rb
```

Now the Generators should appear:

```shell
TestUnit:
  ...
  test_unit:operations:action
  test_unit:operations:contract
  test_unit:operations:operation
  test_unit:operations:register
  test_unit:operations:repository
  test_unit:operations:schema
  test_unit:operations:validation
  ...
```

They are automatically call when the generator it's call:

```shell
rails generate operations:contract user create firstname:string:optional --component identity/users --force
    invoke  test_unit
    create    test/components/identity/operations/users/create/contract_test.rb
    create  components/identity/operations/users/create/contract.rb
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

There is a generator of generators you can use to quickly add a new generator:

```shell
./bin/generator <generator name>
```

That provides the skeleton for the new generator. Note that the test suite should still run after the generated files.

Bug reports and pull requests are welcome on GitHub at https://github.com/orgs/joel/dry-operation_generators-test_unit. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/joel/dry-operation_generators-test_unit/blob/main/CODE_OF_CONDUCT.md).

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Isms project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/joel/dry-operation_generators-test_unit/blob/main/CODE_OF_CONDUCT.md).
