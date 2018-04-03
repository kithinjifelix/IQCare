import {ClientActions, ClientActionTypes} from './app.states';


export function consentReducer(state: {} = {}, action: ClientActions) {
    switch (action.type) {
        case ClientActionTypes.CONSENT_TESTING:
            return {...state, consent: action.payload }
        case ClientActionTypes.TESTED:
            return {...state, tested: action.payload}
        case ClientActionTypes.IS_POSITIVE:
            return {...state, isPositive: action.payload}
        case ClientActionTypes.CONSENT_PARTNER_LISTING:
            return {...state, consentPartnerListing: action.payload}
        case ClientActionTypes.IS_REFERRED:
            return {...state, isReferred: action.payload}
        case ClientActionTypes.TESTED_AS:
            return {...state, testedAs: action.payload}
        case ClientActionTypes.ENROLLED:
            return {...state, isEnrolled: action.payload}
        case ClientActionTypes.PNS_SCREENED:
            return {...state, isPnsScreened: action.payload}
        case ClientActionTypes.PNS_TRACING:
            return {...state, isPnsTracingDone: action.payload}
        case ClientActionTypes.CLEAR_STATE:
            state = {};
            return state;
        default:
            return state;
    }
}
