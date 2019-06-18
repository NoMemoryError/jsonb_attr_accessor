# frozen_string_literal: true

require 'active_record'
require 'active_support'

require 'jsonb_attr_accessor/version'
require 'jsonb_attr_accessor/api'

module JsonbAttrAccessor
  extend ActiveSupport::Concern
  include Api
end

ActiveSupport.on_load(:active_record) do
  ActiveRecord::Base.send(:include, JsonbAttrAccessor)
end
