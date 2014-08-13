module ActiveRecordCaching
  module CacheSerializing
    def perform_caching?
      valid_representation? && super
    end

    def cache_key
      if defined?(super)
        super
      elsif object.respond_to?(:cache_key)
        object.cache_key
      else
        raise NoMethodError, "undefined method `cache_key' for #{object}"
      end
    end

    def respond_to?(method_name, *args)
      return super if method_name != :cache_key

      # If the serializer explicitly defines :cache_key or the object itself
      # defines it, then we can assume that :cache_key is supported
      method(:cache_key).owner != CacheSerializing || object.respond_to?(:cache_key)
    end

  private

    # Allows easy determination about whether or not to read from the cache
    # based on the serialized object's state of validations.
    def valid_representation?
      return true unless object.respond_to? :errors

      object.errors.blank?
    end
  end
end