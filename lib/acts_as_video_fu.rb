module Mdarby
  module Acts #:nodoc:
    module Acts_as_video_fu #:nodoc:

      VIMEO_RE   = /^http:\/\/(www\.vimeo|vimeo)\.com\/[0-9]*$/
      YOUTUBE_RE = /^http:\/\/(www\.youtube|youtube)\.com\/watch\?v=[^&]*(&.*){0,}$/

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

        def type
          return YouTube if youtube?
          return Vimeo if vimeo?
          return false
        end

        def youtube?
          YOUTUBE_RE =~ video_url
        end

        def vimeo?
          VIMEO_RE =~ video_url
        end


        private

          def validate
            raise "#{self.class.to_s}#video_url doesn't exist!" unless respond_to?(:video_url)

            unless video_url.blank?
              errors.add_to_base("Video URL has whitespace") if video_url.strip!
              errors.add_to_base("Video URL is not recognized") unless type
            end
          end

      end
    end
  end
end
