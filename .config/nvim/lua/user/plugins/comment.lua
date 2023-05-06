local comment_ok, comment = pcall(require, "Comment")
if not comment_ok then
  print('comment not ok')
	return
end

comment.setup()
