# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  include TagsHelper

  # http://railscasts.com/episodes/30-pretty-page-title
  def title(page_title)
    content_for(:title) { h(page_title) }
  end

  def meta(meta_stuff)
    content_for(:meta) { (meta_stuff) }
  end

  def flash_notice
    if flash[:notice]
      content_tag('div', h(flash[:notice]), {:id => "flash_notice"})
    end
  end

  # http://juixe.com/techknow/index.php/2006/07/15/acts-as-taggable-tag-cloud/
  def get_tags
    Letter.tag_counts(:limit => 100, :order => "name desc")
  end

  def tag_cloud(tags, classes)
    max, min = 0, 0
    tags.each { |t|
      max = t.count.to_i if t.count.to_i > max
      min = t.count.to_i if t.count.to_i < min
    }
  
    divisor = ((max - min) / classes.size) + 1
  
    tags.each { |t|
      yield t.name, classes[(t.count.to_i - min) / divisor]
    }
  end

  def get_top_letters
    Letter.find(:all, :order => "cached_total_favorites DESC", :limit => 5)    
  end

end
