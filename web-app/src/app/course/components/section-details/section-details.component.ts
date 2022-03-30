import { Component, OnInit, Input } from '@angular/core';
import { Router, ActivatedRoute } from '@angular/router';
import { CourseService } from 'src/app/service/course.service';
import { BehaviorSubject } from 'rxjs';

@Component({
  selector: 'app-section-details',
  templateUrl: './section-details.component.html',
  styleUrls: ['./section-details.component.scss']
})
export class SectionDetailsComponent implements OnInit {
  @Input() sectionRecord;
  @Input() professorId;
  studentList$ = new BehaviorSubject<any>([]);
  professorValue$ = new BehaviorSubject<any>(null);
  sectionAvg = 0;
  constructor(private router: Router, private route: ActivatedRoute, private courseService: CourseService) { }

  ngOnInit() {
    this.courseService.getSectionById(this.sectionRecord).subscribe(resp => {
      console.log(resp.data);
      this.studentList$.next(resp.data);
    });
    this.studentList$.subscribe(list => {
      this.sectionAvg = 0;
      list.forEach(element => {
        this.sectionAvg += element.grade;
      });
      this.sectionAvg = this.sectionAvg / list.length;
    });

    this.courseService.getSectionProfessor(this.professorId).subscribe(resp => {
      this.professorValue$.next(resp.data[0]);
    });
  }

  hideSection() {
    this.router.navigate([], {
      relativeTo: this.route,
      queryParams: {}
    });
  }

}
