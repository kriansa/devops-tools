.PHONY =: clean build release all
.SILENT : clean build release all
.DEFAULT_GOAL := all

clean:
	rm -rf build

build:
	mkdir build
	( cd container-tools && tar -czf "../build/container-tools.tar.gz" * )
	( cd deploy-tools && tar -czf "../build/deploy-tools.tar.gz" * )

release: build
	# This task uses my own release helper, available here:
	# https://github.com/kriansa/dotfiles/blob/master/plugins/git/bin/git-release
	git release $(version) --sign --use-version-file \
		--artifact="build/container-tools.tar.gz" \
		--artifact="build/deploy-tools.tar.gz"

all: clean build release
