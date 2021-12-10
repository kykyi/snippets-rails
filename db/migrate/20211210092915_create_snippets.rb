class CreateSnippets < ActiveRecord::Migration[6.1]
  def change
    create_table :snippets do |t|
      t.string :title, null: false
      t.string :content, null: false
      t.datetime :expires, null: false
      t.datetime :created, null: false
    end
  end
end
