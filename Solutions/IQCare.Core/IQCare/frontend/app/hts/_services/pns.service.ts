import { Injectable } from '@angular/core';
import {HttpClient, HttpHeaders} from '@angular/common/http';
import {environment} from '../../../environments/environment';
import {catchError, tap} from 'rxjs/operators';
import {Observable} from 'rxjs/Observable';
import {of} from 'rxjs/observable/of';
import {Pnsform} from '../_models/pnsform';

const httpOptions = {
    headers: new HttpHeaders({ 'Content-Type': 'application/json' })
};

@Injectable()
export class PnsService {
    private API_URL = environment.API_URL;
    private url = '/api/Register';
    private lookup = '/api/Lookup/getCustomOptions';

    constructor(private http: HttpClient) { }

    public getClientPartners(patientId: number): Observable<any[]> {
        const relationshipTypes = JSON.stringify(['Co-Wife', 'Partner', 'Spouse']);

        console.log(this.API_URL + this.url + '/getPartners/?patientId='
            + patientId);
        return this.http.post<any[]>(this.API_URL + this.url + '/getPartners/?patientId='
            + patientId, relationshipTypes, httpOptions).pipe(
            tap(getClientPartners => this.log('fetched all partners')),
            catchError(this.handleError<any[]>('getClientPartners'))
        );
    }

    public getCustomOptions(): Observable<any[]> {
        const options = JSON.stringify(['YesNoNA', 'YesNo', 'IpvOutcome', 'YesNoDeclined', 'PNSRelationship', 'HivStatus', 'PnsApproach']);

        return this.http.post<any[]>(this.API_URL + this.lookup, options, httpOptions).pipe(
            tap(getCustomOptions => this.log('fetched all custom options')),
            catchError(this.handleError<any[]>('getCustomOptions'))
        );
    }

    public addPnsScreening(pnsScreening: Pnsform): Observable<any> {
        return this.http.post<any>(this.API_URL + this. url, JSON.stringify(pnsScreening), httpOptions).pipe(
            tap(addedPnsScreening => this.log('add pns screening')),
            catchError(this.handleError<any[]>('addPnsScreening'))
        );
    }

    private handleError<T> (operation = 'operation', result?: T) {
        return (error: any): Observable<T> => {

            // TODO: send the error to remote logging infrastructure
            console.error(error); // log to console instead

            // TODO: better job of transforming error for user consumption
            this.log(`${operation} failed: ${error.message}`);

            // Let the app keep running by returning an empty result.
            return of(result as T);
        };
    }

    /** Log a HeroService message with the MessageService */
    private log(message: string) {
        console.log(message);
    }
}
