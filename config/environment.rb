# Load the Rails application.
require File.expand_path('../application', __FILE__)

# Initialize the Rails application.
Depot::Application.initialize!

Depot::Application.configure do
	config.action_mailer.delivery_method = :test
	#config.action_mailer.smtp_settings = {
	#	adress: "smtp.mathius.atthouse.pl",
	#	port: 587,
	#	authentication: "plain",
	#	user_name: "test@mkarcheo.com",
	#	password: "Test.112",
	#	enable_starttls_auto: true
#
#	}
	
end