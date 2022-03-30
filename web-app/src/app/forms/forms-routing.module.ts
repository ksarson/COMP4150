import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';
import { StudentAddComponent } from './student-add/student-add.component';
import { StudentCourseAddComponent } from './student-course-add/student-course-add.component';
import { StudentGradeUpdateComponent } from './student-grade-update/student-grade-update.component';
import { CourseStudentRemoveComponent } from './course-student-remove/course-student-remove.component';
import { SectionAddComponent } from './section-add/section-add.component';
import { SectionCurveComponent } from './section-curve/section-curve.component';
import { ProfessorSectionAddComponent } from './professor-section-add/professor-section-add.component';
import { ProfessorAddComponent } from './professor-add/professor-add.component';


const formsModule: Routes = [
  {
    path: 'forms/add/student',
    component: StudentAddComponent,
  },
  {
    path: 'forms/add/professor',
    component: ProfessorAddComponent,
  },
  {
    path: 'forms/add/section',
    component: SectionAddComponent,
  },
  {
    path: 'forms/add/student-to-course',
    component: StudentCourseAddComponent,
  },
  {
    path: 'forms/update/student-grade',
    component: StudentGradeUpdateComponent,
  },
  {
    path: 'forms/update/section-students',
    component: CourseStudentRemoveComponent,
  },
  {
    path: 'forms/update/section-curve',
    component: SectionCurveComponent
  },
  {
    path: 'forms/update/prof-section-add',
    component: ProfessorSectionAddComponent
  }
];

@NgModule({
  imports: [RouterModule.forRoot(formsModule)],
  exports: [RouterModule]
})
export class FormsRoutingModule { }
