import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { ProfessorTableComponent } from './professor-table.component';

describe('ProfessorTableComponent', () => {
  let component: ProfessorTableComponent;
  let fixture: ComponentFixture<ProfessorTableComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ ProfessorTableComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(ProfessorTableComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
