import { Injectable } from '@angular/core';
import { HttpClient, HttpHeaders } from '@angular/common/http';
import { Observable } from 'rxjs/Observable';
import { environment } from '../../../environments/environment';
import { catchError, tap } from 'rxjs/operators';
import 'rxjs/add/observable/of';
import { Store } from '@ngrx/store';
import * as Consent from '../reducers/app.states';
import { ErrorHandlerService } from './errorhandler.service';

const httpOptions = {
    headers: new HttpHeaders({ 'Content-Type': 'application/json' })
};

@Injectable()
export class AppStateService {
    private API_URL = environment.API_URL;
    private url = '/api/AppStore';

    constructor(private http: HttpClient,
        private store: Store<AppState>,
        private errorHandler: ErrorHandlerService) { }

    public addAppState(appStateId: number, personId: number, patientId: number, patientMasterVisitId: number,
        encounterId: number, appStateObject: string = ''): Observable<any> {
        const Indata = {
            PersonId: personId,
            PatientId: patientId,
            PatientMasterVisitId: patientMasterVisitId,
            EncounterId: encounterId,
            AppStateId: appStateId,
            AppStateObject: appStateObject
        };

        console.log(Indata);

        return this.http.post<any>(this.API_URL + this.url, JSON.stringify(Indata), httpOptions).pipe(
            tap(addAppState => this.errorHandler.log('added observable to store')),
            catchError(this.errorHandler.handleError<any[]>('addAppState', []))
        );
    }

    public initializeAppState(): Promise<any> {
        const personId = localStorage.getItem('personId');
        const patientId = localStorage.getItem('patientId');
        const patientMasterVisitId = localStorage.getItem('patientMasterVisitId');
        const htsEncounterId = localStorage.getItem('htsEncounterId');

        const InData = {
            'personId': personId,
            'patientId': patientId,
            'patientMasterVisitId': patientMasterVisitId,
            'htsEncounterId': htsEncounterId
        };

        const promise = this.http.post<any>(this.API_URL + this.url + '/getState',
            JSON.stringify(InData), httpOptions).toPromise().then((res) => {

                if (res['stateStore'].length > 0 && ((personId) || (patientId) || (patientMasterVisitId) || (htsEncounterId))) {
                    const response = res['stateStore'];

                    for (let i = 0; i < response.length; i++) {
                        switch (response[i].appStateId) {
                            case 1:
                                this.store.dispatch(new Consent.ConsentTesting(true));
                                break;
                            case 2:
                                this.store.dispatch(new Consent.Tested(true));
                                break;
                            case 3:
                                this.store.dispatch(new Consent.ConsentPartnerListing(true));
                                break;
                            case 4:
                                this.store.dispatch(new Consent.IsPositive(true));
                                break;
                            case 5:
                                this.store.dispatch(new Consent.IsReferred(true));
                                break;
                            case 6:
                                this.store.dispatch(new Consent.TestedAs(true));
                                break;
                            case 7:
                                this.store.dispatch(new Consent.IsEnrolled(true));
                                break;
                            case 8:
                                for (let j = 0; j < response[i].appStateStoreObjects.length; j++) {
                                    this.store.dispatch(new Consent.IsPnsScreened(response[i].appStateStoreObjects[j].appStateObject));
                                }
                                break;
                            case 9:
                                for (let j = 0; j < response[i].appStateStoreObjects.length; j++) {
                                    this.store.dispatch(new Consent.IsPnsTracingDone(response[i].appStateStoreObjects[j].appStateObject));
                                }
                                break;
                        }
                    }
                }
            }, (err) => {
                console.log('Error connecting to IQCareApi ', err);
            });

        return promise;
    }
}
