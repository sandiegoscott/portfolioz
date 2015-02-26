RSpec.configure do |config|
  # If you do not include FactoryGirl::Syntax::Methods in your test suite, 
  # then all factory_girl methods will need to be prefaced with FactoryGirl
  config.include FactoryGirl::Syntax::Methods

  config.before(:suite) do
    FactoryGirl.lint
    DatabaseCleaner.strategy = :transaction
    DatabaseCleaner.clean_with(:truncation)
  end

  config.around(:each) do |example|
    puts ">>>>> DatabaseCleaner.cleaning..."
    DatabaseCleaner.cleaning do
      example.run
    end
  end

end
