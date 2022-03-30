import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { environment } from 'src/environments/environment';
import { Observable } from 'rxjs';

@Injectable({
  providedIn: 'root'
})
export class RoomService {
  private url;
  constructor(private http: HttpClient) {
    this.url = environment.apiURL;
  }

  getAllRooms(): Observable<any> {
    return this.http.get(`${this.url}/room/`);
  }
}
