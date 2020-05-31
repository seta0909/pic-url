require 'base62-rb'

class ShortUrlService
  def createShortUrl(url)
    new_short_url = ShortUrl.create(code: "", url: url)
    code = self.encodeBase62(new_short_url.id)
    ShortUrl.update(new_short_url.id, {:code => code})

    return code
  end

  def getUrlFromCode(code)
    id = self.decodeBase62(code)
    url = ShortUrl.find(id)

    return url.url
  end

  def encodeBase62(number)
    return Base62.encode(number).rjust(5, '0')
  end

  def decodeBase62(code)
    return Base62.decode(code)
  end
end