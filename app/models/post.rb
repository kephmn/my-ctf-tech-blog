class Post < ApplicationRecord
    has_many :taggings, dependent: :destroy
    has_many :tags, through: :taggings 

    before_validation :generate_slug

    validates :title, :body, presence: true
    validates :slug, uniqueness: true

    validates :difficulty, inclusion: { in: %w[Easy Medium Hard], allow_nil: true }
    
    scope :published, -> { where(published: true).order(created_at: :desc) }

    def to_param
        slug
    end

    def tag_names
        tags.map(&:name).join(", ")
    end

    def tag_names=(names)
        self.tags = names.to_s.split(",").map(&:strip).reject(&:blank?).map do |name|
            Tag.find_or_create_by(name: name)
        end
    end

    private

    def generate_slug
        self.slug = title.to_s.parameterize if title.present?
    end 
end
