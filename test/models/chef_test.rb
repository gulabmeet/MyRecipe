require "test_helper"

class ChefTest < ActiveSupport::TestCase
    
    def setup
    
    @chef = Chef.new(chefname: "Gulab", email: "gulab@gmail.com" )
    
    end

   

    test "name must be present" do
        
        @chef.chefname = " "
        assert_not @chef.valid?
    end
    
    test "name should not be too long" do
        
        @chef.chefname = "a" * 41
        assert_not @chef.valid?
    end
    
    test "name should not be too short" do
        
        @chef.chefname = "aaaa"
        assert_not @chef.valid?
    end
    
    test "email must be present" do
        
        @chef.email = " "
        assert_not @chef.valid?
    end
    
    test "email should be within bounds" do
        
        @chef.email = "a" * 101 + "example.com"
        assert_not @chef.valid?
    end
    
    test "email should be uique" do
        
        dup_chef = @chef.dup
        dup_chef.email = @chef.email.upcase
        @chef.save
        assert_not dup_chef.valid?
    end
    
    
end
