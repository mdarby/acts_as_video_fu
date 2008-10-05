module Mdarby
  module Acts #:nodoc:
    module Acts_as_video_fu #:nodoc:

      YOUTUBE_RE = /^http:\/\/www.youtube.com\/watch\?v=[a-zA-z0-9]*$/
      VIMEO_RE   = /^http:\/\/vimeo.com\/[0-9]*$/

      def self.included(base)
        base.extend ClassMethods
      end

      module ClassMethods        
        def acts_as_video_fu          
          include Mdarby::Acts::Acts_as_video_fu::InstanceMethods
          extend Mdarby::Acts::Acts_as_video_fu::SingletonMethods          
          
          before_save :validate
        end
      end

      module SingletonMethods
        # Add class methods here
      end

      module InstanceMethods
        # Add instance methods here
          
        def kind?
          if YOUTUBE_RE.match(video_url)
            "YouTube"
          elsif VIMEO_RE.match(video_url)
            "Vimeo"
          else
            false
          end
        end
        
        private
        
        def validate
          unless video_url.blank?
            errors.add_to_base("Video URL is not recognized") unless self.kind?
          end
        end
        
      end
    end
  end
end
