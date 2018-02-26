import {
  Component,
  OnInit,
  OnChanges,
  Input,
  Output,
  EventEmitter,
  SimpleChange
} from '@angular/core';
declare var Terminal: any;

@Component({
  selector: 'xterm-terminal',
  templateUrl: 'app/xterm-terminal/xterm-terminal.component.html',
  styleUrls: ['app/xterm-terminal/xterm-terminal.component.css']
})
export class XtermTerminalComponent implements OnInit, OnChanges{

  // This Xterm implementation emits all commands, once the users presses 'Enter'
  @Output() stdin: EventEmitter<string> = new EventEmitter<string>();
  // waits for events that should be printed on the terminal
  @Input() stdout: EventEmitter<string>;
  // sets the shell prompt
  @Input() prompt: string;

  // handle up/down command history functionality
  history: any = [];
  historyIndex: number;
  last: number;

  // caches stdin, until the user presses Enter
  buffer: string = '';

  // xterm variables
  terminalContainer: any;
  term: any;
  optionElements: any;
  cols: string;
  rows: string;

  // we cannot use \33[2K\r since strict mode recognize it as ocal number
  clearLine = "\u001b[2K\r"

  ngOnInit() {
    // set up Xterm terminal (https://github.com/sourcelair/xterm.js)
    this.terminalContainer = document.getElementById('terminal-container');
    this.initializeTerminal();
  }

  ngOnChanges(changes: {[propKey: string]: SimpleChange}) {
    let log: string[] = [];
    for (let propName in changes) {
      let changedProp = changes[propName];
      // reprint prompt
      if (propName == 'prompt' && this.term != null) {
        this.term.write(this.clearLine+this.prompt)
      }
    }
  }

  onResize(event) {
    this.updateTerminalSize()
  }

  updateTerminalSize() {
    // recalculate cols and rows
    let charwidth = 30;
    // read size from parent wrapping element
    let cols = 80
    let rows = Math.floor(this.terminalContainer.parentElement.clientHeight / charwidth)
    this.term.resize(cols, rows);
  }

  // create Xterm terminal (https://github.com/sourcelair/xterm.js)
  initializeTerminal() {
    while (this.terminalContainer.children.length) {
      this.terminalContainer.removeChild(this.terminalContainer.children[0]);
    }
    this.term = new Terminal({
      cursorBlink: true,
    });

    this.term.open(this.terminalContainer);
    this.term.fit();

    // start registering the event listener, only need to be done the first time
    if (this.term._initialized) {
      return;
    }
    this.term._initialized = true;
    this.writePrompt();

    let self = this
    // raw data
    this.term.on('data', function(data){
      self.writeBuffer(data)
    })

    // overwrite keydown handler to be able to customize cursor handling
    this.term.attachCustomKeydownHandler(function(ev){
      return self.keydown(ev);
    })

    // handle stream events from the app
    this.stdout.subscribe(function(data) {
      self.onStdout(data)
    }, function(err) {
      console.error(err)
    })

    // determine rows for terminal
    this.updateTerminalSize()

    // TODO: hack, find a better way
    // this allows outside tiggers via
    // window.dispatchEvent(new Event('resizeTerminal'));
    window.addEventListener('resizeTerminal', function (e) {
      self.updateTerminalSize();
    }, false);
  }

  // this writes the raw buffer and includes invisible charaters
  writeBuffer(data) {
    this.term.write(data);
    this.buffer += data;
  }

  // reset the command buffer
  resetBuffer() {
    this.buffer = ''
  }

  // print out stdout data
  onStdout(data) {
    let res = data
    this.term.write(res);
  }

  // print out error
  onStderr(response) {
    this.term.writeln(response);
  }

  // writes the command prompt, a prompt is not part of the input buffer
  writePrompt() {
    this.term.write(this.prompt);
  }

  // stores a command in commmand history
  storeInHistory(cmd) {
    // remove cariage returns from history commands
    cmd = cmd.replace(/\r/,'');
    this.history.push(cmd);
    this.historyIndex = this.history.length
  }

  // prints the current selected command at history index
  historyCmdtoStdout() {
    this.buffer = this.history[this.historyIndex]
    this.reprintCommand(this.buffer )
  }

  // reprint a command in the current line
  reprintCommand(cmd){
    // strip out any extra \r characters
    cmd = cmd.replace(/\r/g,'');
    this.term.write(this.clearLine + this.prompt + cmd);
  }

  // resets the terminal
  clear() {
    this.term.reset();
    this.writePrompt();
  }

  // terminal event handler
  // be aware that we need to decouple the event loops, therefore we need to
  // use setTimeout to reliable print content on the terminal
  keydown(ev) {
    // console.log(ev);
    let self = this
    if (ev.keyCode === 13) {
      let cmd = self.buffer
      // special handling for clear and cls
      if (/^\s*clear|cls\s*/.exec(cmd) != null) {
        // reset terminal
        setTimeout(function(){
          self.clear()
        }, 0);
      } else {
        // decouple from event loop, write a new line
        setTimeout(function(){
          self.term.writeln('')
          self.stdin.emit(cmd);
          self.storeInHistory(cmd)
        }, 0);
      }
      // reset index to last item +1
      self.resetBuffer()
    }
    // on backspace, pop characters from buffer
    else if (ev.keyCode == 8) {
      self.buffer = self.buffer.substr(0, self.buffer.length-1);
      setTimeout(function(){
        self.reprintCommand(self.buffer)
      }, 0);
    }
    // press the up key, find previous item in cmd history
    else if (ev.keyCode === 40) {
      setTimeout(function(){
        if (self.historyIndex < self.history.length - 1) {
          self.historyIndex += 1
          self.historyCmdtoStdout()
        }
      }, 0);

    }
    // press the down key, find next item in cmd history
    else if (ev.keyCode === 38) {
      setTimeout(function(){
        if (self.historyIndex >= 1) {
          self.historyIndex -= 1
          self.historyCmdtoStdout()
        }
      }, 0);
    }
    // this forces xterm not to handle the key events with its own event handler
    return false;
  }
}
