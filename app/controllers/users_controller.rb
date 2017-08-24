class UsersController < ApplicationController
  before_action :is_authenticated?
  skip_before_action :is_authenticated?, only: [:new, :create]


def index
  @users = User.all
end

def show
  @user = User.find(params[:id])
end

def new
  @user = User.new
end

def create
  @user = User.new(user_params)
  @user.in_app_account = InAppAccount.new(user_id: params[:id], amount: 0)
  if @user.valid?
    @user.save
    session[:user_id] = @user.id
    redirect_to user_path(@user)
  else render 'new'
  end
end

def investment
  @user = User.find(params[:id])
end

def bankaccount
  @user = User.find(params[:id])
end


def edit
  @user = User.find(params[:id])
end

def update
  @user = User.find(params[:id])
  @user.update(user_params)
  if @user.valid?
    @user.save
    redirect_to user_path(@user)
  else render 'edit'
  end
end

def destroy
  User.find(params[:id]).delete
  redirect_to users_path
end

private


def user_params
  params.require(:user).permit(:name, :username, :password, :dob)
end

end
