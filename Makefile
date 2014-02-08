TARGET: install

install: ./modules/docker

./bin/librarian-puppet:
	bundle install --binstubs --path .bundle/vendor

./modules/docker: ./bin/librarian-puppet
	./bin/librarian-puppet install

clean:
	rm -rf .bundle bin modules *.lock

