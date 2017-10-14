build=../../scripts/build.sh
move=mkdir -p ../../build/ && mv *.pdf ../../build/
docker=docker run -v $(shell pwd)/src:/src -v $(shell pwd)/scripts:/scripts

proyecto:
	@ cd src/main/ && $(build) proyecto && $(move)

trabajo:
	@ cd src/main/ && $(build) trabajo && $(move)

prueba:
	@ cd src/test/ && BSTINPUTS=".:./../main:" TEXINPUTS=".:./../main:" $(build) prueba && $(move)

docker-build:
	@ docker build -t latex .

docker-trabajo:
	@ $(docker) latex "cd /src/main && /scripts/build.sh trabajo"
	@ cd src/main/ && $(move)

docker-proyecto:
	@ $(docker) latex "cd /src/main && /scripts/build.sh proyecto"
	@ cd src/main/ && $(move)

docker-prueba:
	@ $(docker) -e BSTINPUTS="/src/main:" -e TEXINPUTS="/src/main:" latex "cd /src/test && /scripts/build.sh prueba"
	@ cd src/test/ && $(move)

plantuml:
	@ for i in $(shell find . -name *.puml); do echo $$i; plantuml $$i; done;
