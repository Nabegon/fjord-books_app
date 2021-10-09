# frozen_string_literal: true

# NOTE: OmniAuthが発展編に移動したので、関連するカラムを削除
# https://bootcamp.fjord.jp/announcements/465
class RemoveOmniauthColumnsFromUsers < ActiveRecord::Migration[6.1]
  def up
    remove_index :users, %i[provider uid]
    remove_column :users, :uid
    remove_column :users, :provider
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
