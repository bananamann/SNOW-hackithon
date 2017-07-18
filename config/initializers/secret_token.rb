# Be sure to restart your server when you modify this file.

# Your secret key is used for verifying the integrity of signed cookies.
# If you change this key, all old signed cookies will become invalid!

# Make sure the secret is at least 30 characters and all random,
# no regular words or you'll be exposed to dictionary attacks.
# You can use `rake secret` to generate a secure secret key.

# Make sure your secret_key_base is kept private
# if you're sharing your code publicly.
Servicenow::Application.config.secret_key_base = '7db0690e347b24eab1bf5a53eb58f91973bcc35bcb0279b0e5c3321a1b3265843f4a30e5f7b4ee12e3442c4e714568f2ec685d01701970c91c5a2dfe56cf1249'
