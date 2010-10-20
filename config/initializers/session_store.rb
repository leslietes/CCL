# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_condo_session',
  :secret      => '9b48993b00a57a47c129d548207e140a917263bfbcb127f0bef723d88d01f048d082c9a977b4db97880074a54ee0f66ccd05cc51e063e9e85db7a0a0fa49d7c6'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
