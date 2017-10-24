100.times do |i|
	Post.seed_once(:id) do |post|
		post.id = i + 1
		post.title = "#{i + 1}件目のタイトル"
		post.body  = "#{i + 1}件目の投稿"
		post.user_id = rand(1..10)
	end
end