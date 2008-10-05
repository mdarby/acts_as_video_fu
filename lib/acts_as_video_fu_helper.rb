module Mdarby
  module Acts #:nodoc:
    module Acts_as_video_fu_helper
  
      def display_video(obj, alt_text = '')
        if obj.kind? == "YouTube"
          youtube(obj)
        elsif obj.kind? == "Vimeo"
          vimeo(obj)
        end
      end
      
      def youtube(obj)
        url = obj.video_url.gsub("watch?v=", "v/") << "&hl=en&fs=1"
        
        <<-END
          <object width="425" height="344">
            <param name="movie" value="#{url}"></param>
            <param name="allowFullScreen" value="true"></param>
            <embed src="#{url}" type="application/x-shockwave-flash"
              allowfullscreen="true" width="425" height="344"></embed>
          </object>
        END
      end
      
      def vimeo(obj)
        clip_id = obj.video_url.split('/').last
        
        <<-END
          <object width="400" height="225">
            <param name="allowfullscreen" value="true" />
            <param name="allowscriptaccess" value="always" />
            <param name="movie" value="http://vimeo.com/moogaloop.swf?clip_id=#{clip_id}&amp;server=vimeo.com&amp;show_title=1&amp;show_byline=1&amp;show_portrait=0&amp;color=&amp;fullscreen=1" />	
            <embed src="http://vimeo.com/moogaloop.swf?clip_id=#{clip_id}&amp;server=vimeo.com&amp;show_title=1&amp;show_byline=1&amp;show_portrait=0&amp;color=&amp;fullscreen=1" type="application/x-shockwave-flash" allowfullscreen="true" allowscriptaccess="always" width="400" height="225"></embed>
          </object>
        END
      end
      
    end
  end
end