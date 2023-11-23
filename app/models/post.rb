class Post < ApplicationRecord
    # Validate the title and body
    validates :title, presence: true
    # Validate that the title has a length of atleast 5 characters
    validates :title, length: {minimum: 5, maximum: 7}

    #Create a custom validator that makes sure the title is in all caps
    validate :title_must_be_all_caps

    #Validates that the body has a length of atleast 10 characters
    validates :body, length: {minimum: 5}
    validates :body, presence: true

    #Validate the uniqueness of the title and body
    validates :title, uniqueness: true
    validates :body, uniqueness: true

    private
    def title_must_be_all_caps
        return if title == title.upcase
            errors.add(:title, 'must be in all caps')
        end
end
