class Image < ApplicationRecord
  mount_uploaders :files, ImageUploader
  mount_uploader :file, ImageUploader
  serialize :files, JSON
  has_many :plays
end
