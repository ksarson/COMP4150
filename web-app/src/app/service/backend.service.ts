import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { environment } from '../../environments/environment';
import { Observable } from 'rxjs';
@Injectable({
  providedIn: 'root'
})
export class BackendService {
  private url;
  constructor(private http: HttpClient) {
    this.url = environment.apiURL;
  }

  getStudents(): Observable<any> {
    console.log(`[Getting Students]${this.url}/student`);
    return this.http.get(`${this.url}/student`);
  }
}
