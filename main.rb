Router.draw do
  get('/') { 'Hello World' }

  get('/posts') { 'All Posts' }

  get('/posts/new') { 'New post' }

  # Access HTTP request, too!
  get('/foo') do |env|
    "You're visiting #{env['REQUEST_URI']}"
  end
end