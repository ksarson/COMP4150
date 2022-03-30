import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { StudentAddComponent } from './student-add/student-add.component';
import { FormsRoutingModule } from './forms-routing.module';
import { MatStepperModule } from '@angular/material/stepper';
import { MatFormFieldModule, MatInputModule, MatButtonModule, MatSelectModule, MatSnackBarModule } from '@angular/material';
import { ReactiveFormsModule, FormsModule } from '@angular/forms';
import { StudentCourseAddComponent } from './student-course-add/student-course-add.component';
import { StudentGradeUpdateComponent } from './student-grade-update/student-grade-update.component';
import { CourseStudentRemoveComponent } from './course-student-remove/course-student-remove.component';
import { SectionAddComponent } from './section-add/section-add.component';
import { SectionCurveComponent } from './section-curve/section-curve.component';
import { ProfessorSectionAddComponent } from './professor-section-add/professor-section-add.component';
import { ProfessorAddComponent } from './professor-add/professor-add.component';

@NgModule({
  declarations: [StudentAddComponent, StudentCourseAddComponent, StudentGradeUpdateComponent, CourseStudentRemoveComponent, SectionAddComponent, SectionCurveComponent, ProfessorSectionAddComponent, ProfessorAddComponent],
  imports: [
    FormsRoutingModule,
    CommonModule,
    MatStepperModule,
    ReactiveFormsModule,
    FormsModule,
    MatFormFieldModule,
    MatInputModule,
    MatButtonModule,
    MatSelectModule,
    MatSnackBarModule
  ]
})
export class AppFormsModule {}
