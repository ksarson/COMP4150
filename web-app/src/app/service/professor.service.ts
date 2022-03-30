import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { environment } from 'src/environments/environment';
import { Observable } from 'rxjs';

@Injectable({
  providedIn: 'root'
})
export class ProfessorService {
  private url;
  constructor(private http: HttpClient) {
    this.url = environment.apiURL;
  }

  getAllProfessors(): Observable<any> {
    console.log(`[Get ALL Professors]${this.url}/professor`);
    return this.http.get(`${this.url}/professor`);
  }

  addProfessor(req): Observable<any> {
    return this.http.post(`${this.url}/professor/add`, req);
  }
}
