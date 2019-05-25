# == Schema Information
#
# Table name: posts
#
#  id         :integer          not null, primary key
#  title      :string
#  content    :text
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Post < ApplicationRecord
  belongs_to :user
  has_many :comments
  validates :title, presence: { message: "Debe escribir un título"} 
  validates :content, length: {minimum: 250, too_short: "El numero de caracteres debe ser mayor a %{count}"  } 

  # https://hackernoon.com/performing-custom-validations-in-rails-an-example-9a373e807144



end

