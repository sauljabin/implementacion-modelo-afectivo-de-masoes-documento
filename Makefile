proyecto:
	@cd src/main/ ; ../../scripts/build proyecto
	@cd src/main/ ; ../../scripts/clean
	mkdir -p build/
	mv src/main/*.pdf build/

trabajo:
	@cd src/main/ ; ../../scripts/build trabajo
	@cd src/main/ ; ../../scripts/clean
	mkdir -p build/
	mv src/main/*.pdf build/

prueba:
	@cd src/test/ ; BSTINPUTS=".:./../main:" TEXINPUTS=".:./../main:" ../../scripts/build prueba
	@cd src/test/ ; ../../scripts/clean
	mkdir -p build/
	mv src/test/*.pdf build/
