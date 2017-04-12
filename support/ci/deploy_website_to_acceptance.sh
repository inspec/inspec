set -eux

if [ "z${TRAVIS_PULL_REQUEST}" == "zfalse" ]; then
	echo "This change is not a pull request - skipping acceptance deploy"
	exit 0
fi

cd www
npm install -g gulp
bundle install
bundle exec rake www:acceptance
