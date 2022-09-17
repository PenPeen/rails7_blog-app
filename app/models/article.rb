class Article < ApplicationRecord
    # バリデーション
    validates :title, {
        presence: true,
        length: {maximum: 50}
    }
    validates :body, {
        presence: true,
        length: {in: 5..5000}
    }
end
