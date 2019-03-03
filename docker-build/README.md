docker build -t pandoc-book .
docker tag fdb49df9901e merovex/pandoc-book:latest
docker push merovex/pandoc-book 
