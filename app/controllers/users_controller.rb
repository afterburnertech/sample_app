class UsersController < ApplicationController
  before_filter :signed_in_user,  only: [:index, :edit, :update, :destroy] 
  before_filter :correct_user,    only: [:edit, :update]
  before_filter :admin_user,      only: [:destroy]
  #users cannot edit or update w/o being signed in or the correct user.
  #before_filter allows us to make sure
  #filters act on only: [:index, :edit, :update] actions in the case of :signed_in_user
  
  def index
    #params[:page] is automagically generated by will_paginate 
    @users = User.paginate(page: params[:page])
  end

  def show
  	@user = User.find(params[:id])
  end

  def new
  	@user = User.new
  end

  def create
  	@user = User.new(params[:user])
  	if @user.save
      sign_in @user
  		flash[:success] = "Welcome to the Sample App!"
  		redirect_to @user
  	else
  		render 'new'
  	end
  end

  def edit
  end

  def update
    if @user.update_attributes(params[:user])
      flash[:success] = "Profile updated"
      sign_in @user
      redirect_to @user
    else
      render 'edit'
    end
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User destroyed."
    redirect_to users_url
  end

  private

    def signed_in_user
      unless signed_in?
        #if a valid user tries to access a page, but hasn't signed in yet, 
        #store the page and ask them to sign in
        store_location
        #otherwise redirect to the sign in page
        redirect_to signin_url, notice: "Please sign in."
      end
    end

    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_path) unless current_user?(@user)
    end

    def admin_user
      redirect_to(root_path) unless current_user.admin?
    end
end
