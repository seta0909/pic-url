require_relative '../services/short_url_service'

class ShortUrlController < ActionController::API
  def index
    service = ShortUrlService.new
    url = service.getUrlFromCode(params[:code])
    render :json => {
        'code' => params[:code],
        'url' => url
    }
  end

  def create
    service = ShortUrlService.new
    code = service.createShortUrl(params[:url])
    render :json => {
        'url' => params[:url],
        'code' => code
    }
  end
end