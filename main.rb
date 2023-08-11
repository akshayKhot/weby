class App
  def initialize
    loader = Zeitwerk::Loader.new

    autoload_paths = ['models', 'controllers', 'views']
    autoload_paths.each do |dir|
      loader.push_dir(dir)
    end

    loader.setup
  end
end