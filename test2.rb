require 'houston'

# An example of the token sent back when a device registers for notifications
token = '4bef0589e4a186a5d1ec8a135db472dd75550a285b44c0820a84eedaf3806294'


certificate = File.read('production_Artisan.I-ll-Be-Back.pem')
passphrase = 'T1ypDfyp!'
connection = Houston::Connection.new(Houston::APPLE_DEVELOPMENT_GATEWAY_URI, certificate, passphrase)
connection.open

notification = Houston::Notification.new(device: token)
notification.alert = 'Hello, World!'
notification.badge = 2
connection.write(notification.message)

connection.close


