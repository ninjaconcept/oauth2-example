# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_publisher_session',
  :secret      => '2100f3e1a2fabd2e7a1e6001f5a9ca4b7de337dc6ccb40ce02358c0ee43b2cbd4a268db70f2d0828b4a772ff8b6885b1920b4f7a20521050b99951af0a197208'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
