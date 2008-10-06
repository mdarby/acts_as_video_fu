class YouTube
  include HTTParty
  format :xml
  base_uri 'gdata.youtube.com'
  default_params :output => 'xml'
  
  def initialize(obj)
    @clip_id   = obj.video_url.split('?v=').last
    @embed_url = "http://www.youtube.com/v/#{@clip_id}" << "&hl=en&fs=1"
    @response  = self.class.get("/feeds/api/videos/#{@clip_id}")
  end
  
  def thumbnail_url
    @response["entry"]["group"]["thumbnail"][0]["url"]
  end
  
  def embed_html
    <<-END
      <object width="425" height="344">
        <param name="movie" value="#{@embed_url}"></param>
        <param name="allowFullScreen" value="true"></param>
        <embed src="#{@embed_url}" type="application/x-shockwave-flash" allowfullscreen="true" width="425" height="344"></embed>
      </object>
    END
  end
  
end