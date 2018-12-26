BIN=../../gbdk-n/bin
OBJ=./obj



build:
	mkdir -p $(OBJ)
	$(BIN)/gbdk-n-compile.sh Move.c -o $(OBJ)/Move.rel
	$(BIN)/gbdk-n-link.sh $(OBJ)/Move.rel -o $(OBJ)/Move.ihx
	$(BIN)/gbdk-n-make-rom.sh $(OBJ)/Move.ihx Move.gb

clean:
	rm -rf $(OBJ)
	rm -f Move.gb
