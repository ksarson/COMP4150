import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { StudentGradeUpdateComponent } from './student-grade-update.component';

describe('StudentGradeUpdateComponent', () => {
  let component: StudentGradeUpdateComponent;
  let fixture: ComponentFixture<StudentGradeUpdateComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ StudentGradeUpdateComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(StudentGradeUpdateComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
