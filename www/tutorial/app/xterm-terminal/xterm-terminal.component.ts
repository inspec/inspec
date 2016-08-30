import { Component, OnInit, Input, Output, EventEmitter, SimpleChange } from '@angular/core';
declare var Terminal: any;

@Component({
  selector: 'xterm-terminal',
  templateUrl: 'app/xterm-terminal/xterm-terminal.component.html',
  styleUrls: ['app/xterm-terminal/xterm-terminal.component.css']
})
export class XtermTerminalComponent implements OnInit {
  @Input() response: string;
  @Input() responsesArray: any;
  @Input() shell: string;
  @Output() command: EventEmitter<string> = new EventEmitter<string>();
  previousCommands: any = [];
  last: number;
  currentResponse: string;
  shellStatus: string;
  buffer: string = '';

  // xterm variables
  terminalContainer: any;
  term: any;
  optionElements: any;
  cols: string;
  rows: string;
  shellprompt: string = '$ ';


 ngOnInit() {
    this.terminalContainer = document.getElementById('terminal-container'),
    this.optionElements = {
      cursorBlink: true
    },
    this.cols = '70',
    this.rows = '70';
    this.createTerminal();
  }

  ngOnChanges(changes: {[propertyName: string]: SimpleChange}) {
    if (changes['response'] && this.term) {
      this.currentResponse = changes['response'].currentValue;
      this.term.writeln(this.currentResponse);
      this.setPrompt();
    }
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
  }

  setPrompt() {
    this.buffer = '';
    if (this.shell === 'inspec-shell') {
      this.term.write('\r\ninspec> ');
    } else {
      this.term.write('\r\n' + this.shellprompt);
    }
  }

  onKey(ev) {
    var shell = null
    var printable = ['Alt', 'Control', 'Meta', 'Shift', 'CapsLock', 'Tab', 'Escape'].indexOf(ev.key) == -1

    // on enter, save command to array and send current value of buffer
    // to parent component (app).  if the command is the same as the previous command
    // entered, we just diplay the currentResponse. the reason this is being done here and
    // not in the app component is because the ngOnChanges that tracks the value of the
    // emitted event won't recognize that there has been a change if it is the same
    if (ev.keyCode == 13) {
      this.previousCommands.push(this.buffer);
      this.term.write('\r\n');
      if (this.previousCommands.length > 1) {
        this.last = this.previousCommands.length - 2
      }
      if (this.buffer === this.previousCommands[this.last]) {
        this.term.writeln(this.currentResponse);
        this.setPrompt();
      }
      else {
        this.command.emit(this.buffer);
      }
    }
    // on backspace, pop characters from buffer
    else if (ev.keyCode == 8) {
      if (this.term.x > 2) {
        this.buffer = this.buffer.substr(0, this.buffer.length-1);
        this.term.write('\b \b');
      }
    }
    // on up arrow, delete anything on line and print previous command
    else if (ev.keyCode === 38) {
      let last;
      if (this.previousCommands.length > 0) {
        last = this.previousCommands.pop();
      } else {
        last = '';
      }
      let letters = this.term.x - 2;
      for (var i = 0; i < letters; i++) {
        this.term.write('\b \b');
      }
      this.term.write(last);
    }
    // write each character on prompt line
    else if (printable) {
      this.term.write(ev.key);
      this.buffer += ev.key;
    }
  }
}
