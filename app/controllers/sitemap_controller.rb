class SitemapController < ApplicationController 
  def index   
    @letters = Letter.find(:all,:order => "updated_at DESC", :limit => 50000)
    respond_to do |format|
      format.xml
    end
  end
end