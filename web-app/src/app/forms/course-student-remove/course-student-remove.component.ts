import { Component, OnInit } from '@angular/core';
import { FormGroup, FormBuilder, Validators } from '@angular/forms';
import { MatSnackBar } from '@angular/material';
import { CourseService } from 'src/app/service/course.service';
import { BehaviorSubject } from 'rxjs';

@Component({
  selector: 'app-course-student-remove',
  templateUrl: './course-student-remove.component.html',
  styleUrls: ['./course-student-remove.component.scss']
})
export class CourseStudentRemoveComponent implements OnInit {
  isLinear = false;
  firstFormGroup: FormGroup;
  secondFormGroup: FormGroup;
  courseList$ = new BehaviorSubject<any>([]);
  sectionList$ = new BehaviorSubject<any>([]);
  classList$ = new BehaviorSubject<any>([]);

  constructor(
    private _formBuilder: FormBuilder,
    private courseService: CourseService,
    private _snackBar: MatSnackBar
  ) {}

  ngOnInit() {
    this.courseService.getAllCourses().subscribe(resp => {
      this.courseList$.next(resp.data);
    });

    this.firstFormGroup = this._formBuilder.group({
      selectCourse: ['', Validators.required],
      selectSection: ['', Validators.required]
    });

    this.firstFormGroup.get('selectCourse').valueChanges.subscribe(course => {
      this.courseService
        .getAllSectionsByCourse(course.course_id)
        .subscribe(resp => {
          this.sectionList$.next(resp.data);
        });
    });

    this.firstFormGroup.get('selectSection').valueChanges.subscribe(section => {
      this.courseService.getSectionById(section.section_rec).subscribe(resp => {
        this.classList$.next(
          resp.data.sort((a, b) => {
            if (a.last_name < b.last_name) {
              return -1;
            } else {
              return 1;
            }
          })
        );
      });
    });

    this.secondFormGroup = this._formBuilder.group({
      selectStudent: ['', Validators.required],
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
    this.courseService
      .dropStudentInSection({
        studentId: this.secondFormGroup.get('selectStudent').value.student_id,
        secRec: this.firstFormGroup.get('selectSection').value.section_rec,
      })
      .subscribe(resp => {
        if (resp) {
          this.openSnackBar('Sucess! The student has been added', 'Close');
        }
      });
  }

  openSnackBar(message: string, action: string) {
    this._snackBar.open(message, action, {
      duration: 2000
    });
  }
}
