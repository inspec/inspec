# Welcome to the InSpec Tutorial
-----------------------------------------------------------


## The InSpec whaaaat?  What is this thing?
This is an Angular 2 app that uses Xterm (https://github.com/sourcelair/xterm.js/) to simulate a terminal.
'Ok, but why?'
To give people an easy quick introduction to inspec and all it can do! Give it a try,
learn a thing or two, tell us what you'd like to know more about, and have fun exploring!


## How to run it
run `npm install` to load dependencies
run `npm run start` to open in your browser @ localhost:8080

-----------------------------------------------------------

## How does it work???

Well, let me tell you a story of a file named `tutorial.yml`, who lives in a directory named `inspec/www/tutorial/tutorial_files`.

This kind, informational file was full of content, and oh so desired to spread its knowledge.
But it knew not how to do so, for it was a simple yml file.

Then, from around the corner, came a sweet little ruby file, whose only wish was to help people
do the things they needed to do. It's name, in fact, was `command_simulator.rb`, and it lived in a
nearby directory named `inspec/tasks`. And, aha, a match was found.

And so command_simulator kindly took tutorialyml by the hand, and said 'let me help you! I can parse you, and help you help others'.
And thus it began...
command_simulator parsed tutorialyml to find the instructions and commands that are noted in the instructions.
After that, the real fun began: command_simulator worked and worked to format the commands and prepare them.
She created json files for instructions and commands, and used Train with MixLib:Shellout in the background to
run the commands and record the output to some .txt files in the `www/tutorial/app/responses` directory.
Pleased with her work, command_simulator turned to her friend the webapp, and said to her: 'take these json files, and show them to the people.'

Webapp then went and found her friend xterm, and said, why let's do this together, for two heads are always better than one!
And so webapp said to her dear friend angular2, please help me make this work! and angular2 came running, as friends always do.
And so angular2 met xterm, and as they shook hands, they knew they would be good friends together. So they put their heads together,
and made some decisions about what each one's role would be. Xterm claimed responsiblity for creating the terminal view,
reading the user's input, and displaying it.  App then explained she could take that final user input sent over by xterm and
and transform it into a regular expression, which she could then use to match against the information in the commandsjson file,
matching the user's input against the key and then retrieving the associated value's txt file.
And it was so. :)


## How to generate content for tutorial/update the tutorial

To generate content for the tutorial, update the tutorial.yml and/or commands.yml file and
run `bundle exec rake update_demo` from the root of inspec project.
 ** The github-markdown gem is causing some problems with this right now. Please run the ruby file directly for the moment:
 `ruby tasks/command_simulator.rb`

This will create/update three json files (commands.json, instructions.json, extra_commands.json)
and the .txt files for the app/responses/ directory (generated from the commands included in the tutorial.yml)
Those are the files required by the app to create the demo content.


----------------------------------------------------------

### Author: Victoria Jeffrey