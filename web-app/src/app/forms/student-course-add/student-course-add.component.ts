import { Component, OnInit } from '@angular/core';
import { FormGroup, FormBuilder, Validators } from '@angular/forms';
import { StudentService } from 'src/app/service/student.service';
import { MatSnackBar } from '@angular/material';
import { BehaviorSubject } from 'rxjs';
import { BackendService } from 'src/app/service/backend.service';
import { CourseService } from 'src/app/service/course.service';
import { Router } from '@angular/router';

@Component({
  selector: 'app-student-course-add',
  templateUrl: './student-course-add.component.html',
  styleUrls: ['./student-course-add.component.scss']
})
export class StudentCourseAddComponent implements OnInit {
  isLinear = false;
  firstFormGroup: FormGroup;
  secondFormGroup: FormGroup;
  studentList$ = new BehaviorSubject<any>([]);
  courseList$ = new BehaviorSubject<any>([]);
  sectionList$ = new BehaviorSubject<any>([]);
  selectedStudent = null;
  studentCourses = [];
  departmentOptions = new Map<string, string>([
    ['Business', 'BU'],
    ['Chemistry', 'CH'],
    ['Computer Science', 'CS'],
    ['Engineering', 'EN']
  ]);

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
      this.studentList$.next(
        resp.data.sort((a, b) => {
          if (a.last_name < b.last_name) {
            return -1;
          } else {
            return 1;
          }
        })
      );
    });
    this.courseService.getAllCourses().subscribe(resp => {
      this.courseList$.next(resp.data);
    });
    this.firstFormGroup = this._formBuilder.group({
      firstName: [{ value: '', disabled: true }, Validators.required],
      lastName: [{ value: '', disabled: true }, Validators.required],
      selectStudent: ['']
    });
    this.secondFormGroup = this._formBuilder.group({
      course: [''],
      section: ['']
    });

    this.firstFormGroup.get('selectStudent').valueChanges.subscribe(val => {
      this.selectedStudent = val;
      this.firstFormGroup.get('firstName').setValue(val.first_name);
      this.firstFormGroup.get('lastName').setValue(val.last_name);

      this.studentService
        .getStudentCourses(this.selectedStudent.student_id)
        .subscribe(resp => {
          this.studentCourses = resp.data;
        });
    });

    this.secondFormGroup.get('course').valueChanges.subscribe(val => {
      this.courseService.getAllSectionsByCourse(val.course_id).subscribe(resp => {
        this.sectionList$.next(resp.data);
      });
    });
  }

  generateEmail() {
    return (
      this.firstFormGroup.get('firstName').value[0] +
      this.firstFormGroup.get('lastName').value +
      '@uwindsor.ca'
    );
  }

  submit() {
    this.studentService
      .addCourse({
        sectionRec: this.secondFormGroup.get('section').value.section_rec,
        studentId: this.firstFormGroup.get('selectStudent').value.student_id,
      })
      .subscribe(resp => {
        if (resp) {
          this.openSnackBar('Sucess! The student has been added to the section', 'Close');
        }
      });
  }

  openSnackBar(message: string, action: string) {
    this._snackBar.open(message, action, {
      duration: 2000
    });
  }

  checkCourse(course) {
    let flag = false;
    this.studentCourses.forEach(sCourse => {
      if (sCourse.course_id === course.course_id) {
        flag = true;
        return;
      }
    });
    return flag;
  }

  openStudent() {
    this.router.navigate([`/student`, this.firstFormGroup.get('selectStudent').value.student_id]);
  }
}
