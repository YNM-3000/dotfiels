local comment_ok, comment = pcall(require, "comment")
if not comment_ok then
	return
end

comment.setup()
