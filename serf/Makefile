SHELL := /bin/bash

target: librarian

clean:
	rm -rf bin .bundle

librarian: ./bin/librarian-puppet
	./bin/librarian-puppet install

./bin/librarian-puppet: bundle

bundle:
	bundle install --path .bundle/vendor --binstubs

