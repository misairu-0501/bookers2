class CreateBooks < ActiveRecord::Migration[6.1]
  def change
    create_table :books do |t|

      t.integer :user_id #20220209:カラムuser_id追加
      t.string :title #20220209:カラムtitle追加
      t.text :body #20220209:カラムbody追加

      t.timestamps
    end
  end
end
