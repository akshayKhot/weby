require_relative './router'

router = Router.instance

router.get('/') { 'Hello World' }

router.get('/a') do |env| 
  'Page A' + env['REQUEST_URI']
end

router.get('/b') { |env| 'Page B' }