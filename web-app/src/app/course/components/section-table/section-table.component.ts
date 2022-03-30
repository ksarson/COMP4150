import { Component, OnInit, ViewChild, Input } from '@angular/core';
import { MatSort } from '@angular/material/sort';
import { Observable } from 'rxjs';
import { MatTableDataSource } from '@angular/material/table';
import { Router, ActivatedRoute } from '@angular/router';

@Component({
  selector: 'app-section-table',
  templateUrl: './section-table.component.html',
  styleUrls: ['./section-table.component.scss']
})
export class SectionTableComponent implements OnInit {
  @ViewChild(MatSort, {static: true}) sort: MatSort;
  @Input() dataSource$: Observable<any>;
  tableDataSource = new MatTableDataSource();
  displayedColumns: string[] = ['section_rec', 'student_id', 'last_name', 'first_name', 'grade'];

  constructor(private router: Router, private route: ActivatedRoute) { }

  ngOnInit() {
    this.dataSource$.subscribe(val => {
      this.tableDataSource.data = val;
      console.log(this.tableDataSource.data)
      this.tableDataSource.sort = this.sort;
    });
  }

  rowClicked(row) {
    this.router.navigate([`/student`, row.student_id]);
  }
}
