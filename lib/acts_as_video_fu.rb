module Mdarby
  module Acts #:nodoc:
    module Acts_as_video_fu #:nodoc:

      VIMEO_RE   = /^http:\/\/vimeo.com\/[0-9]*$/
      YOUTUBE_RE = /^http:\/\/www.youtube.com\/watch\?v=[a-zA-z0-9]*$/

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
      end

      module InstanceMethods
          
        def kind?
          return "YouTube" if YOUTUBE_RE.match(video_url)
          return "Vimeo" if VIMEO_RE.match(video_url)
          return false
        end
        
        private
        
        def validate
          raise "#{self.class.to_s}#video_url doesn't exist!" unless respond_to?(:video_url)
          
          unless video_url.blank?
            errors.add_to_base("Video URL is not recognized") unless kind?
          end
        end
        
      end
    end
  end
end
