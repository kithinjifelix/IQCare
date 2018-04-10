import {Injectable} from '@angular/core';
import {BehaviorSubject} from 'rxjs/BehaviorSubject';

@Injectable()
export class DataService {
    private hasConsented = new BehaviorSubject<boolean>(false);
    private isPositive = new BehaviorSubject<boolean>(false);
    private hasConsentedPartnerListing = new BehaviorSubject<boolean>(false);

    currentHasConsented = this.hasConsented.asObservable();
    currentIsPositive = this.isPositive.asObservable();
    currentHasConsentedPartnerListing =  this.hasConsentedPartnerListing.asObservable();

    constructor() {

    }

    updateHasConsented(consent: boolean) {
        this.hasConsented.next(consent);
    }

    updateIsPositive(isPositive: boolean) {
        console.log('ispositive changed');
        this.isPositive.next(isPositive);
    }

    updateHasConsentedPartnerListing(hasConsentedPartnerListing: boolean) {
        console.log('partner listing consent changed');
        this.hasConsentedPartnerListing.next(hasConsentedPartnerListing);
    }
}
