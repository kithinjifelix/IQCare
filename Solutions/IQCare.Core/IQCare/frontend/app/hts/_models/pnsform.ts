export class Pnsform {
    patientId: number;
    personId: number;
    patientMasterVisitId: number;
    userId: number;

    screeningDate: string;
    pnsAccepted: number;
    ipvScreeningDone: number;
    partnerPhysicallyHurt: number;
    partnerThreatenedHurt: number;
    forcedSexualUncomfortable: number;
    ipvOutcome: number;
    occupation: string;
    pnsRelationship: number;
    livingWithClient: number;
    hivStatus: number;
    pnsApproach: number;
    eligibleTesting: number;
    bookingDate: string;
}

export class PartnerView {
    fullName: string;
    DateOfBirth: string;
    Gender: string
}
