class CreateTopDjs < ActiveRecord::Migration
  def self.up
    create_table :top_djs do |t|
      t.string :list_order
      t.string :name
      t.text :description
      t.string :link
      t.string :preview_image_file_name
      t.string :preview_image_content_type
      t.integer :preview_image_file_size
      t.datetime :preview_image_updated_at
      t.string :main_image_file_name
      t.string :main_image_content_type
      t.integer :main_image_file_size
      t.datetime :main_image_updated_at

      t.timestamps
    end
  end

  def self.down
    drop_table :top_djs
  end
end
