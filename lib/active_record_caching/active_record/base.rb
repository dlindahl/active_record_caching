# Adds a #cache_key method to ActiveRecord::Base so that cache_digest has
# something meaningful to use when caching collections (ActiveRecord::Relation)
#
# From http://broadcastingadam.com/2012/07/advanced_caching_part_6-fast_json_apis/
module ActiveRecord
  class Base
    def self.cache_key
      Digest::MD5.hexdigest "#{all.to_sql}-#{updated_at.try(:to_i)}-#{all.count}"
    end

    def self.updated_at
      all.maximum(:updated_at)
    end
  end
end