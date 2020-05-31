class AddShortUrl < ActiveRecord::Migration[6.0]
  def change
    create_table :short_urls do |t|
      t.string :url, null: false
      t.string :code, null: true
      t.timestamps
    end

    execute 'ALTER TABLE short_urls MODIFY id INT(11) NOT NULL AUTO_INCREMENT;'
  end
end
