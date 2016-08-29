import { Component, OnInit, Input, Output, EventEmitter } from '@angular/core';
declare var Terminal: any;

@Component({
  selector: 'xterm-terminal',
  templateUrl: 'app/xterm-terminal/xterm-terminal.component.html',
  styleUrls: ['app/xterm-terminal/xterm-terminal.component.css']
})
export class XtermTerminalComponent implements OnInit {
  @Input() responsesArray: any;
  @Output() stepNumber: EventEmitter<number> = new EventEmitter<number>();
  step: number = 0;
  shellprompt: string;
  buffer: string = '';
  terminalContainer: any;
  term: any;
  optionElements: any;
  cols: any;
  rows: any;

 ngOnInit() {
    this.terminalContainer = document.getElementById('terminal-container'),
    this.optionElements = {
      cursorBlink: document.querySelector('#option-cursor-blink')
    },
    this.cols = '70',
    this.rows = '70';
    this.createTerminal();
  }

  createTerminal() {
    while (this.terminalContainer.children.length) {
      this.terminalContainer.removeChild(this.terminalContainer.children[0]);
    }
    this.term = new Terminal({
      cursorBlink: true
    });

    this.term.open(this.terminalContainer);
    this.term.fit();

    var initialGeometry = this.term.proposeGeometry(),
      cols = initialGeometry.cols,
      rows = initialGeometry.rows;

    this.cols = cols;
    this.rows = rows;
    this.runFakeTerminal()
  }

  runFakeTerminal() {
    if (this.term._initialized) {
      return;
    }

    this.term._initialized = true;
    this.setPrompt();

    this.term.writeln('WELCOME TO YOUR INSPEC DEMO SHELL FOOL!');
    this.term.writeln('');
    this.setPrompt();
  }

  setPrompt() {
    this.buffer = ''
    this.shellprompt = '$ ';
    this.term.write('\r\n' + this.shellprompt);
  }

  setInspecShellPrompt() {
    this.term.write('\r\ninspec> ');
    this.setPrompt();
  }

  onKey(ev) {
    var shell = null
    var printable = (!ev.altKey && !ev.altGraphKey && !ev.ctrlKey && !ev.metaKey)

    // on enter, check buffer and print response
    if (ev.keyCode == 13) {
      this.term.write('\r\n');

      // play with inspec shell
      if (this.buffer == 'inspec shell') {
        shell = 'inspec-shell'
        this.term.writeln('Welcome to the interactive InSpec Shell');
        this.term.writeln('To find out how to use it, type: help')
        this.setInspecShellPrompt();
      }

      // exit inspec shell
      if (this.buffer == 'exit' && shell == 'inspec-shell' ) {
        shell = null
        this.setPrompt();
      }

      // TODO: functionality for inspec shell
      if (shell == 'inspec-shell') {
        if (this.buffer == 'os.params') {
          this.term.writeln('print file content for shell');
        }

      } else {
        // match on various commands or print inspec help
        if (this.buffer.match(/^inspec\s*exec\s*.*/)) {
          this.parseInspecExec(this.buffer);
        }
        else if (this.buffer.match(/^inspec\s*version\s*/)) {
          this.term.writeln(this.responsesArray[4]['_body']);
          this.setPrompt();
        }
        else if (this.buffer.match(/^next\s*/)) {
          this.step += 1;
          this.stepNumber.emit(this.step);
          this.setPrompt();
        }
        else if (this.buffer.match(/^previous\s*/)) {
          this.step -= 1;
          this.stepNumber.emit(this.step);
          this.setPrompt();
        }
        else {
          this.term.writeln(this.responsesArray[0]['_body']);
          this.setPrompt();
        }
      }

    // on backspace, pop characters from buffer
    } else if (ev.keyCode == 8) {
      if (this.term.x > 2) {
        this.buffer = this.buffer.substr(0, this.buffer.length-1)
        this.term.write('\b \b');
      }
    } else if (printable) {
      this.term.write(ev.key);
      this.buffer += ev.key;
    }
  }

  parseInspecExec(value) {
    let target = value.match(/^inspec exec\s*(.*)/);
    if (target[1] === 'examples/profile') {
      this.term.writeln(this.responsesArray[3]['_body']);
      this.setPrompt();
    } else {
      this.term.writeln("Could not fetch inspec profile in '" + target[1] + "' ");
      this.setPrompt();
    }
  }
}
