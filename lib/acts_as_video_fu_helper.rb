module Mdarby
  module Acts #:nodoc:
    module Acts_as_video_fu_helper
  
      def display_video(obj)
        klass(obj).embed_html
      end
      
      def thumbnail_url(obj)
        klass(obj).thumbnail_url
      end
      
      
      private
      
        def klass(obj)
          obj.type.new(obj)
        end
        
    end
  end
end