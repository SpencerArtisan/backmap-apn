require 'houston'

# An example of the token sent back when a device registers for notifications
# token = '4bef0589e4a186a5d1ec8a135db472dd75550a285b44c0820a84eedaf3806294'
# token = '31feb260c793212169c30e9f29097d52f86741b1cce0c4418372c1628ede17dc'
token = '0180162d8bfae2b402c81bcad0c14b8073a0cdf2cd5308c13d19620db4006509'

certificate = File.read('push.pem')
passphrase = 'T1ypDfyp!'
connection = Houston::Connection.new(Houston::APPLE_DEVELOPMENT_GATEWAY_URI, certificate, passphrase)
connection.open

notification = Houston::Notification.new(device: token)
notification.alert = 'Hello, World!'
notification.badge = 6
connection.write(notification.message)

connection.close


