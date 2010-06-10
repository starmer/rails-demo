# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_lists.jamesstarmer.com_session',
  :secret      => '541ff1f9e509548943ff5c9166ba7d8eb801caa603108f350c649812dad9a1f74531aafb3a583a4377212976e257d513cf0b2b18dbd64eb46eb5145e5c0d5b15'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
