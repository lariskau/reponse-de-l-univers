class UsersController < ApplicationController
  attr_accessor :remember_token

  def index
    @posts = Post.all
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Bienvenue sur le secret !"
      redirect_to "/secret"
    else
      render 'new'
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to users_path
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    flash[:success] = "Ton compte a été supprimé"
    redirect_to root_path
  end

  private

    def user_params
      params.require(:user).permit(:name, :email, :password,
                                   :password_confirmation)
    end




  end
