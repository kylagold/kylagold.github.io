all : clean build

clean :
	-@docker stop `docker ps -q` 2>/dev/null || true
	-@docker rm `docker ps -aq` 2>/dev/null || true
	-@docker rmi `docker images -aq` 2>/dev/null || true

build :
	docker build --rm -t kylagold .

run : 
	-@docker stop kylagold
	-@docker rm kylagold
	docker run --name kylagold -p 8005:8000 --rm -t -v $(CURDIR):/kylagold kylagold

shell :
	docker run --rm -t -i -v $(CURDIR):/kylagold kylagold /bin/bash -l

exec :
	docker exec -t -i kylagold /bin/bash -l
stop :
	-@docker stop kylagold
