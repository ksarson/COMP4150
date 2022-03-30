import { Component, OnInit, ViewChild, Input } from '@angular/core';
import { MatSort } from '@angular/material/sort';
import { Observable } from 'rxjs';
import { MatTableDataSource } from '@angular/material/table';
import { Router, ActivatedRoute } from '@angular/router';

@Component({
  selector: 'app-history-table',
  templateUrl: './history-table.component.html',
  styleUrls: ['./history-table.component.scss']
})
export class HistoryTableComponent implements OnInit {
  @ViewChild(MatSort, { static: true }) sort: MatSort;
  @Input() dataSource$: Observable<any>;
  selectedProf = {};
  tableDataSource = new MatTableDataSource();
  displayedColumns: string[] = ['section_id', 'course_id', 'course_name', 'professor_name','num_students', 'year'];

  constructor(private router: Router, private route: ActivatedRoute) { }

  ngOnInit() {
    this.dataSource$.subscribe(val => {
      this.tableDataSource.data = val;
      this.tableDataSource.sort = this.sort;
    });
  }

  rowClicked(row) {
    this.router.navigate([], {
      relativeTo: this.route,
      queryParams: {
        record: row.section_rec,
        pid: row.professor_id
      }
    });
  }
}
