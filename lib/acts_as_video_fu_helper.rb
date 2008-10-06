module Mdarby
  module Acts #:nodoc:
    module Acts_as_video_fu_helper
  
      def display_video(obj, height = nil, width = nil)
        if obj.kind? == "YouTube"
          youtube(obj, height, width)
        elsif obj.kind? == "Vimeo"
          vimeo(obj, height, width)
        end
      end
      
      def youtube(obj, height, width)
        height ||= 344
        width ||= 425
        url = obj.video_url.gsub("watch?v=", "v/") << "&hl=en&fs=1"
        
        <<-END
          <object width="#{width}" height="#{height}">
            <param name="movie" value="#{url}"></param>
            <param name="allowFullScreen" value="true"></param>
            <embed src="#{url}" type="application/x-shockwave-flash"
              allowfullscreen="true" width="#{width}" height="#{height}"></embed>
          </object>
        END
      end
      
      def vimeo(obj, height, width)
        height ||= 225
        width ||= 400
        clip_id = obj.video_url.split('/').last
        
        <<-END
          <object width="#{width}" height="#{height}">
            <param name="allowfullscreen" value="true" />
            <param name="allowscriptaccess" value="always" />
            <param name="movie" value="http://vimeo.com/moogaloop.swf?clip_id=#{clip_id}&amp;server=vimeo.com&amp;show_title=1&amp;show_byline=1&amp;show_portrait=0&amp;color=&amp;fullscreen=1" />	
            <embed src="http://vimeo.com/moogaloop.swf?clip_id=#{clip_id}&amp;server=vimeo.com&amp;show_title=1&amp;show_byline=1&amp;show_portrait=0&amp;color=&amp;fullscreen=1" type="application/x-shockwave-flash" allowfullscreen="true" allowscriptaccess="always" width="#{width}" height="#{height}"></embed>
          </object>
        END
      end
      
    end
  end
end