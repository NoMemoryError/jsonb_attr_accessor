# frozen_string_literal: true

require "spec_helper"

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
    let(:system) { System.new }

    it "defines getters and setters for the given methods" do
      expect(system).to attr_accessorize(:system_url)
      expect(system).to attr_accessorize(:username)
      expect(system).to attr_accessorize(:password)
    end
  end
end
