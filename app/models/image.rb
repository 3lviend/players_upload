class Image < ApplicationRecord
	mount_uploaders :files , ImageUploader
	serialize :files, JSON
end
