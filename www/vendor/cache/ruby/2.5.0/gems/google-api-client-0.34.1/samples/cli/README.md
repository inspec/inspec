# API Samples

This directory contains a small but growing collection of samples for various
APIs. Each sample can be run on the command line from the `google-api-samples`
script.

Contributions of new samples are welcome.

# Setup

Depending on which particular samples you want to run, different
steps may be required. Some samples, like Pub/Sub, require a service account,
others like Drive, Calendar, and YouTube require an OAuth Client ID. And in
some cases like Translate, only an API key is needed.

* Create a project at https://console.developers.google.com
* Go to the `API Manager` and enable the APIs you'd like to try
* Go to `Credentials` and create the appropriate type of credential for the sample
    * For keys, use 'Server key' as the type
    * For OAuth Client IDs, use 'Other' as the type
    * For service accounts, use the 'JSON' key type

Additional details on how to enable APIs and create credentials can be
found in the help guide in the console.


## Example Environment Settings

For convenience, application credentials can be read from the shell environment
or placed in a .env file.

After setup, your .env file might look something like:

```
GOOGLE_API_KEY=AIzaSyC6GvjvPlEzJpTW2bW2t0MPHXXXXXXXXXX
GOOGLE_CLIENT_ID=479164972499-i7j6av7bp2s4on5ltb7pjXXXXXXXXXX.apps.googleusercontent.com
GOOGLE_CLIENT_SECRET=JBotCTG5biFWGzXXXXXXXXXX
GOOGLE_APPLICATION_CREDENTIALS=~/ruby-samples-cred.json
```

# Running the samples

To list the available sample modules, run the script:
```
google-api-samples
```

To get help on a specific set of samples, run:
```
google-api-samples help <module>
```
