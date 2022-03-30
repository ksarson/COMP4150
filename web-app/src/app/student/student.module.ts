import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { MatExpansionModule } from '@angular/material/expansion';
import { StudentDetailsComponent } from './student-details/student-details.component';
import { StudentRoutingModule } from './student-routing.module';
import { MatProgressBarModule } from '@angular/material/progress-bar';
import { CourseTableComponent } from './components/course-table/course-table.component';
import { MatSortModule } from '@angular/material/sort';
import { MatTableModule } from '@angular/material/table';


@NgModule({
  declarations: [StudentDetailsComponent, CourseTableComponent],
  imports: [
    StudentRoutingModule,
    MatProgressBarModule,
    MatSortModule,
    MatTableModule,
    CommonModule,
    MatExpansionModule
  ]
})
export class StudentModule { }
