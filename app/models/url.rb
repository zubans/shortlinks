class Url < ApplicationRecord
  validates :short_url, uniqueness: true
  validates :long_url, presence: true

  def self.base_link
    "http://baselink.bs/"
  end
end
