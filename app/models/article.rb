class Article < ActiveRecord::Base
  belongs_to :user

  validates :title, :content, presence: { message: "に未入力項目があります"}
  
  validates_acceptance_of :confirming
  after_validation :check_confirming

  def check_confirming
  	if errors.empty? then
    # 編集ボタンを押したら
	    self.confirming = ''
  	else
      errors.delete(:confirming)
      self.confirming = errors.empty? ? '1' : ''
	  end
  end
end
