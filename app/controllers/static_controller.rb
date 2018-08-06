class StaticController < ApplicationController
  def home
  end

  def club
    @users = User.all
  end

end
