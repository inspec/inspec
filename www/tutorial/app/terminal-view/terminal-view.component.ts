import { Component, Input, Output, EventEmitter } from '@angular/core';

@Component({
  selector: 'terminal-view',
  templateUrl: 'app/terminal-view/terminal-view.component.html',
  styleUrls: [ 'app/terminal-view/terminal-view.component.css' ]
})
export class TerminalViewComponent {
  @Input() responsesArray: any;
  @Output() stepCounter: EventEmitter<number> = new EventEmitter<number>();
  response: any;
  step: number = 0;

  evalInput(value) {
    if (value.match(/^next\s*/)) {
      this.step += 1;
      // TODO: fix this!!!
      this.stepCounter.emit(this.step);
    }
    else if (value.match(/^ls\s*/)) {
      this.response = this.responsesArray[1]['_body'];
    }
    else if (value.match(/^pwd\s*/)) {
      this.response = this.responsesArray[2]['_body'];
    }
    else if (value.match(/^inspec exec\s*(.*)/)) {
      this.parseInspecExec(value);
    }
    else if (value.match(/^inspec\s*version\s*/)) {
      this.response = this.responsesArray[4]['_body'];
    }
    else {
      this.response = this.responsesArray[0]['_body'];
    }
  }

  parseInspecExec(value) {
    let target = value.match(/^inspec exec\s*(.*)/);
    if (target === 'examples/profile') {
      this.response = this.responsesArray[3]['_body'];
    } else {
      this.response = "Could not fetch inspec profile in '" + target[1] + "' ";
    }
  }
}