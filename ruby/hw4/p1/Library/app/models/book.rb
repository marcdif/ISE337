class Book < ApplicationRecord
    has_many :reviews
    validates :title, presence: true
    validates :author, presence: true
    validates :isbn, presence: true, uniqueness: true, numericality: true, length: {is: 10}
    validates :copies, presence: true, numericality: true

    def self.search_title(search)
        Book.where("title like ?", "%#{search}%");
    end

    def self.search_author(search)
        Book.where("author like ?", "%#{search}%");
    end

    def self.search_isbn(search)
        Book.where(isbn: search);
    end
end
  