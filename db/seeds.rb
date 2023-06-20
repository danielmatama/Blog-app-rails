first_user = User.create(name: 'Aman', photo: 'https://avatars.githubusercontent.com/u/80094659?v=4', bio: 'Learning More.')
 second_user = User.create(name: 'Bese', photo: 'https://avatars.githubusercontent.com/u/23375153?v=4', bio: 'Living my dream.')
 third_user = User.create(name: 'Yidne', photo: 'https://avatars.githubusercontent.com/u/104775335?v=4', bio: 'See you in the next round.')


 first_post = Post.create(author_id: first_user.id, title: 'Hello', text: 'ONE This is my first post')
 second_post = Post.create(author_id: first_user.id, title: 'Hi there', text: 'ONE This is my second post')
 third_post = Post.create(author_id: first_user.id, title: 'Holaaa', text: 'ONE This is my third post')
 fourth_post = Post.create(author_id: second_user.id, title: 'Hello', text: 'TWO This is my first post')
 fifth_post = Post.create(author_id: second_user.id, title: 'Hey hey', text: 'TWO This is my second post')
 sixth_post = Post.create(author_id: second_user.id, title: 'Man', text: 'TWO This is my third post')
 seventh_post = Post.create(author_id: third_user.id, title: 'Checking', text: 'THREE This is my first post')
 eight_post = Post.create(author_id: third_user.id, title: 'Another Title', text: 'THREE This is my second post')
 nineth_post = Post.create(author_id: third_user.id, title: 'New line', text: 'THREE This is my third post')

 first_comment = Comment.create(author_id: first_user.id, post_id: first_post.id, text: 'Hi Some one there!' )
 second_comment = Comment.create(author_id: second_user.id, post_id: second_post.id, text: 'Hi is this real!' )
 third_comment = Comment.create(author_id: third_user.id, post_id: third_post.id, text: 'Hi another comment here!' )
 fourth_comment = Comment.create(author_id: first_user.id, post_id: fourth_post.id, text: 'Hello to this post!' )
 fifth_comment = Comment.create(author_id: second_user.id, post_id: second_post.id, text: 'This is not good!' )
 sixth_comment = Comment.create(author_id: third_user.id, post_id: sixth_post.id, text: 'Ow I loved this one!' )
 seventh_comment = Comment.create(author_id: first_user.id, post_id: fifth_post.id, text: 'This is so cool!' )
 eighth_comment = Comment.create(author_id: second_user.id, post_id: seventh_post.id, text: 'Can you post the link to it.' )
 nineth_comment = Comment.create(author_id: third_user.id, post_id: fifth_post.id, text: 'Hello good people.' )
 tenth_comment = Comment.create(author_id: first_user.id, post_id: eight_post.id, text: 'i did not get the idea.' )
 eleventh_comment = Comment.create(author_id: second_user.id, post_id: eight_post.id, text: 'Can someone else clarify it to me.' )
 twelveth_comment = Comment.create(author_id: third_user.id, post_id: nineth_post.id, text: 'This is awesome.' )



 first_like = Like.create(author_id: third_user.id, post_id: third_post.id)
 second_like = Like.create(author_id: second_user.id, post_id: first_post.id)
 third_like = Like.create(author_id: first_user.id, post_id: third_post.id)
 fourth_like = Like.create(author_id: first_user.id, post_id: second_post.id)
 fifth_like = Like.create(author_id: third_user.id, post_id: first_post.id)
 sixth_like = Like.create(author_id: second_user.id, post_id: third_post.id) 
 