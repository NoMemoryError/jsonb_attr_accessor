# frozen_string_literal: true

module JsonbAttrAccessor
  module Api
    module ClassMethods
      def jsonb_attr_accessor(jsonb_column_name, *attrs)
        attrs.each do |method_name|
          define_method("#{method_name}=") do |value|
            result = read_attribute(jsonb_column_name) || {}
            write_attribute(jsonb_column_name, result.merge(method_name => value))
          end

          define_method(method_name) do
            read_attribute(jsonb_column_name)[method_name.to_s]
          end

          scope "by_#{method_name}", ->(value) do
            where("(settings->>'#{method_name}') = ?", value)
          end
        end
      end
    end
  end
end
