group :development, :test do
    gem 'rspec-rails', '~> 6.0.0'
    gem "faker"
    gem "factory_bot"
end

  bundle install
  rails generate rspec:install
#   create  .rspec
#   create  spec
#   create  spec/spec_helper.rb
#   create  spec/rails_helper.rb

# file 'app/components/foo.rb', <<-CODE
#   class Foo
#   end
# CODE