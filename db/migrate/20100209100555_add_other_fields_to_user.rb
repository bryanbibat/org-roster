class AddOtherFieldsToUser < ActiveRecord::Migration
  def self.up
    add_column :users, :picture_url, :string
    add_column :users, :status, :string
    add_column :users, :nickname, :string
    add_column :users, :other_aliases, :text
    add_column :users, :website, :string
    add_column :users, :facebook, :string
    add_column :users, :twitter, :string
    add_column :users, :plurk, :string
    add_column :users, :multiply, :string
    add_column :users, :livejournal, :string
    add_column :users, :tumblr, :string
    add_column :users, :linkedin, :string
  end

  def self.down
    remove_column :users, :picture_url
    remove_column :users, :status
    remove_column :users, :linkedin
    remove_column :users, :tumblr
    remove_column :users, :livejournal
    remove_column :users, :multiply
    remove_column :users, :plurk
    remove_column :users, :twitter
    remove_column :users, :facebook
    remove_column :users, :website
    remove_column :users, :other_aliases
    remove_column :users, :nickname
  end
end
