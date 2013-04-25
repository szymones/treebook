require 'test_helper'

class UserTest < ActiveSupport::TestCase
  
  test "user should enter first name" do
  user = User.new
  assert !user.save
  assert !user.errors[:first_name].empty?	

  end

  test "user should enter last name" do
  user = User.new
  assert !user.save
  assert !user.errors[:last_name].empty?	

  end
  
  test "user should enter profile name" do
  user = User.new
  assert !user.save
  assert !user.errors[:profile_name].empty?	

  end

  test " user should have unique profile name" do
	user = User.new
	user.profile_name = users(:janek).profile_name
	assert !user.save
	assert !user.errors[:profile_name].empty?
  end

  test " prfile name should be provided without spaces" do 
    user = User.new
    user.profile_name = "My profile with spaces"

    assert !user.save
    assert !user.errors[:profile_name].empty?
  	assert !user.errors[:profile_name].include?("Nie moze byc ze spacjami")
  end

  test " a user should be able to register with corrct profile name" do
    user = User.new(first_name: "Bartek", last_name:'Pawlik',email:"bp@test.pl")
    user.password = user.password_confirmation = "asdfasdf"

    user.profile_name = "koko1"
    assert user.valid?
  end

end
