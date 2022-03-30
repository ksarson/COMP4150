import { Component, OnInit, Input, ViewChild } from '@angular/core';
import { MatSort } from '@angular/material/sort';
import { MatTableDataSource } from '@angular/material/table';
import { Observable } from 'rxjs';
import { Router } from '@angular/router';

@Component({
  selector: 'app-student-table',
  templateUrl: './student-table.component.html',
  styleUrls: ['./student-table.component.scss']
})
export class StudentTableComponent implements OnInit {
  @ViewChild(MatSort, {static: true}) sort: MatSort;
  @Input() dataSource$: Observable<any>;
  tableDataSource = new MatTableDataSource();
  displayedColumns: string[] = ['student_id', 'last_name', 'first_name', 'gpa', 'department_id'];

  constructor(private router: Router) { }

  ngOnInit() {
    this.dataSource$.subscribe(val => {
      this.tableDataSource.data = val;
      console.log(this.sort);
      this.tableDataSource.sort = this.sort;
    });
  }

  rowClicked(row) {
   this.router.navigate([`/student`, row.student_id]);
  }

}
