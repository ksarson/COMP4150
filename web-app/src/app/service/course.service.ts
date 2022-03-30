import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { environment } from '../../environments/environment';
import { Observable } from 'rxjs';
@Injectable({
  providedIn: 'root'
})
export class CourseService {
  private url;
  constructor(private http: HttpClient) {
    this.url = environment.apiURL;
  }

  getAllCourses(): Observable<any> {
    return this.http.get(`${this.url}/course/`);
  }

  getCourseDetails(id): Observable<any> {
    return this.http.get(`${this.url}/course/${id}`);
  }

  getAllSectionsByCourse(id): Observable<any> {
    return this.http.get(`${this.url}/course/sections/${id}`);
  }

  getSectionById(id): Observable<any> {
    return this.http.get(`${this.url}/course/section/${id}`);
  }
  getSectionProfessor(id): Observable<any> {
    return this.http.get(`${this.url}/course/section/professor/${id}`);
  }

  dropStudentInSection(req): Observable<any> {
    return this.http.post(`${this.url}/course/section/remove-student`, req);
  }

  addSection(req): Observable<any> {
    return this.http.post(`${this.url}/course/section/add`, req);
  }

  addProfessorToSection(req): Observable<any> {
    return this.http.post(`${this.url}/course/section/professor`, req);
  }

  applyCurveToSection(req): Observable<any> {
    return this.http.post(`${this.url}/course/section/curve`, req);
  }

  getSectionAverage(req): Observable<any> {
    return this.http.post(`${this.url}/course/section/curve`, req);
  }

}
