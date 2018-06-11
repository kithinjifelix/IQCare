import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';
import { NotFoundComponent } from './not-found/not-found.component';

const routes: Routes = [
    {
        path: '',
        redirectTo: 'registration',
        pathMatch: 'full'
    },
    {
        path: 'hts',
        loadChildren: '../hts/hts.module#HtsModule'
    },
    {
        path: 'registration',
        loadChildren: '../registration/registration.module#RegistrationModule'
    },
    {
        path: 'recordregistration',
        loadChildren:'../records/records.module#RecordModule'
    },
    {
        path: '**',
        component: NotFoundComponent
    }



];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class CoreRoutingModule { }
