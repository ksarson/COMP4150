import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';
import { HomeDashboardModule } from './home-dashboard/home-dashboard.module';


const routes: Routes = [];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
