class API::V1::UsersController < ApplicationController
#   http://api.rubyonrails.org/classes/ActionController/HttpAuthentication/Basic.html
  #http_basic_authenticate_with name: "user", password: "password"
  skip_before_action :verify_authenticity_token
  respond_to :html, :json

  def index
    @users = User.all
    respond_to do |format|
      format.json { render :json => @users }
    end
  end

  def show
    respond_to do |format|
      format.json { render :json => @user }
    end
  end

  def create
    @user = User.new(user_params)
    respond_to do |format|
      if @user.save
        format.json { render json: @user, status: :created, location: @user }
      else
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @user.update_attributes(params[:user])
        format.json { head :no_content, status: :ok }
      else
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    respond_to do |format|
      if @user.destroy
        format.json { head :no_content, status: :ok }
      else
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :password, :email, :name)
  end
end
