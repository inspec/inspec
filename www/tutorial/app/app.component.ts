import { Component, OnInit } from '@angular/core';
import { Http, Response } from '@angular/http';
import { Observable } from 'rxjs/Rx';
import { HTTP_PROVIDERS } from '@angular/http';
import { XtermTerminalComponent } from './xterm-terminal/xterm-terminal.component';

@Component({
  selector: 'my-app',
  templateUrl: 'app/app.component.html',
  styleUrls: ['app/app.component.css'],
  providers: [ HTTP_PROVIDERS ],
  directives: [ XtermTerminalComponent ]
})

export class AppComponent implements OnInit {
  instructions: any;
  instructionsArray: any;
  responsesArray: any;
  counter: number = 0;
  response: string;
  shell: string;

  constructor(private http: Http) { }

  ngOnInit() {
    this.getInstructions();
    this.getResponses();
  }

  updateInstructions(step) {
    let totalSteps = this.instructionsArray.length - 1;
    let msg = Math.random();
    if (step === 'next') {
      if (this.counter < totalSteps) {
        this.counter += 1;
      }
      this.response = ' [30mMessage: ' + msg;

    } else if (step === 'prev') {
      if (this.counter > 0) {
        this.counter -= 1;
      }
      this.response = ' [30mMessage: ' + msg;
    }
    this.instructions = this.instructionsArray[this.counter]['_body'];
  }

  evalCommand(command) {
    if (this.shell === 'inspec-shell') {
      this.parseInspecShell(command);
    }
    else if (command.match(/^inspec\s*.*/)) {
      this.parseInspecCommand(command);
    }
    else if (command.match(/^next\s*/)) {
      this.updateInstructions('next');
    }
    else if (command.match(/^prev\s*/)) {
      this.updateInstructions('prev');
    }
    else if (command.match(/^ls\s*/)) {
      this.response = " [37m" + this.responsesArray[1]['_body'];
    }
    else if (command.match(/^pwd\s*/)) {
      this.response = " [37m" + this.responsesArray[2]['_body'];
    }
    else if (command.match(/^cat\s*README.md\s*/i)) {
      this.response = " [37mOnly a few commands are implemented in this terminal.  Please follow the demo";
    }
    else if (command.match(/^less\s*README.md\s*/i)) {
      this.response = " [37mOnly a few commands are implemented in this terminal.  Please follow the demo.";
    }
    else {
      this.response = " [37minvalid command: " + command;
    }
  }

  parseInspecCommand(command) {
    let command_target = command.match(/^inspec\s*(.*)/);
    if (command_target[1] === 'shell') {
      this.shell = 'inspec-shell'
      this.response = " [37m" + 'Welcome to the InSpec Shell\r\n To find out how to use it, type: help\r\n To leave, type: exit';
    }
    else if (command_target[1].match(/^exec\s*.*/)) {
      this.parseInspecExec(command);
    }
    else if (command_target[1].match(/^version\s*/)) {
      this.response = " [37m" + this.responsesArray[4]['_body'];
    }
    else {
      let msg = Math.random();
      this.response = " [37m" + this.responsesArray[0]['_body'] + " [30m" + msg;
    }
  }

  parseInspecExec(command) {
    let target = command.match(/^inspec exec\s*(.*)/);
    if (target[1] === 'examples/profile') {
      this.response = " [37m" + this.responsesArray[3]['_body'];
    } else {
      this.response = " [31m Could not fetch inspec profile in '" + target[1] + "' ";
    }
  }

  parseInspecShell(command) {
    // exit inspec shell
    if (command.match(/^exit\s*/))  {
      this.shell = '';
      this.response = '';
    }
    else if (command.match(/^ls\s*/)) {
      this.response = " [37m" + this.responsesArray[5]['_body'];
    }
    // TODO: functionality for inspec Shell
    else {
      this.response = " [37m" + 'soon this will work, but not yet :) '
    }
  }

  getInstructions() {
    Observable.forkJoin(
        this.http.get('/app/instructions/step0.txt'),
        this.http.get('/app/instructions/step1.txt'),
        this.http.get('/app/instructions/step2.txt')
    ).subscribe(
      data => {
        this.instructionsArray = data;
        this.updateInstructions(0);
      },
      err => console.error(err)
    );
  }

  getResponses() {
    Observable.forkJoin(
        this.http.get('/app/responses/help.txt'), // 0
        this.http.get('/app/responses/ls.txt'), // 1
        this.http.get('/app/responses/pwd.txt'), // 2
        this.http.get('/app/responses/inspec_exec.txt'), // 3
        this.http.get('/app/responses/inspec_version.txt'), // 4
        this.http.get('/app/responses/pwd_inspec_shell.txt') // 5
    ).subscribe(
      data => {
        this.responsesArray = data;
      },
      err => console.error(err)
    );
  }
}

