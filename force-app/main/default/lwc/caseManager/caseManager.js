import { LightningElement, wire, track } from 'lwc';
import getOpenCases from '@salesforce/apex/CaseController.getOpenCases';
import updateCaseStatus from '@salesforce/apex/CaseController.updateCaseStatus';

export default class CaseManager extends LightningElement {
    @track cases;
    columns = [
        { label: 'Case Number', fieldName: 'CaseNumber', type: 'text' },
        { label: 'Subject', fieldName: 'Subject', type: 'text' },
        { label: 'Status', fieldName: 'Status', type: 'text' },
        { type: 'button', typeAttributes: { label: 'Close Case', name: 'closeCase', variant: 'destructive' } }
    ];

    @wire(getOpenCases)
    wiredCases({ error, data }) {
        if (data) {
            this.cases = data;
        }
    }

    handleRowAction(event) {
        const caseId = event.detail.row.Id;
        updateCaseStatus({ caseId, status: 'Closed' })
            .then(() => {
                // Refresh case list
                return refreshApex(this.wiredCases);
            })
            .catch(error => {
                console.error('Error closing case', error);
            });
    }
}
