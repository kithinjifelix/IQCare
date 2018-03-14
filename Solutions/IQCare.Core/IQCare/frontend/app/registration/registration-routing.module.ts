import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';
import {PersonComponent} from './person/person.component';
import {EnrollmentComponent} from './enrollment/enrollment.component';

const routes: Routes = [
    {
        path: '',
        component: PersonComponent,
        pathMatch: 'full',
    },
    {
        path: 'enrollment',
        component: EnrollmentComponent,
        pathMatch: 'full'
    }
];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule]
})
export class RegistrationRoutingModule { }
