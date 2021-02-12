# we use pushd/popd here, and /bin/sh of our chefes/buildkite image is not bash
# so we have to override the default shell here
SHELL=bash

preview_netlify: chef_web_docs
	cp -R content/* chef-web-docs/_vendor/github.com/inspec/inspec/docs-chef-io/content
	cp -R static/* chef-web-docs/_vendor/github.com/inspec/inspec/docs-chef-io/static
	cp -R config.toml chef-web-docs/_vendor/github.com/inspec/inspec/docs-chef-io/
	pushd chef-web-docs && make assets; hugo --gc --minify --buildFuture && popd

serve: chef_web_docs
	echo "replace github.com/inspec/inspec/docs-chef-io => ../" >> chef-web-docs/go.mod
	pushd chef-web-docs && make assets; hugo server --buildDrafts --buildFuture --noHTTPCache --ignoreVendorPaths "github.com/inspec/inspec/**" && popd

chef_web_docs:
	if [ -d "chef-web-docs/" ]; then \
		pushd chef-web-docs && git reset HEAD --hard; git pull origin master && popd; \
	else \
		git clone https://github.com/chef/chef-web-docs.git; \
	fi

clean_all:
	rm -rf chef-web-docs

clean:
	pushd chef-web-docs && make clean_all && popd

lint:
	hugo -D
