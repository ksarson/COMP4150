import { Component, OnInit } from '@angular/core';
import { FormGroup, FormBuilder, Validators } from '@angular/forms';
import { StudentService } from 'src/app/service/student.service';
import { MatSnackBar } from '@angular/material/snack-bar';

@Component({
  selector: 'app-student-add',
  templateUrl: './student-add.component.html',
  styleUrls: ['./student-add.component.scss']
})
export class StudentAddComponent implements OnInit {
  isLinear = false;
  firstFormGroup: FormGroup;
  secondFormGroup: FormGroup;

  departmentOptions = new Map<string, string>([
    ['Business', 'BU'],
    ['Chemistry', 'CH'],
    ['Computer Science', 'CS'],
    ['Engineering', 'EN']
  ]);

  constructor(
    private _formBuilder: FormBuilder,
    private studentService: StudentService,
    private _snackBar: MatSnackBar
  ) {}

  ngOnInit() {
    this.firstFormGroup = this._formBuilder.group({
      firstName: ['', Validators.required],
      lastName: ['', Validators.required]
    });
    this.secondFormGroup = this._formBuilder.group({
      major: ['', Validators.required]
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
      .addStudent({
        first: this.firstFormGroup.get('firstName').value,
        last: this.firstFormGroup.get('lastName').value,
        major: this.secondFormGroup.get('major').value
      })
      .subscribe(resp => {
        if (resp) {
          this.openSnackBar('Sucess! The student has been added', 'Close');
        }
      });
  }

  openSnackBar(message: string, action: string) {
    this._snackBar.open(message, action, {
      duration: 2000,
    });
  }
}
