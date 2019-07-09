# frozen_string_literal: true

require 'spec_helper'

RSpec.describe JsonbAttrAccessor do
  it 'has a version number' do
    expect(JsonbAttrAccessor::VERSION).not_to be nil
  end

  it 'is mixed into ActiveRecord::Base' do
    expect(ActiveRecord::Base.ancestors).to include(subject)
  end

  it 'defines jsonb_attr_accessor' do
    expect(ActiveRecord::Base).to respond_to(:jsonb_attr_accessor)
  end

  describe '#jsonb_attr_accessor' do
    context 'methods definitions' do
      let(:system) { System.new }

      it 'defines getters and setters for the given attributes' do
        expect(system).to attr_accessorize(:system_url)
        expect(system).to attr_accessorize(:username)
        expect(system).to attr_accessorize(:password)
      end

      it 'defines scopes for the given attributes' do
        expect(System).to respond_to(:by_system_url)
        expect(System).to respond_to(:by_username)
        expect(System).to respond_to(:by_password)
      end
    end
  end
end
