# Adds a #cache_key method to ActiveRecord::Base so that cache_digest has
# something meaningful to use when caching collections (ActiveRecord::Relation)
#
# From http://broadcastingadam.com/2012/07/advanced_caching_part_6-fast_json_apis/
module ActiveRecordCaching
  module CacheKey
    module Rails3
      def cache_key
        Digest::MD5.hexdigest(raw_cache_key)
      end

      def updated_at
        scoped.maximum(:updated_at)
      end

      def raw_cache_key
        "#{scoped.to_sql}-#{updated_at.try(:to_i)}-#{scoped.count}"
      end
    end

    module Rails4
      def cache_key
        Digest::MD5.hexdigest(raw_cache_key)
      end

      def updated_at
        all.maximum(:updated_at)
      end

      def raw_cache_key
        "#{all.to_sql}-#{updated_at.try(:to_i)}-#{all.count}"
      end
    end
  end
end