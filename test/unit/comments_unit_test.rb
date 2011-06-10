# To change this template, choose Tools | Templates
# and open the template in the editor.

require 'test_helper'

class CommentsUnitTest < ActiveSupport::TestCase

  def test_should_not_save_a_comment_without_msg_id
    comment = Comment.new
    assert !comment.valid?
    assert_equal "can't be blank" , comment.errors.on(:msg_id)
  end

  def test_should_not_save_a_comment_without_content
    
    comment = Comment.new
    assert !comment.valid?
    assert_equal "can't be blank", comment.errors.on(:content)

  end

 def test_should_not_save_a_comment_with_length_more_than_140
    comment = Comment.new(:content => "a"*141 , :msg_id => 1)
    assert !comment.valid?
    assert_equal "is too long (maximum is 140 characters)", comment.errors.on(:content)
  end



  
end