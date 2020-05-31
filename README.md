# README

develop env setup
* run service with docker-compose 
```bash
docker-compose up -d
```
* wait a minutes check http://localhost:3000 you can see a page
* migration db
```bash
docker-compose exec ruby bash
rake db:migrate
```
* check short url api work
```bash
POST http://localhost:3000/shortUrl
Request body
{
  "url": "https://www.google.com",
  "code": "0000A"
}
```
