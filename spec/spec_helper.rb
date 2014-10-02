# coding: utf-8
require 'rspec'

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
