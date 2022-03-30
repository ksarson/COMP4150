import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { StudentCourseAddComponent } from './student-course-add.component';

describe('StudentCourseAddComponent', () => {
  let component: StudentCourseAddComponent;
  let fixture: ComponentFixture<StudentCourseAddComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ StudentCourseAddComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(StudentCourseAddComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
