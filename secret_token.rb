# Be sure to restart your server when you modify this file.

# Your secret key is used for verifying the integrity of signed cookies.
# If you change this key, all old signed cookies will become invalid!

# Make sure the secret is at least 30 characters and all random,
# no regular words or you'll be exposed to dictionary attacks.
# You can use `rake secret` to generate a secure secret key.

# Make sure your secret_key_base is kept private
# if you're sharing your code publicly.
#追加の設定
require 'securerandom'

def secure_token
  token_file = Rails.root.join('.secret')
  if File.exist?(token_file)
    # Use the existing token.
    File.read(token_file).chomp
  else
    # Generate a new token and store it in token_file.
    token = SecureRandom.hex(64)
    File.write(token_file, token)
    token
  end
end

#元からあった設定
SampleApp::Application.config.secret_key_base = '7c5d8fe6c1cf672e98b0ede7a2087206ff7e72b28f7192fdb420e22e09dbc97b10d1f412c5dea5c5092c802ea65fe525fa6eb9c8126ac1458f2d352129a0e7fc'
