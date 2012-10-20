# coding: utf-8
class SessionsController < ApplicationController
  skip_before_filter :authorize

  def new
  end

  def create
  	user = User.find_by_name(params[:name])
  	if user and user.authenticate(params[:password])
  		session[:user_id] = user.id
  		redirect_to admin_url
  	else
  		redirect_to login_url, alert: "Имя или пароль не совпадают"
  	end
  end

  def destroy
  	session[:user_id] = nil
  	redirect_to store_url, notice: "Вы покинули административный режим"
  end
end
