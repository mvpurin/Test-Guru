#VERSION = '0.1.0'

class Version
	class << self
		attr_accessor :current_version
	end
	@current_version = '0.1.0'
end
