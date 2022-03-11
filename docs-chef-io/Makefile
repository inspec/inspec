# we use pushd/popd here, and /bin/sh of our chefes/buildkite image is not bash
# so we have to override the default shell here
SHELL=bash

preview_netlify: chef_web_docs
	rm -rf chef-web-docs/_vendor/github.com/inspec/inspec/docs-chef-io/*
	cp -R content chef-web-docs/_vendor/github.com/inspec/inspec/docs-chef-io/
	cp -R static chef-web-docs/_vendor/github.com/inspec/inspec/docs-chef-io/
	cp -R layouts chef-web-docs/_vendor/github.com/inspec/inspec/docs-chef-io/
	cp -R config.toml chef-web-docs/_vendor/github.com/inspec/inspec/docs-chef-io/
	pushd chef-web-docs && make bundle; hugo --gc --minify --buildFuture && popd

serve: chef_web_docs
	echo "replace github.com/inspec/inspec/docs-chef-io => ../" >> chef-web-docs/go.mod
	pushd chef-web-docs && make bundle; hugo server --buildDrafts --buildFuture --noHTTPCache && popd

chef_web_docs:
	if [ -d "chef-web-docs/" ]; then \
		pushd chef-web-docs && git reset HEAD --hard; git clean -fd; git pull --ff-only origin main; rm -rf public && popd; \
	else \
		git clone https://github.com/chef/chef-web-docs.git; \
	fi

clean_all:
	rm -rf chef-web-docs

clean:
	pushd chef-web-docs && make clean_all && popd

lint:
	hugo -D
