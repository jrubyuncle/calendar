class SessionsController < ApplicationController
  def new
    @login_form = Forms::Login.new
  end

  def create
    @login_form = Forms::Login.new(email: params[:forms_login][:email], password: params[:forms_login][:password])
    if @login_form.valid?
      session[:user_id] = @login_form.user.id
      redirect_to root_path
    else
      render 'new'
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end
end
