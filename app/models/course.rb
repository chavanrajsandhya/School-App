class Course < ApplicationRecord
  has_many :batches
  has_many :students, :class_name => "User", through: :batches
end
