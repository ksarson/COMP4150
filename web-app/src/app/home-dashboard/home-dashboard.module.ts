import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { HomeComponent } from './home/home.component';
import { HomeRoutingModule } from './home-routing.module';
import {MatTableModule} from '@angular/material/table';
import {MatProgressBarModule} from '@angular/material/progress-bar';
import { StudentTableComponent } from './components/student-table/student-table.component';
import { MatSortModule } from '@angular/material/sort';
import { CourseTableComponent } from './components/course-table/course-table.component';
import { ProfessorTableComponent } from './components/professor-table/professor-table.component';

@NgModule({
  declarations: [HomeComponent, StudentTableComponent, CourseTableComponent, ProfessorTableComponent],
  imports: [
    HomeRoutingModule,
    MatProgressBarModule,
    MatSortModule,
    MatTableModule,
    CommonModule
  ]
})
export class HomeDashboardModule { }
