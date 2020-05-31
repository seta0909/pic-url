require 'test_helper'

class ShortUrlServiceTest < ActiveSupport::TestCase
  test "number encode to base62" do
     service = ShortUrlService.new
     result = service.encodeBase62(1)
     assert_equal "00001", result
  end

  test "number decode to base62" do
       service = ShortUrlService.new
       result = service.decodeBase62('0000j')
       assert_equal 19, result
  end

  test "create a short url" do
      service = ShortUrlService.new
      result = service.createShortUrl("https://www.google.com")
      assert_equal "00001", result
  end

  test "get url fail code not exists" do
      service = ShortUrlService.new
      assert_raises "not found" do
        result = service.getUrlFromCode("swr23r2")
      end
  end

  test "get url success" do
     ShortUrl.create(id: 19, code: "0000j", url: "https://www.google.com")
     service = ShortUrlService.new
     result = service.getUrlFromCode("0000j")
     assert_equal "https://www.google.com", result
  end
end
