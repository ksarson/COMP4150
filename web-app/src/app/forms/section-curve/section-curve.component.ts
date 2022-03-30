import { Component, OnInit } from '@angular/core';
import { FormGroup, FormBuilder, Validators } from '@angular/forms';
import { BehaviorSubject } from 'rxjs';
import { CourseService } from 'src/app/service/course.service';
import { ProfessorService } from 'src/app/service/professor.service';
import { RoomService } from 'src/app/service/room.service';
import { MatSnackBar } from '@angular/material';
import { Router } from '@angular/router';

@Component({
  selector: 'app-section-curve',
  templateUrl: './section-curve.component.html',
  styleUrls: ['./section-curve.component.scss']
})
export class SectionCurveComponent implements OnInit {
  isLinear = true;
  firstFormGroup: FormGroup;
  secondFormGroup: FormGroup;
  thirdFormGroup: FormGroup;
  courseList$ = new BehaviorSubject<any>([]);
  sectionList$ = new BehaviorSubject<any>([]);
  professorList$ = new BehaviorSubject<any>([]);
  roomList$ = new BehaviorSubject<any>([]);

  sectionAvg = 0;

  dayList = ['Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday'];

  startList = [
    '8:30am',
    '10:00am',
    '11:30am',
    '1:00pm',
    '2:30pm',
    '4:00pm',
    '5:30pm',
    '7:00pm'
  ];

  endList = [
    '9:50am',
    '11:20am',
    '12:50pm',
    '2:20pm',
    '3:50pm',
    '5:20pm',
    '6:50pm',
    '9:50pm'
  ];

  constructor(
    private _formBuilder: FormBuilder,
    private courseService: CourseService,
    private professorService: ProfessorService,
    private roomService: RoomService,
    private router: Router,
    private _snackBar: MatSnackBar
  ) {}

  ngOnInit() {
    this.courseService.getAllCourses().subscribe(resp => {
      this.courseList$.next(resp.data);
    });
    this.professorService.getAllProfessors().subscribe(resp => {
      this.professorList$.next(resp.data);
    });
    this.roomService.getAllRooms().subscribe(resp => {
      console.log(resp.data);
      this.roomList$.next(resp.data);
    });

    this.firstFormGroup = this._formBuilder.group({
      selectCourse: ['', Validators.required],
      selectSection: ['', Validators.required]
    });

    this.firstFormGroup.get('selectCourse').valueChanges.subscribe(val => {
      this.courseService.getAllSectionsByCourse(val.course_id).subscribe(resp => {
        this.sectionList$.next(resp.data);
      })
    });

    this.firstFormGroup.get('selectSection').valueChanges.subscribe(val => {
      this.courseService.getSectionById(val.section_rec).subscribe(resp => {
        let count = 0;
        let total = 0;
        resp.data.forEach(element => {
          total += element.grade;
          count++;
        });

        this.sectionAvg = total / count;
      });
    })

    this.secondFormGroup = this._formBuilder.group({
      selectProfessor: ['', Validators.required]
    });

    this.thirdFormGroup = this._formBuilder.group({
      selectRoom: ['', Validators.required],
      selectDay: [''],
      selectStart: [''],
      selectEnd: [{ value: '', disabled: true }]
    });

    this.thirdFormGroup.get('selectStart').valueChanges.subscribe(val => {
      this.thirdFormGroup
        .get('selectEnd')
        .setValue(this.endList[this.startList.indexOf(val)]);
    });
  }

  submit() {
    this.courseService
      .applyCurveToSection({
        sectionId: this.firstFormGroup.get('selectSection').value.section_rec
      })
      .subscribe(resp => {
        if (resp) {
          this.openSnackBar('Success! The curve has been applied', 'Close');
        }
      });
  }

  openSnackBar(message: string, action: string) {
    this._snackBar.open(message, action, {
      duration: 2000
    });
  }

  check(section) {
    return section.semester === 'F' && section.year === 2019;
  }

  navigate() {
    this.router.navigate(['/course', this.firstFormGroup.get('selectSection').value.course_id], {
      queryParams: {
        record: this.firstFormGroup.get('selectSection').value.section_rec,
        pid: this.firstFormGroup.get('selectSection').value.professor_id
      }
    });
  }
}
