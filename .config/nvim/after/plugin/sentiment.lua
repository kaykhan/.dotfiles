local sentiment_status, sentiment = pcall(require, "sentiment")
if not sentiment_status then
	return
end

sentiment.setup({
})
