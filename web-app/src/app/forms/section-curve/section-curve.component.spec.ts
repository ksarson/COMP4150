import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { SectionCurveComponent } from './section-curve.component';

describe('SectionCurveComponent', () => {
  let component: SectionCurveComponent;
  let fixture: ComponentFixture<SectionCurveComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ SectionCurveComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(SectionCurveComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
