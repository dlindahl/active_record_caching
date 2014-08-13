module ActiveRecordCaching
  class CacheKeyExists < StandardError
    def message
      "ActiveRecord::Base.cache_key exists" \
      "\n\n" \
      "The ActiveRecord::Base.cache_key monkey patch is no longer required." \
      "\n" \
      "ActiveRecord::Base already responds to .cache_key" \
      "\n\n"
    end
  end

  class VersionCheckRequired < StandardError
    def message
      "ActiveModel::Serializer implementation check required."\
      "\n\n" \
      "There were some discrepancies found in regards to serialization\n" \
      "caching with ActiveModel::Serializer > 0.8.1.\n\n" \
      "Since it appears that ASM has been upgraded, you must double\n" \
      "check that ASM does indeed support caching and ensure that the\n" \
      "patches in CacheSerializing are still needed and compatible.\n\n" \
      "For more information:\n\n" \
      "  * https://github.com/rails-api/active_model_serializers/issues/467#issuecomment-30388385\n" \
      "  * https://github.com/rails-api/active_model_serializers/issues/478#issuecomment-31367143\n" \
      "\n\n"
    end
  end
end