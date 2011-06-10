# To change this template, choose Tools | Templates
# and open the template in the editor.

require 'test_helper'

class MicropostsUnitTest < ActiveSupport::TestCase


def test_should_display_comments_in_descending_order_of_time
    @user = User.create!(:name => "Shm", :email => "shm@gmail.com", :password => "foobar", :password_confirmation => "foobar")
    @micropost = @user.microposts.create(:content => "hi")
    comment1 = @micropost.comments.create(:content => "First")
    comment2 = @micropost.comments.create(:content => "Second")

    assert comment1.valid?
    assert comment2.valid?

    assert [comment2, comment1], @micropost.comments
end

def test_comment_should_be_destroyed_with_the_micropost

    @user = User.create!(:name => "Shm", :email => "shm@gmail.com", :password => "foobar", :password_confirmation => "foobar")
    @micropost= @user.microposts.create!(:content => "hi")
    comment = @micropost.comments.create!(:content => "comment")
    @micropost.destroy
    assert_equal "nil", comment.reload
end

end