# app/controllers/users_controller.rb
class UsersController < ApplicationController
  before_filter :require_no_user, :only => [:new, :create]
  before_filter :require_user, :only => [:show, :edit, :update]

  def new
    @user = User.new
  end

  # http://www.nathancolgate.com/post/184694426/adding-email-and-user-verification-to-authlogic
  def create
    #@user = User.new(params[:user])
    @user = User.new(params[:user])
    #if @user.save
    #  flash[:notice] = "Account registered!"
    #  redirect_back_or_default account_url
    #else
    #  render :action => :new
    #end
    if @user.save
      flash[:notice] = "Thanks for signing up, we've delivered an email to you with instructions on how to complete your registration!"
      @user.deliver_verification_instructions!
      redirect_to root_url
    else
      render :action => :new
    end
  end

  def show
    if not params[:id] #account mapping
      @user = @current_user
    else
      @user = User.find_by_login_username(params[:id])
    end
  end

  def edit
    @user = @current_user
  end

  def update
    @user = @current_user # makes our views "cleaner" and more consistent
    if @user.update_attributes(params[:user])
      flash[:notice] = "Account updated!"
      redirect_to account_url
    else
      render :action => :edit
    end
  end

  def toggle_favorite
    @user = User.find_by_login_username(params[:id])
    #if current_user.has_favorite?(@user)
    #had to implement the workaround below, the function above always returns false
    if current_user.favorite_users.find {|e| e.id == @user.id }
      current_user.has_no_favorite(@user)
      render :text => '(add friend)'
    else
      current_user.has_favorite(@user)
      render :text => '(remove friend)'
    end
  end
  
end
