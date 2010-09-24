require 'user'
require 'my_rspec_custom_matcher'

Spec::Runner.configure do |config|
  config.include(MyRspecCustomMatcher)
end

describe User do
  before do
    u = User.create(:login => @login, :full_name => "Isaac Newton", :date_of_birth => "1643-01-04")
  end
  
  it "should be useful as a test of spec custom matchers" do
    user = User.find_by_full_name("Isaac Newton")

    user.login.should == "isaac_newton"
    user.age.should == 367
  end

  it "should be cleaner this way" do
    user = User.find_by_full_name("Isaac Newton")

    user.should have_these_attributes ({
        :login => "isaac_newton",
        :age => 367 })
  end

  it "example as a failing spec" do
    user = User.find_by_full_name("Isaac Newton")

    user.should have_these_attributes({
        :login => "isaac_newton",
        :age => 363 })
  end
  
end
