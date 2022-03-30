import { Component, OnInit, ViewChild, Input } from '@angular/core';
import { MatSort } from '@angular/material/sort';
import { Observable } from 'rxjs';
import { MatTableDataSource } from '@angular/material/table';
import { Router } from '@angular/router';

@Component({
  selector: 'app-professor-table',
  templateUrl: './professor-table.component.html',
  styleUrls: ['./professor-table.component.scss']
})
export class ProfessorTableComponent implements OnInit {
  @ViewChild(MatSort, {static: true}) sort: MatSort;
  @Input() dataSource$: Observable<any>;
  tableDataSource = new MatTableDataSource();
  displayedColumns: string[] = ['professor_id', 'last_name', 'first_name', 'department_id'];

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
