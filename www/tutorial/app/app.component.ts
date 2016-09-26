import { Component, OnInit, EventEmitter } from '@angular/core';
import { Http, Response } from '@angular/http';
import { Observable } from 'rxjs/Rx';
import { HTTP_PROVIDERS } from '@angular/http';
import { XtermTerminalComponent } from './xterm-terminal/xterm-terminal.component';
declare var require: any;

const SH_PROMPT = '[36m$[0m ';
const INSPEC_PROMPT = '[0;32minspec> [0m';

@Component({
  selector: '[inspec-tutorial]',
  templateUrl: 'app/app.component.html',
  styleUrls: ['app/app.component.css'],
  providers: [ HTTP_PROVIDERS ],
  directives: [ XtermTerminalComponent ]
})

export class AppComponent implements OnInit {

  // all available commands parsed from json files
  commands: any = [];
  // we support two shell modes: 'sh' and 'inspec'
  shellMode: string = 'sh'

  // all tutorial instructions
  instructionsArray: any = [];
  // title of the current tutorial step
  title: string;
  // instruction of the current step
  instruction: any;
  // keeps track of step number count
  counter: number = 0;

  // taken as input by xterm terminal componen
  stdout: EventEmitter<string> = new EventEmitter<string>();

  // blue regular shell prompt
  prompt: string = SH_PROMPT;

  // colors for responses
  red: string = "[31m";
  white: string = "[37m";
  black: string = "[30m";

  // inspec shell depth
  shell_depth = 0;
  shell_command = ''

  constructor(private http: Http) { }

  ngOnInit() {
    // load content
    this.loadInstructions();
    this.loadCommands();
  }

  // determines all commands that are not part of the tutorial
  extraCmds() {
    let extra = this.commands.filter(function(item){
      return item['extra'] == true
    });
    return extra.map(function(item){return item.command})
  }

  formatInstructions() {
    return this.instruction || '';
  }

  // called when tutorial commands need to be displayed
  updateInstructions(step = null) {
    // if step is given, we calculate the new index
    let totalSteps = this.instructionsArray.length - 1;
    switch(step) {
      case "next":
        if (this.counter < totalSteps) {
          this.counter += 1;
        }
        break;
      case 'prev':
        if (this.counter > 0) {
          this.counter -= 1;
        }
        break;
      case 'first':
        this.counter = 1;
        break
      case 'last':
        this.counter = totalSteps;
        break
    }

    if (this.counter === this.instructionsArray.length - 1) {
      this.title = "the end; that's all folks!";
      this.instruction = "here are some other commands you can try out: \r\n\r\n" + this.extraCmds();
    } else if (this.instructionsArray[this.counter][1]) {
      this.title = this.instructionsArray[this.counter][0];
      this.instruction = this.instructionsArray[this.counter][1];
    } else {
      this.instruction = 'Sorry, something seems to have gone wrong. Please try refreshing your browser.';
    }
  }

  // takes the command as input. checks if the regex matches any of the keys in the commands
  // if it matches, we set matchFound to true and call printOnStdout. if it doesn't match,
  // we display a default error message
  execCommand(command, shell) {
    let response = ''
    let dir = 'app/responses/';
    let cmd = command.replace(/ /g,'\\s*')
    let regexcmd = new RegExp(('^'+cmd+'$'), 'm')
    var matchFound = false;
    // iterate over commands and try to match the command with the input
    for (var i = 0; i < this.commands.length; i++) {
      let item = this.commands[i]
      if (item.regex.exec(command) && item.shell == shell) {
        matchFound = true;
        this.http.get(dir + item.key).subscribe(data => {
          this.printOnStdout(data['_body'])
        },
        err => console.error(err));
      }
    }
    // if no match is found, we check if the command entered was inspec exec something
    // and if it is respond appropriately ('could not fetch inspec profile in ''), otherwise
    // respond with 'invalid command' and the command entered
    if (matchFound === false) {
      if (command.match(/^inspec exec\s*.*/)) {
        let target = command.match(/^inspec exec\s*(.*)/)
        response = this.red + "Could not fetch inspec profile in '" + target[1] + "' " + this.black;
      } else {
        response = this.red + 'command not found: ' + command;
      }
      this.printOnStdout(response + "\n\r")
    }
  }

