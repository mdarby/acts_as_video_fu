module Mdarby
  module Acts #:nodoc:
    module Acts_as_video_fu_helper
  
      def display_video(obj)
        obj.kind?.new(obj).embed_html
      end
      
      def thumbnail_url(obj)
        obj.kind?.new(obj).thumbnail_url
      end
      
    end
  end
end