class Article < ApplicationRecord
  with_options presence: true do
    validates :title
    validates :body
  end

  default_scope -> { order(created_at: :desc) }
end
