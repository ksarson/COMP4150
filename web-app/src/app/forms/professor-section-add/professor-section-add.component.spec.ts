import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { ProfessorSectionAddComponent } from './professor-section-add.component';

describe('ProfessorSectionAddComponent', () => {
  let component: ProfessorSectionAddComponent;
  let fixture: ComponentFixture<ProfessorSectionAddComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ ProfessorSectionAddComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(ProfessorSectionAddComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
