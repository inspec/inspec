# we use pushd/popd here, and /bin/sh of our chefes/buildkite image is not bash
# so we have to override the default shell here
SHELL=bash

assets:
	git submodule update --init --recursive
	git submodule foreach git pull origin master
	git submodule foreach git reset --hard
	pushd chef-web-docs/themes/docs-new && make assets && popd

clean:
	pushd chef-web-docs/themes/docs-new && make clean && popd
	rm -rf chef-web-docs/resources/

clean_all:
	pushd chef-web-docs/themes/docs-new && make clean_all && popd
	rm -rf chef-web-docs/resources/
	rm -rf chef-web-docs/results/

preview_netlify: chef_web_docs_submodule
	pushd chef-web-docs && make assets; hugo --buildFuture --gc --minify --enableGitInfo && popd

chef_web_docs_submodule:
	git submodule update --init --recursive
	git submodule foreach git pull origin master
	git submodule foreach git reset --hard
	cp -R content/* chef-web-docs/_vendor/github.com/inspec/inspec/docs-chef-io/content
	cp -R static/images/* chef-web-docs/_vendor/github.com/inspec/inspec/docs-chef-io/static/images
	cp -R layouts/* chef-web-docs/_vendor/github.com/inspec/inspec/docs-chef-io/layouts

reset_chef_web_docs:
	git submodule foreach git reset --hard
	git submodule foreach git clean -f -d

update_chef_web_docs:
	git submodule update --remote --merge chef-web-docs

serve: assets
	hugo server --buildDrafts --buildFuture --noHTTPCache

lint: assets
	hugo -D
