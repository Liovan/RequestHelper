require 'test_helper'

class MessageTest < ActiveSupport::TestCase
  def setup
    @message = Message.create(text:"شما بدهکار هستید لطفاً برای تصویه اقدام نمایید")

  end
  test "the truth" do
   assert @message.valid?
  end
end
