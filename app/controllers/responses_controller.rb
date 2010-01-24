class ResponsesController < ApplicationController
  before_filter :find_letter

  def new
    @response = Response.new
  end
  
  def create
    @response = Response.new(params[:response])

    # must check to see if user is logged in first
    @response.user = current_user
    @response.letter = @letter

    if @letter.responses << @response
      # email the post user
      if @response.user.id != @response.letter.user.id
        Emailer.deliver_comment("http://lovahs.com/letters/"+@response.letter.to_param, @response.letter.user.email, "A comment has been posted");
      end
      #
      redirect_to_letter('Response posted.')
    else
      render :action => "new"
    end
    
  end

  def index
    @responses = @letter.responses
  end

  def edit
  end

  def destroy
  end

  private

  def redirect_to_letter(notice)  
    flash[:notice] = notice
    redirect_to :controller => "letters", 
                :action     => "show", 
                :id         => @letter.id
  end

  
  def find_letter
    @letter = Letter.find(params[:letter_id])
  end
  

end
