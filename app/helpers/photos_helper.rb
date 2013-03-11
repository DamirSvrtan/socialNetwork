module PhotosHelper

	def add_zeros(photo_id)
		if photo_id.between?(0,9)
			return "00#{photo_id}"
		elsif photo_id.between?(10,99)
			return "0#{photo_id}"
		else
			return "#{photo_id}"
		end
	end

	def get_photo(photo, size)
		return "/system/photos/images/000/000/#{add_zeros(photo.id)}/#{size}/#{photo.image_file_name}"
	end


end
