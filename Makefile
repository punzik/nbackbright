all: nbackbright.nim
	nim c -d:release --opt:size --nimcache:./.cache nbackbright.nim

clean:
	rm -rf nbackbright
