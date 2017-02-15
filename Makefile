build=../../scripts/build.sh
move=mkdir -p ../../build/ && mv *.pdf ../../build/

proyecto:
	@cd src/main/ && $(build) proyecto && $(move)

trabajo:
	@cd src/main/ && $(build) trabajo && $(move)

prueba:
	@cd src/test/ && BSTINPUTS=".:./../main:" TEXINPUTS=".:./../main:" $(build) prueba && $(move)
