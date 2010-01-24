class LettersController < ApplicationController
# OPTIMIZE Clean out unused tags using Tag.destroy_unused = true

  before_filter :find_letter, :except => [:index, :new, :create, :tag]
  before_filter :require_user, :only => [:new, :create]

  def new
    @letter_categories = LetterCategory.find(:all, :order => "label").map {|u| [u.label, u.id] }
    @letter = Letter.new
    @cancel_url = (request.env["HTTP_REFERER"] || "/")    
  end
  
  def create
    @letter = Letter.new(params[:letter])
    @letter.user = current_user
    if @letter.save
      @letter.save_cached_tag_list
      flash[:notice] = 'Letter successfully created.'
      #redirect_to :controller => "users", :action => "show", :id => @current_user.login_username
      redirect_to :controller => "letters", :action => "show", :id => @letter.to_param
    else
      render :action => "new"
    end
    
  end

  def update
    if @letter.update_attributes(params[:letter])
      @letter.save_cached_tag_list
      flash[:notice] = 'Letter successfully updated.'
      redirect_to :controller => "letters", :action => "show", :id => @letter.id
    else
      render :action => "new"
    end
  end
  
  def edit
    @letter_categories = LetterCategory.find(:all, :order => "label").map {|u| [u.label, u.id] }
  end

  def tag
    #pagination http://blog.wolfman.com/articles/2007/7/30/paginating-acts_as_taggable-with-will_paginate
    if params[:sort] == "popular"
      @letters = Letter.find_tagged_with(params[:id], :order => "cached_total_favorites").reverse
    else
      @letters = Letter.find_tagged_with(params[:id], :order => "created_at").reverse
    end
  end

  def show
  end

  def destroy
    @letter.destroy

    flash[:notice] = 'Letter deleted.'
    redirect_to :controller => "users", :action => "show", :id => current_user.login_username
  end
  
  
  def index
    if params[:id] == "popular"
      #@letters = Letter.find(:all, :order => "cached_total_favorites").reverse
      @letters = Letter.paginate :page => params[:page], :per_page => 5, :order => 'cached_total_favorites DESC'
    else
      #@letters = Letter.find(:all, :order => "created_at").reverse
      @letters = Letter.paginate :page => params[:page], :per_page => 5, :order => 'created_at DESC'
    end
  end


  def tag_cloud
      @tags = Letter.tag_counts
  end

  def toggle_favorite
    @letter = Letter.find(params[:id])
    #if current_user.has_favorite?(@letter)
    #had to implement the workaround below, the function above always returns false
    if current_user.favorite_letters.find {|e| e.id == @letter.id }
      current_user.has_no_favorite(@letter)
      @letter.cached_total_favorites = @letter.cached_total_favorites-1
      @letter.save
      render :text => '<img class="heart-button" src="/images/heart-button.gif" />'
    else
      current_user.has_favorite(@letter)
      @letter.cached_total_favorites = @letter.cached_total_favorites+1
      @letter.save
      render :text => '<img class="heart-button" src="/images/heart-button-on.gif" />'
    end
  end

  def share_email
    @letter = Letter.find(params[:id])
    @email_to = params[:email]
    @name = params[:name]
    @message = params[:message]
    #
    Emailer.deliver_share_letter(@email_to, @letter.title, "http://lovahs.com/letters/"+@letter.to_param, @message, @name, @letter.contents);
    #
    render :text => 'Letter has been sent!'
  end

  private
  
  def find_letter
    @letter = Letter.find(params[:id])
  end
  

end
