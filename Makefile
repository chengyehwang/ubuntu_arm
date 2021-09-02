ARGS=-u $(shell id -u):$(shell id -g)
pull:
	docker pull chengyehwang/ubuntu_arm
	docker tag chengyehwang/ubuntu_arm ubuntu_arm
build:
	docker build -t ubuntu_arm:latest .
run:
	docker run -t ubuntu_arm 
shell:
	docker run -i $(ARGS) --net host -t ubuntu_arm
push:
	docker login
	docker tag ubuntu_arm chengyehwang/ubuntu_arm
	docker push chengyehwang/ubuntu_arm

