class AddPhotoToArticles < ActiveRecord::Migration[5.1]
  def change
    add_column :articles, :photo, :string
    #add_column 這個方法，第一個參數是「資料表名稱」（注意：不是 Model 名稱喔），第二個參數是「要新增的欄位名稱」，第三個參數是這個欄位的「資料型態」。
  end
end
