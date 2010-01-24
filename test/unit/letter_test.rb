require 'test_helper'

class LetterTest < ActiveSupport::TestCase
  
  def test_should_require_title
    @letter = Letter.create
    @letter.user = users(:jon)
    @letter.save
    assert(@letter.errors[:title], "Should be errors for title field")
  end

  def test_should_require_user
    @letter = Letter.create
    @letter.title = "Hai"
    @letter.save
    assert(@letter.errors[:user], "Should be errors in the user field")
  end
      
end
