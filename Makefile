all: nbackbright.nim
	nim c -d:release --opt:size nbackbright.nim

clean:
	rm -rf nbackbright
