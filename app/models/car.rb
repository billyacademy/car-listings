class Car < ActiveRecord::Base
  validates :manufacturer_id, presence: true
  validates :color, presence: true
  validates :year, presence: true, length: { is: 4 }, greater_than: 1919

  belongs_to :manufacturer
end
