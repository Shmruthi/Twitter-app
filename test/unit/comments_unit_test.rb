# To change this template, choose Tools | Templates
# and open the template in the editor.

require 'test_helper'

class CommentsUnitTest < ActiveSupport::TestCase

  def should_not_save_a_comment_without_msg_id
    comment = Comment.new(:content => "Sample Comment")
    assert !comment.save
  end

  test "should not save a comment without comment" do
    
    comment = Comment.new
    assert !comment.valid?

    assert_equal "can't be blank", comment.errors.on(:content)
  end

end