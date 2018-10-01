import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { TestDialogComponent } from './testdialog.component';

describe('TestdialogComponent', () => {
  let component: TestDialogComponent;
  let fixture: ComponentFixture<TestDialogComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ TestDialogComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(TestDialogComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
