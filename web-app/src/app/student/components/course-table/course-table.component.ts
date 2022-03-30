import { Component, OnInit, ViewChild, Input } from '@angular/core';
import { MatSort } from '@angular/material/sort';
import { Observable } from 'rxjs';
import { MatTableDataSource } from '@angular/material/table';
import { Router } from '@angular/router';

@Component({
  selector: 'app-course-table',
  templateUrl: './course-table.component.html',
  styleUrls: ['./course-table.component.scss']
})
export class CourseTableComponent implements OnInit {
  @ViewChild(MatSort, { static: true }) sort: MatSort;
  @Input() dataSource$: Observable<any>;
  tableDataSource = new MatTableDataSource();
  displayedColumns: string[] = [
    'course_id',
    'course_name',
    'semester',
    'year',
    'grade',
    'status'
  ];

  constructor(private router: Router) {}

  ngOnInit() {
    this.dataSource$.subscribe(val => {
      this.tableDataSource.data = val;
      console.log(this.sort);
      this.tableDataSource.sort = this.sort;
    });
  }

  rowClicked(row) {
    this.router.navigate([`/course`, row.course_id]);
  }

  getStatusColor(elem) {
    if (elem.status === 'PASS') {
      return 'green';
    } else if (elem.status === 'IP') {
      return '#E6C812';
    } else {
      return 'red';
    }
  }
}
