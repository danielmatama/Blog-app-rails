require 'rails_helper'

RSpec.describe Comment, type: :model do
  describe 'Validations For comments' do
    before(:each) do
      @comment = Comment.new(author_id: 1, post_id: 3)
    end

    before { @comment }

    it 'if author_id is present' do
      @comment.author_id = false
      expect(@comment).to_not be_valid
    end

    it 'if post_id is present' do
      @comment.post_id = nil
      expect(@comment).to_not be_valid
    end
  end
end
