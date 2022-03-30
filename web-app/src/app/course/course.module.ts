import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { CourseDetailsComponent } from './course-details/course-details.component';
import { CourseRoutingModule } from './course-routing.module';
import { MatProgressBarModule } from '@angular/material/progress-bar';
import { MatSortModule } from '@angular/material/sort';
import { MatTableModule } from '@angular/material/table';
import { MatExpansionModule } from '@angular/material/expansion';
import { HistoryTableComponent } from './components/history-table/history-table.component';
import { SectionDetailsComponent } from './components/section-details/section-details.component';
import { SectionTableComponent } from './components/section-table/section-table.component';



@NgModule({
  declarations: [CourseDetailsComponent, HistoryTableComponent, SectionDetailsComponent, SectionTableComponent],
  imports: [
    CourseRoutingModule,
    MatProgressBarModule,
    MatSortModule,
    MatTableModule,
    CommonModule,
    MatExpansionModule
  ]
})
export class CourseModule { }
