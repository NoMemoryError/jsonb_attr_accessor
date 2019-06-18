# frozen_string_literal

class SetupTestingDb < ActiveRecord::Migration[5.2]
  def change
    create_table :systems do |t|
      t.jsonb :settings
    end
  end
end
