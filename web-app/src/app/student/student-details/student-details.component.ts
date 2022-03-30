import { Component, OnInit } from '@angular/core';
import { ActivatedRoute } from '@angular/router';
import { StudentService } from 'src/app/service/student.service';
import { BehaviorSubject } from 'rxjs';
import { Student } from 'src/app/models/student';

@Component({
  selector: 'app-student-details',
  templateUrl: './student-details.component.html',
  styleUrls: ['./student-details.component.scss']
})
export class StudentDetailsComponent implements OnInit {
  panelOpenState = false;
  loading$ = new BehaviorSubject(false);
  studentId: number;
  studentDetails = null;
  courseDetails$ = new BehaviorSubject<any>([]);

  constructor(private route: ActivatedRoute, private studentService: StudentService) {
  }

  ngOnInit() {
    this.route.params.subscribe(params => {
      this.loading$.next(true);
      this.studentId = params.id;
      this.studentService.getStudentDetails(+params.id).subscribe(resp => {
        this.studentDetails = resp.data[0];
        this.loading$.next(false);
      });

      this.studentService.getStudentCourses(+params.id).subscribe(resp => {
        this.courseDetails$.next(resp.data);
      });
    });
  }

}
