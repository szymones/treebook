require 'test_helper'

class CustomRoutesTest < ActionDispatch::IntegrationTest
  
  test "that /login route opens login page" do 
  	get  '/login'
  	assert_response :success
	end
  
  test "that /logout route works" do 
  	get  '/logout'
  	assert_response :redirect
  	assert_redirected_to '/'
  	end

  test "that /register route opens registration page" do 
  	get  '/register'
  	assert_response :success
	end

  test "that a profile page work" do 
    get '/janeczek'
    assert_response :success
  end
end
