require 'spec_helper'

describe API::V1::UsersController do

  before do
    User.destroy_all
  end

  describe "index" do

    before do
      (1..3).each{ |n| User.create( id: n, username: "name#{n}", password: "pass#{n}" ) }
    end

    it "lists all usernames and ids" do
      get :index, format: :json

      JSON.parse(response.body).should ==
        { 'users' =>
          [
            { 'id' => 1, 'username' => 'name1' },
            { 'id' => 2, 'username' => 'name2' },
            { 'id' => 3, 'username' => 'name3' }
          ]
        }
    end
  end
end
