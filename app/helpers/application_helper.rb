module ApplicationHelper

def full_title(page_title)
	base_title = ""
	if page_title.empty?
		base_title
	else
		"#{base_title} | #{page_title}"
	end
end

def tag_cloud(tags, classes)
  max = tags.collect(&:counter).sort.last
  tags.each do |tag|
    index = tag.counter.to_f / max * (classes.size - 1)
    yield(tag, classes[index.round])
  end
end

end
