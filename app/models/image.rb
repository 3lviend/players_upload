class Image < ApplicationRecord
	mount_uploaders :files, ImageUploader
	mount_uploader :file, ImageUploader
	serialize :files, JSON
end
