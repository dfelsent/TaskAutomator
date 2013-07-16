# -*- encoding : utf-8 -*-
class AddDescriptionAndBytesizeAndKeywordsToMycodes < ActiveRecord::Migration
  def change
    add_column :mycodes, :description, :text

    add_column :mycodes, :bytesize, :integer

    add_column :mycodes, :keywords, :text

  end
end
