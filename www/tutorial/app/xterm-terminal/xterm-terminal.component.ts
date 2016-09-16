import { Component, OnInit, Input, Output, EventEmitter, SimpleChange } from '@angular/core';
declare var Terminal: any;

@Component({
  selector: 'xterm-terminal',
  templateUrl: 'app/xterm-terminal/xterm-terminal.component.html',
  styleUrls: ['app/xterm-terminal/xterm-terminal.component.css']
})
export class XtermTerminalComponent implements OnInit {
  @Input() response: string;
  @Input() shell: string;
  @Output() command: EventEmitter<string> = new EventEmitter<string>();

  // handle up/down arrow functionality
  previousCommands: any = [];
  poppedCommands: any = [];
  last: number;

  // handle user input
  buffer: string = ''; // the buffer is our string of user input
  blockCmd: string = ''; // handle describe and control blocks

  // xterm variables
  terminalContainer: any;
  term: any;
  optionElements: any;
  cols: string;
  rows: string;

  ngOnInit() {
    // set up Xterm terminal (https://github.com/sourcelair/xterm.js)
    this.terminalContainer = document.getElementById('terminal-container');
    this.cols = '70';
    this.rows = '70';
    this.createTerminal();
   }

  // watch for changes on the value of response and call printResponse
  ngOnChanges(changes: {[propertyName: string]: SimpleChange}) {
    if (changes['response'] && this.term) {
      let currentResponse = changes['response'].currentValue;
      this.printResponse(currentResponse);
    }
  }

  // create Xterm terminal (https://github.com/sourcelair/xterm.js)
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

  // more Xterm terminal stuff. we're faking it. faking it can be a good thing ;)
  runFakeTerminal() {
    if (this.term._initialized) {
      return;
    }
    this.term._initialized = true;
    this.setPrompt();
  }

  // if the response matches the special message we send when the user
  // has entered 'next' or 'prev' (to navigate through the demo)
  // then no need to print the response, just set the prompt. otherwise,
  // print response and set prompt
  printResponse(response) {
    if (response.match(/.30mnext|.30mprev|.30mlast/)) {
      // call createTerminal to clear terminal screen on next and prev
      this.createTerminal();
    } else {
      this.term.writeln(response);
      this.setPrompt();
    }
  }

  // the value of shell is taken as an input. the default
  // shellprompt is displayed unless shell is set to 'inspec-shell'
  setPrompt() {
    this.buffer = '';
    if (this.shell === 'inspec-shell') {
      if (this.blockCmd != '') {
        this.term.write(' [32minspec>*'); // green inspec shell prompt with * to denote multi-line command
      } else {
        this.term.write(' [32minspec> '); // green inspec shell prompt
      }
    } else {
      this.term.write('[36m$ '); // blue regular shell prompt
    }
  }

  // delete everything on the line
  deleteCharacters() {
    // don't delete the prompt
    let letters = this.term.x - 2;
    for (var i = 0; i < letters; i++) {
      this.term.write('\b \b');
    }
  }

  // keydown calls handleDelete to check if the user is holding down the backpace key
  // TODO: make this work! the backspace event isn't coming in for some reason :(
  handleDelete(ev) {
    if (ev.keyCode == 8) {
      this.deleteCharacters();
    }
  }

  // handle describe and control blocks. if the command entered matches the
  // syntax we would generally expect in a control/describe block, then we
  // wait to have the whole string command (as marked by 'end' for a simple describe
  // block and end end for a control block) and emit that
  handleBlockCommand(buffer) {
    this.blockCmd += buffer + '';
    if (this.blockCmd.match(/^control/)) {
      if (this.blockCmd.match(/end.*end.*/)) {
        this.command.emit(this.blockCmd);
        this.blockCmd = '';
      } else {
        this.setPrompt();
      }
    } else {
      if (buffer.match(/^end$/)) {
        this.command.emit(this.blockCmd);
        this.blockCmd = '';
      } else {
        this.setPrompt();
      }
    }
  }

  // onKey will check if the character is printable (on keyup) and add it to the buffer. if the enter key is hit
  // the value of the buffer is emitted as 'command'.  onKey also supports proper backspace handling and
  // the ability to up-arrow through previous commands/down arrow back through them.
  onKey(ev) {
    var shell = null
    // determine if the character is a printable one
    var printable = ['Alt', 'Control', 'Meta', 'Shift', 'CapsLock', 'Tab', 'Escape', 'ArrowLeft', 'ArrowRight'].indexOf(ev.key) == -1

    // on enter, save command to array and send current value of buffer
    // to parent component (app)
    if (ev.keyCode == 13) {
      if ((this.buffer === 'clear') || (this.buffer === 'cls')) {
        this.createTerminal();
      } else {
        this.previousCommands.push(this.buffer);
        this.term.write('\r\n');
        if (this.shell === 'inspec-shell') {
          // if the command entered matches any of the typical describe and
          // control blocks, then we call handleBlockCommand to not emit the
          // value until we have the whole multi-line command
          if (this.buffer.match(/^describe.*|^it.*|^end$|^impact.*|^title.*|^control.*/)) {
            this.handleBlockCommand(this.buffer);
          } else {this.command.emit(this.buffer);}
        } else {
          this.command.emit(this.buffer);
        }
      }
    }
    // on backspace, pop characters from buffer
    else if (ev.keyCode == 8) {
      // if inspec shell is being used, this needs to be set to 9 to account for the extra letters
      if (this.shell === 'inspec-shell') {
        if (this.term.x > 8) {
          this.buffer = this.buffer.substr(0, this.buffer.length-1);
          this.term.write('\b \b');
        }
      } else {
        // setting the value here to 3 ensures that we don't delete the promp '$' or the space after it
        if (this.term.x > 2) {
          this.buffer = this.buffer.substr(0, this.buffer.length-1);
          this.term.write('\b \b');
        }
      }
    }
    // on up arrow, delete anything on line, print previous command
    // and push last to poppedCommands
    else if (ev.keyCode === 38) {
      let last;
      this.buffer = '';
      if (this.previousCommands.length > 0) {
        last = this.previousCommands.pop();
        this.poppedCommands.push(last);
      } else {
        last = '';
      }
      this.deleteCharacters();
      this.buffer = last;
      this.term.write(last);
    }
    // on down arrow, delete anything on line, print last item from poppedCommands
    // and push previous to previousCommands
    else if (ev.keyCode === 40) {
      let previous;
      this.buffer = '';
      if (this.poppedCommands.length > 0) {
        previous = this.poppedCommands.pop();
        this.previousCommands.push(previous);
      } else {
        previous = '';
      }
      this.deleteCharacters();
      this.buffer = previous;
      this.term.write(previous);
    }
    // if the character is printable and none of the event key codes from above were matched
    // then we write the character on the prompt line and add the character to the buffer
    else if (printable) {
      this.term.write(ev.key);
      this.buffer += ev.key;
    }
  }
}
