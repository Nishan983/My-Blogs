class Blog < ApplicationRecord
    belongs_to :user
    has_many_attached :images
    validates :title, presence: true
    validates :body, presence: true,  length:  { minimum: 2 }

    # enum status: [
    #     :draft, :archieved,:dropped, :banned, :active
    # ]
end
