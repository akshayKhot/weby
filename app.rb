class App
  def call(env)
    headers = { 'Content-Type' => 'text/html' }
    
    response_html = File.read('views/index.html')
    
    [200, headers, [response_html]]
  end
end