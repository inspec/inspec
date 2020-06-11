# API Samples

This directory contains a simple Sinatra web app illustrating how to use the client
in a server-side web environment.

It illustrates a few key concepts:

* Using [Google Sign-in](https://developers.google.com/identity) for authentication.
* Using the [googleauth gem](https://github.com/google/google-auth-library-ruby) to
  request incremental authorization as more permissions are needed.

# Setup

* Create a project at https://console.developers.google.com
* Go to the `API Manager` and enable the `Drive` and `Calendar` APIs
* Go to `Credentials` and create a new OAuth Client ID of type 'Web application'
    * Use `http://localhost:4567/oauth2callback` as the redirect URL
    * Use `http://localhost:4567` as the JavaScript origin

Additional details on how to enable APIs and create credentials can be
found in the help guide in the console.

## Example Environment Settings

For convenience, application credentials can be read from the shell environment
or placed in a .env file.

After setup, your .env file might look something like:

```
GOOGLE_CLIENT_ID=479164972499-i7j6av7bp2s4on5ltb7pjXXXXXXXXXX.apps.googleusercontent.com
GOOGLE_CLIENT_SECRET=JBotCTG5biFWGzXXXXXXXXXX
```

# Running the samples

To start the server, run

```
ruby app.rb
```

Open `http://localhost:4567/` in your browser to explore the sample.

