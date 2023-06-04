local status, comment = pcall(require, "Comment")
if not status then
	return
end

-- enable comment
comment.setup()
