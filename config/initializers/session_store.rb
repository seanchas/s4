# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_s4_session',
  :secret      => '0ae3b0a5a08f4a0759209e8d81ac95f660a5105e988a536ebd0aa80e7ad419f3d668b6c14eb20643374acc03cbc8922175931d870c660b5bdabfa2dcb9f946de'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
