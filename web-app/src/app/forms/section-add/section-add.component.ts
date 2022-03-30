import { Component, OnInit } from '@angular/core';
import { FormGroup, FormBuilder, Validators } from '@angular/forms';
import { BehaviorSubject } from 'rxjs';
import { CourseService } from 'src/app/service/course.service';
import { MatSnackBar } from '@angular/material';
import { ProfessorService } from 'src/app/service/professor.service';
import { RoomService } from 'src/app/service/room.service';

@Component({
  selector: 'app-section-add',
  templateUrl: './section-add.component.html',
  styleUrls: ['./section-add.component.scss']
})
export class SectionAddComponent implements OnInit {
  isLinear = false;
  firstFormGroup: FormGroup;
  secondFormGroup: FormGroup;
  thirdFormGroup: FormGroup;
  courseList$ = new BehaviorSubject<any>([]);
  professorList$ = new BehaviorSubject<any>([]);
  roomList$ = new BehaviorSubject<any>([]);

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
    private _snackBar: MatSnackBar
  ) {}

  ngOnInit() {
    this.courseService.getAllCourses().subscribe(resp => {
      this.courseList$.next(resp.data);
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
    });
    this.roomService.getAllRooms().subscribe(resp => {
      console.log(resp.data);
      this.roomList$.next(resp.data);
    });

    this.firstFormGroup = this._formBuilder.group({
      selectCourse: ['', Validators.required]
    });

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
      .addSection({
        courseId: this.firstFormGroup.get('selectCourse').value.course_id,
        profId: this.secondFormGroup.get('selectProfessor').value.professor_id,
        roomId: this.thirdFormGroup.get('selectRoom').value.room_id,
        day: this.thirdFormGroup.get('selectDay').value,
        start: this.thirdFormGroup.get('selectStart').value,
        end: this.thirdFormGroup.get('selectEnd').value,
      })
      .subscribe(resp => {
        console.log(resp)
        if (resp) {
          this.openSnackBar('Success! The section has been added', 'Close');
        }
      });
  }

  openSnackBar(message: string, action: string) {
    this._snackBar.open(message, action, {
      duration: 2000
    });
  }

  checkProfessor(prof) {
    const course = this.firstFormGroup.get('selectCourse').value;
    return prof.department_id !== course.department_id;
  }
}
