import ballerinax/zendesk.support;
import ballerinax/salesforce;
import ballerina/http;

# A service representing a network-accessible API
# bound to port `9090`.
service / on new http:Listener(9090) {

    # A resource for generating greetings
    # + return - string name with hello message or error
    resource function get data() returns json|error {
        // Send a response back to the caller.

        salesforce:Client salesforceEndpoint = check new ({baseUrl: "https://contentlab2-dev-ed.my.salesforce.com", clientConfig: {refreshUrl: "https://login.salesforce.com/services/oauth2/token", refreshToken: "5Aep861g78ZB7.52Bc5slKRxVRgBc9o5goud6O2tbCdGuDdAoQPNzLSJPzzcz2ADrLtb5y9YdhdlSUlFUrNlxpa", clientId: "3MVG9DREgiBqN9WmUCPxLD0NLTyR42IazrIJpzeekfzkQZof_MpurIEwpvdUuZmni8b66z44Q9QAzW_zkWnKf", clientSecret: "46AC8D07313A5298C57D64E41CB0BA4D69A6D195FD051F7C67C4B327084D65FC"}});
        json getAccountByIdResponse = check salesforceEndpoint->getAccountById("0018d00000A327jAAB");
        string createAccountResponse = check salesforceEndpoint->createAccount({Name: "Jac Oruko", BillingCity: "Nairobi 047"});
        support:Client supportEndpoint = check new ({auth: {username: "okoth.ogutu@students.ku.ac.ke", password: "NBbvgd5LmTzYt7w"}}, "https://students9315.zendesk.com");

        return getAccountByIdResponse;
    }
}
