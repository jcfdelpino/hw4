secret_password = "tacos"
encrypted_password = BCrypt::Password.create(secret_password)
puts encrypted_password