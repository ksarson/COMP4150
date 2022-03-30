import { Component, OnInit } from '@angular/core';
import { FormGroup, FormBuilder, Validators } from '@angular/forms';
import { BehaviorSubject } from 'rxjs';
import { BackendService } from 'src/app/service/backend.service';
import { StudentService } from 'src/app/service/student.service';
import { CourseService } from 'src/app/service/course.service';
import { Router } from '@angular/router';
import { MatSnackBar } from '@angular/material';

@Component({
  selector: 'app-student-grade-update',
  templateUrl: './student-grade-update.component.html',
  styleUrls: ['./student-grade-update.component.scss']
})
export class StudentGradeUpdateComponent implements OnInit {
  isLinear = false;
  firstFormGroup: FormGroup;
  secondFormGroup: FormGroup;
  thirdFormGroup: FormGroup;
  studentList$ = new BehaviorSubject<any>([]);
  courseList$ = new BehaviorSubject<any>([]);
  selectedStudent = null;
  studentCourses = [];

  constructor(
    private _formBuilder: FormBuilder,
    private backendService: BackendService,
    private studentService: StudentService,
    private courseService: CourseService,
    private router: Router,
    private _snackBar: MatSnackBar
  ) {}

  ngOnInit() {
    this.backendService.getStudents().subscribe(resp => {
      this.studentList$.next(resp.data);
    });
    this.firstFormGroup = this._formBuilder.group({
      firstName: [{ value: '', disabled: true }, Validators.required],
      lastName: [{ value: '', disabled: true }, Validators.required],
      selectStudent: ['']
    });
    this.secondFormGroup = this._formBuilder.group({
      course: ['']
    });
    this.thirdFormGroup = this._formBuilder.group({
      grade: ['']
    });

    this.firstFormGroup.get('selectStudent').valueChanges.subscribe(val => {
      this.selectedStudent = val;
      this.firstFormGroup.get('firstName').setValue(val.first_name);
      this.firstFormGroup.get('lastName').setValue(val.last_name);

      this.studentService
        .getStudentCourses(this.selectedStudent.student_id)
        .subscribe(resp => {
          console.log(resp.data);
          this.studentCourses = resp.data;
        });
    });
  }

  submit() {
    this.studentService
      .updateGrade({
        studentId: this.firstFormGroup.get('selectStudent').value.student_id,
        recId: this.secondFormGroup.get('course').value.record_id,
        newGrade: this.thirdFormGroup.get('grade').value
      })
      .subscribe(resp => {
        if (resp) {
          this.openSnackBar(
            'Sucess! The student has been added to the section',
            'Close'
          );
        }
      });
  }

  openSnackBar(message: string, action: string) {
    this._snackBar.open(message, action, {
      duration: 2000
    });
  }

  openStudent() {
    this.router.navigate([
      `/student`,
      this.firstFormGroup.get('selectStudent').value.student_id
    ]);
  }

  checkCourse(course) {
    return course.semester === 'F' && course.year === 2019;
  }
}
