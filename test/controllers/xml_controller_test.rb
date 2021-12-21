require 'test_helper'

class XmlControllerTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end
  test 'check rss format' do
    get '/', params: { number: 54, format: :rss }
    assert_response :success
    assert_includes @response.headers['Content-Type'], 'application/rss'
    end 
end
