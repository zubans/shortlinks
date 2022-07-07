class UrlsController < ApplicationController
  before_action :find_link, only: [:return_url, :stats]

  def index
    short_url = rand(36 ** 8).to_s(36)
    url = Url.new(long_url: params[:long_url], short_url: short_url)
    if url.valid?
      url.save
      render json: ["status" => "ok", "link" => Url.base_link + short_url]
    else
      render json: ["status" => url.errors.objects.first.full_message]
    end
  end

  def return_url
    if @url
      @url.count += 1
      @url.save
      render json: ["status" => "ok", "link" => @url.long_url]
    else
      render json: ["status" => "error"]
    end
  end

  def stats
    if @url
      return render json: [
                      "status" => "ok",
                      "count" => @url.count,
                    ]
    end

    return render json: ["status" => "error"]
  end

  private

  def find_link
    @url = Url.find_by(short_url: params[:short_url])
  end

  def url_params
    params.require(:url).permit(:long_url, :short_url, :count)
  end
end
