module ActiveRecordCaching
  class Railtie < Rails::Railtie
    config.before_initialize do |app|
      ActiveSupport.on_load(:active_record) do
        if ActiveRecord::Base.respond_to? :cache_key
          raise CacheKeyExists
        else
          case Rails.version[0]
          when '3' then ActiveRecord::Base.extend(ActiveRecordCaching::CacheKey::Rails3)
          when '4' then ActiveRecord::Base.extend(ActiveRecordCaching::CacheKey::Rails4)
          else
            raise 'unsupported'
          end
        end
      end

      ActiveSupport.on_load(:active_model_serializers) do
        require 'active_model/serializers/version'
        if ActiveModel::Serializer::VERSION != '0.8.1'
          raise VersionCheckRequired
        end

        ActiveModel::ArraySerializer.send :prepend, CacheSerializing
        ActiveModel::Serializer.send :prepend, CacheSerializing
      end
    end
  end
end