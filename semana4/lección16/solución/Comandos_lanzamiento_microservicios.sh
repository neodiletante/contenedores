docker run -d -p 5000:5000 -v /uploads:/uploads --name upload_service upload_service
docker run -d -p 6000:6000 -v /uploads:/uploads --name list_service list_service
docker run -d -v /uploads:/uploads --name email_service email_service smtp.example.com admin@example.com
