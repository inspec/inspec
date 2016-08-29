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
  counter: number;

  constructor(private http: Http) { }

  ngOnInit() {
    this.getInstructions();
    this.getResponses();
  }

  updateInstructions(step) {
    if (step < 0) {
      step = 0
    }
    this.counter = step;
    this.instructions = this.instructionsArray[step]['_body'];
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
        this.http.get('/app/responses/inspec_version.txt') // 4
    ).subscribe(
      data => {
        this.responsesArray = data;
      },
      err => console.error(err)
    );
  }
}

