# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_roster_session',
  :secret      => '66f0ed4fbf5e786cbcb8356fb0c2b79a54377aadbbe9ed6f30fb5089de9488a54a7c618a9fd71a455caff035c3d47551bb35538df4b08088b53095c71f551509'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
