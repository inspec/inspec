set -eux

if [ "z${TRAVIS_PULL_REQUEST}" == "zfalse" ]; then
	echo "This change is not a pull request - skipping acceptance deploy"
	exit 0
fi

cd www
npm install -g gulp
BUNDLE_GEMFILE="./Gemfile" bundle install
BUNDLE_GEMFILE="./Gemfile" bundle exec rake www:acceptance
