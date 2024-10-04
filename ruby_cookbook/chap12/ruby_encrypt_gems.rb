# recipe 13.6 Symmetically Encrypting Data
# gems:
#   - gibberish
#   - ezcrypto

require 'gibberish'

plaintext = '24.9195N 17.821E'

aes_key = Gibberish::AES.new("My secret key")
aes_cyphertext = aes_key.enc(plaintext)
aes_key.dec(aes_cyphertext)


# Wrapper around the OpenSSL library
require 'ezcrypto'

ezcrypto_key = EzCrypto::Key.with_password 'My secret key', 'salt string'
ezcrypto_ciphertext = ezcrypto_key.encrypt(plaintext)
ezcrypto_key.decrypt(ezcrypto_ciphertext)

