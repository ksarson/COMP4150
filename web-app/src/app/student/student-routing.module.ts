import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';
import { StudentDetailsComponent } from './student-details/student-details.component';


const studentRoutes: Routes = [
  {
    path: 'student/:id',
    component: StudentDetailsComponent,
  }
];

@NgModule({
  imports: [RouterModule.forRoot(studentRoutes)],
  exports: [RouterModule]
})
export class StudentRoutingModule { }
