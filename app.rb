class App
  def call(env)
    headers = { 'Content-Type' => 'text/html' }
    
    response = ['<h1>Hello, World!</h1>']
    
    [200, headers, response]
  end
end