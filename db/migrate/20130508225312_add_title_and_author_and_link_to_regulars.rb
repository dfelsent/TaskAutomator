# -*- encoding : utf-8 -*-
class AddTitleAndAuthorAndLinkToRegulars < ActiveRecord::Migration
  def change
    add_column :regulars, :title, :text
    add_column :regulars, :author, :string
    add_column :regulars, :link, :text
  end
end
