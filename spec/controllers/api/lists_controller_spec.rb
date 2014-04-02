require 'spec_helper'

describe API::V1::ListsController do

  before do
    List.destroy_all
  end

  describe "index" do

    before do
      (1..3).each{ |n| List.create( id: n, title: "list#{n}" ) }
    end

    it "lists all lists and ids" do
      get :index, format: :json

      JSON.parse(response.body).should ==
        { 'lists' =>
          [
            { 'id' => 1, 'title' => 'list1' },
            { 'id' => 2, 'title' => 'list2' },
            { 'id' => 3, 'title' => 'list3' }
          ]
        }
    end
  end
end
