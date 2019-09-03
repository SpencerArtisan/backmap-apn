require 'houston'

# An example of the token sent back when a device registers for notifications
token = '9f5330dfb1fbd3607bcda96399fea7c464aaec99a3191e85fc3e11f0d8f7a432'


certificate = File.read('Breadcrumbs2020.pem')
passphrase = 'T1ypDfyp!'
connection = Houston::Connection.new(Houston::APPLE_DEVELOPMENT_GATEWAY_URI, certificate, passphrase)
connection.open

notification = Houston::Notification.new(device: token)
notification.alert = 'Hello, World!'
notification.badge = 6
connection.write(notification.message)

connection.close


