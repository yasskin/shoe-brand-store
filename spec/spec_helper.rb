ENV['RACK_ENV'] = 'test'

require('bundler/setup')
Bundler.require(:default, :test)
set(:root, Dir.pwd())
