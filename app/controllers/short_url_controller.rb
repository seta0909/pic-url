require_relative '../services/short_url_service'

class ShortUrlController < ActionController::API
  def index
    begin
      service = ShortUrlService.new
      url = service.getUrlFromCode(params[:code])
      render :json => {
          'url' => url
      }
    rescue ActiveRecord::RecordNotFound => e
      render :json => {
          'message' => 'not found short url'
      }
    end
  end

  def create
    service = ShortUrlService.new
    code = service.createShortUrl(params[:url])
    render :json => {
        'short_url' => request.base_url + "/" + code
    }
  end

  def redirect
    service = ShortUrlService.new
    url = service.getUrlFromCode(params[:code])
    redirect_to url
  end
end