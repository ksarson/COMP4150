import { Component, OnInit } from '@angular/core';
import { FormGroup, FormBuilder, Validators } from '@angular/forms';
import { BehaviorSubject } from 'rxjs';
import { CourseService } from 'src/app/service/course.service';
import { MatSnackBar } from '@angular/material';
import { ProfessorService } from 'src/app/service/professor.service';
import { Router } from '@angular/router';

@Component({
  selector: 'app-professor-section-add',
  templateUrl: './professor-section-add.component.html',
  styleUrls: ['./professor-section-add.component.scss']
})
export class ProfessorSectionAddComponent implements OnInit {
  isLinear = false;
  firstFormGroup: FormGroup;
  secondFormGroup: FormGroup;
  courseList$ = new BehaviorSubject<any>([]);
  sectionList$ = new BehaviorSubject<any>([]);
  professorList$ = new BehaviorSubject<any>([]);

  constructor(
    private _formBuilder: FormBuilder,
    private courseService: CourseService,
    private professorService: ProfessorService,
    private router: Router,
    private _snackBar: MatSnackBar
  ) { }

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

    this.professorService.getAllProfessors().subscribe(resp => {
      this.professorList$.next(
        resp.data.sort((a, b) => {
          if (a.last_name < b.last_name) {
            return -1;
          } else {
            return 1;
          }
        })
      );
    })

    this.secondFormGroup = this._formBuilder.group({
      selectProfessor: ['', Validators.required],
    });
  }

  submit() {
    this.courseService
      .addProfessorToSection({
        profId: this.secondFormGroup.get('selectProfessor').value.professor_id,
        secRec: this.firstFormGroup.get('selectSection').value.section_rec,
      })
      .subscribe(resp => {
        if (resp) {
          this.openSnackBar('Success! The professor has been assigned', 'Close');
        }
      });
  }

  openSnackBar(message: string, action: string) {
    this._snackBar.open(message, action, {
      duration: 2500
    });
  }

  navigate() {
    this.router.navigate(['/course', this.firstFormGroup.get('selectSection').value.course_id]);
  }

  checkProfessor(prof) {
    const section = this.firstFormGroup.get('selectSection').value;
    return prof.department_id !== section.department_id;
  }
}
