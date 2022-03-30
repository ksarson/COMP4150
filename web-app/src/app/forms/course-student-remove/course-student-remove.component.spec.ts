import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { CourseStudentRemoveComponent } from './course-student-remove.component';

describe('CourseStudentRemoveComponent', () => {
  let component: CourseStudentRemoveComponent;
  let fixture: ComponentFixture<CourseStudentRemoveComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ CourseStudentRemoveComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(CourseStudentRemoveComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