  // handles a stdin command and prints on terminal stdout
  evalCommand(command) {
    let self = this
    // tutorial commands
    var m = /^\s*(next|prev|first|last)\s*$/.exec(command)
    let multiline = /\s*(describe|control|end)\s*/.exec(command)
    if (m) {
      // update the instructions widget
      // we are not calling this from the ng event loop, therefore we need to
      // trigger angular to update the tutorial section
      setTimeout(function(){
        self.updateInstructions(m[1]);
      }, 0);
      // send an empty response to get the command prompt back
      this.printOnStdout('')
    }
    // switch to InSpec shell commands
    // TODO, support targets for InSpec shell
    else if (/^\s*inspec\s*shell\s*$/.exec(command)) {
      // switch to InSpec shell
      this.shellMode = 'inspec'
      // switch prompt
      this.prompt = INSPEC_PROMPT;
      // output inspec hello text
      let init = "Welcome to the interactive InSpec Shell\n\rTo find out how to use it, type: [1mhelp[0m\n\r"
      this.printOnStdout(init);
    }
    // leave InSpec shell
    else if (/^\s*exit\s*$/.exec(command) && this.shellMode == 'inspec') {
      this.shellMode = 'sh'
      // switch prompt
      this.prompt = SH_PROMPT;
      this.printOnStdout("\n\r");
    }
    else if (this.shellMode == 'inspec' && multiline) {
      // count control + describe
      let mstart = command.match(/describe|control/g)
      if (mstart) {
        this.shell_depth += mstart.length
      }
      // end
      let mend = command.match(/end/g)
      if (mend) {
        this.shell_depth -= mend.length
      }

      this.shell_command += command + "\n"

      if (mend && this.shell_depth == 0) {
        command = this.shell_command
        this.shell_depth = 0
        this.shell_command = ''
        this.execCommand(command, this.shellMode);
      }
    }
    // default sh commands
    else if ((this.shell_depth == 0) || this.shellMode == 'sh') {
      this.execCommand(command, this.shellMode);
    }
    // store command in cache, must be an inspec shell command
    else {
      this.shell_command += command + "\n"
    }
  }

  // submit stdout data to terminal
  printOnStdout(data){
    this.stdout.emit(data)
    this.stdout.emit(this.prompt)
  }

  // load json file for instructions and save to instructionsArray
  // call updateInstructions to load first set of instructions
  loadInstructions() {
    let self = this
    this.http.get('app/responses/instructions.json')
      .subscribe(data => {
        self.instructionsArray = JSON.parse(data['_body']);
        self.updateInstructions();
      },
      err => console.error(err)
    );
  }

  // load json file for commands and push each object to commands
  loadCommands() {
    let self = this;
    this.http.get('app/responses/commands.json')
      .subscribe(data => {
        let commands = JSON.parse(data['_body']);
        // generate regular expression for each entry
        for (var i = 0; i < commands.length; i++) {
          // preps a string for use in regular expressions
          // @see http://stackoverflow.com/questions/3446170/escape-string-for-use-in-javascript-regex
          let cmd = commands[i].command.replace(/[\-\[\]\/\{\}\(\)\*\+\?\.\\\^\$\|]/g, "\\$&");
          cmd = cmd.replace(/ /g,"\\s*")
          cmd = cmd.replace(/\n/g,"\\s*")
          let pattern = '^\\s*'+cmd+'\\s*$'
          commands[i].regex = new RegExp(pattern, 'im')
        }
        this.commands = commands
      },
      err => console.error(err)
    );
  }
}
