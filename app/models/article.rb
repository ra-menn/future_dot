class Article < ActiveRecord::Base
  belongs_to :user

  validates :title, :content, presence: { message: "に未入力項目があります"}
end
