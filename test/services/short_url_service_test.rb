require 'test_helper'

class ShortUrlServiceTest < ActiveSupport::TestCase
  test "get code success" do
     service = ShortUrlService.new
     result = service.getUrlFromCode("0000j")
     assert true
  end
end
