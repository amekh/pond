# coding: utf-8
require 'rspec'
require 'coveralls'

Coveralls.wear!

Dir["./support/**/*.rb"].each do |f|
  require f
end

RSpec.configure do |config|
  config.expect_with :rspec do |expectations|
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  # FactoryGirlを有効化
  config.before(:all) do
    FactoryGirl.reload
  end

end

def describe_internally(*args, &block)
  example = describe(*args, &block)
  cls = args[0]
  if cls.is_a? Class
    saved_private_instance_methods = cls.private_instance_methods
    example.before do
      cls.class_eval { public *saved_private_instance_methods }
    end
    example.after do
      cls.class_eval { private *saved_private_instance_methods }
    end
  end
end
