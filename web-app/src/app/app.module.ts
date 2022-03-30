import { BrowserModule } from '@angular/platform-browser';
import { NgModule } from '@angular/core';

import { AppRoutingModule } from './app-routing.module';
import { AppComponent } from './app.component';
import { BrowserAnimationsModule } from '@angular/platform-browser/animations';
import { StudentModule } from './student/student.module';
import { HomeDashboardModule } from './home-dashboard/home-dashboard.module';
import { HttpClientModule } from '@angular/common/http';
import { CourseModule } from './course/course.module';
import { AppFormsModule } from './forms/forms.module';

@NgModule({
  declarations: [
    AppComponent
  ],
  imports: [
    BrowserModule,
    AppRoutingModule,
    HttpClientModule,
    BrowserAnimationsModule,
    HomeDashboardModule,
    StudentModule,
    CourseModule,
    AppFormsModule
  ],
  providers: [],
  bootstrap: [AppComponent]
})
export class AppModule { }
