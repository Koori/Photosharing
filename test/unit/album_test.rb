require 'test_helper'

class AlbumTest < ActiveSupport::TestCase
  setup do
  	@title1 = "album1"
  	@title2 = "album2"
    @album = Album.new(:title => @title1)
  end
  
  test "should not save album without title" do
	album = Album.new
	assert !album.save, "saved album without title"
  end
  
  test "should create album" do
	assert @album.save, "did not create album"
  end
  
  test "should delete album" do
    @album.save
    expected = @album.id
    assert @album.destroy, "did not deleted album"
    assert_raise ActiveRecord::RecordNotFound do
    	Album.find(expected)
    end
  end
  
  test "should update attributes of album" do
    @album.save
    @album.update_attributes(:title => @title2)
    expected = Album.find(@album.id)
  	assert @album.update_attributes(:title => @title2) && expected.title == @title2, "did not updated attributes of album"
  end
  
  def teardown
    @album = nil
  end
end
