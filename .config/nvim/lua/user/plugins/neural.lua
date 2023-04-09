local neural_ok, neural = pcall(require, "neural")
if not neural_ok then
	return
end

neural.setup({
	source = {
		openai = {
			api_key = "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",
		},
	},
})
