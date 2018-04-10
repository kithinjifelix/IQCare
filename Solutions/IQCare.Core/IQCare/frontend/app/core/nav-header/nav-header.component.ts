import { Component, OnInit } from '@angular/core';

@Component({
  selector: 'app-nav-header',
  templateUrl: './nav-header.component.html',
  styleUrls: ['./nav-header.component.css']
})
export class NavHeaderComponent implements OnInit {
    appUserName: string;

    constructor() { }

    ngOnInit() {
        this.appUserName = localStorage.getItem('appUserName');
    }

}
