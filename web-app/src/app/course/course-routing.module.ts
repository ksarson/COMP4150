import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';
import { CourseDetailsComponent } from './course-details/course-details.component';


const courseRoutes: Routes = [
  {
    path: 'course/:id',
    component: CourseDetailsComponent,
  }
];

@NgModule({
  imports: [RouterModule.forRoot(courseRoutes)],
  exports: [RouterModule]
})
export class CourseRoutingModule { }
