const axios = require("axios").default;
const qs = require("qs");

async function _asaasTokenClienteCall(context, ffVariables) {
  if (!context.auth) {
    return _unauthenticatedResponse;
  }
  var id = ffVariables["id"];
  var dateCreated = ffVariables["dateCreated"];
  var name = ffVariables["name"];
  var email = ffVariables["email"];
  var mobilePhone = ffVariables["mobilePhone"];
  var address = ffVariables["address"];
  var addressNumber = ffVariables["addressNumber"];
  var complement = ffVariables["complement"];
  var province = ffVariables["province"];
  var cpfCnpj = ffVariables["cpfCnpj"];
  var personType = ffVariables["personType"];
  var postalCode = ffVariables["postalCode"];

  var url = `https://api-sandbox.asaas.com/v3/customers`;
  var headers = {
    "Content-Type": `application/json`,
    accept: `application/json`,
    access_token: `\$aact_prod_000MzkwODA2MWY2OGM3MWRlMDU2NWM3MzJlNzZmNGZhZGY6OmJiMmZlNDc5LTNmMDctNDY5My04MzRkLTE5MTFjNjMyNDQ0ZDo6JGFhY2hfMzliMWZmMGMtYzczMC00ZjMwLWI3YjYtZGJiMjQ2Y2EzYjJj`,
  };
  var params = {};
  var ffApiRequestBody = `
{
  "id": "${escapeStringForJson(id)}",
  "name": "${escapeStringForJson(name)}",
  "email": "${escapeStringForJson(email)}",
  "mobilePhone": "${escapeStringForJson(mobilePhone)}",
  "cpfCnpj": "${escapeStringForJson(cpfCnpj)}",
  "personType": "${escapeStringForJson(personType)}",
  "postalCode": "${escapeStringForJson(postalCode)}",
  "address": "${escapeStringForJson(address)}",
  "addressNumber": "${escapeStringForJson(addressNumber)}",
  "complement": "${escapeStringForJson(complement)}",
  "province": "${escapeStringForJson(province)}",
  "dateCreated": "${escapeStringForJson(dateCreated)}",
  "transaction": {
    "value": <value>,
    "dueDate": "<dueDate>",
    "description": "<description>"
  }
}
`;

  return makeApiRequest({
    method: "post",
    url,
    headers,
    params,
    body: createBody({
      headers,
      params,
      body: ffApiRequestBody,
      bodyType: "JSON",
    }),
    returnBody: true,
    isStreamingApi: false,
  });
}
async function _asaasPagamentoCall(context, ffVariables) {
  if (!context.auth) {
    return _unauthenticatedResponse;
  }
  var customer = ffVariables["customer"];
  var billingType = ffVariables["billingType"];
  var dueDate = ffVariables["dueDate"];
  var holderName = ffVariables["holderName"];
  var number = ffVariables["number"];
  var expiryMonth = ffVariables["expiryMonth"];
  var expiryYear = ffVariables["expiryYear"];
  var ccv = ffVariables["ccv"];
  var name = ffVariables["name"];
  var email = ffVariables["email"];
  var cpfCnpj = ffVariables["cpfCnpj"];
  var postalCode = ffVariables["postalCode"];
  var addressNumber = ffVariables["addressNumber"];
  var addressComplement = ffVariables["addressComplement"];
  var phone = ffVariables["phone"];
  var mobilePhone = ffVariables["mobilePhone"];
  var remoteIp = ffVariables["remoteIp"];
  var value = ffVariables["value"];
  var description = ffVariables["description"];
  var installmentCount = ffVariables["installmentCount"];
  var totalValue = ffVariables["totalValue"];

  var url = `https://api-sandbox.asaas.com/v3/payments`;
  var headers = {
    accept: `application/json`,
    access_token: `\$aact_prod_000MzkwODA2MWY2OGM3MWRlMDU2NWM3MzJlNzZmNGZhZGY6OmJiMmZlNDc5LTNmMDctNDY5My04MzRkLTE5MTFjNjMyNDQ0ZDo6JGFhY2hfMzliMWZmMGMtYzczMC00ZjMwLWI3YjYtZGJiMjQ2Y2EzYjJj`,
    "content-type": `application/json`,
  };
  var params = {};
  var ffApiRequestBody = `
{
  "customer": "${escapeStringForJson(customer)}",
  "billingType": "CREDIT_CARD",
  "value": ${value},
  "dueDate": "${escapeStringForJson(dueDate)}",
  "creditCard": {
    "holderName": "${escapeStringForJson(holderName)}",
    "number": "${escapeStringForJson(number)}",
    "expiryMonth": "${escapeStringForJson(expiryMonth)}",
    "expiryYear": "${escapeStringForJson(expiryYear)}",
    "ccv": "${escapeStringForJson(ccv)}"
  },
  "creditCardHolderInfo": {
    "name": "${escapeStringForJson(name)}",
    "email": "${escapeStringForJson(email)}",
    "cpfCnpj": "${escapeStringForJson(cpfCnpj)}",
    "postalCode": "${escapeStringForJson(postalCode)}",
    "addressNumber": "${escapeStringForJson(addressNumber)}",
    "addressComplement": "${escapeStringForJson(addressComplement)}",
    "phone": "${escapeStringForJson(phone)}",
    "mobilePhone": "${escapeStringForJson(mobilePhone)}"
  },
  "installmentCount": ${installmentCount},
  "totalValue": ${totalValue},
  "remoteIp": "${escapeStringForJson(remoteIp)}",
  "description": "${escapeStringForJson(description)}"
}
`;

  return makeApiRequest({
    method: "post",
    url,
    headers,
    params,
    body: createBody({
      headers,
      params,
      body: ffApiRequestBody,
      bodyType: "JSON",
    }),
    returnBody: true,
    isStreamingApi: false,
  });
}
async function _pagPixMPCall(context, ffVariables) {
  if (!context.auth) {
    return _unauthenticatedResponse;
  }
  var amount = ffVariables["amount"];
  var email = ffVariables["email"];
  var firstName = ffVariables["firstName"];
  var lastName = ffVariables["lastName"];
  var identificationType = ffVariables["identificationType"];
  var numberCpf = ffVariables["numberCpf"];
  var productTitle = ffVariables["productTitle"];

  var url = `https://api.mercadopago.com/v1/payments`;
  var headers = {
    Authorization: `Bearer APP_USR-6793465446446494-052816-aa47d981fbe10fedf66f18f7c60d3810-222286824`,
  };
  var params = {};
  var ffApiRequestBody = `
{
  "transaction_amount": ${amount},
  "description": "${escapeStringForJson(productTitle)}", 
  "payment_method_id": "pix",
  "payer": {
    "email": "${escapeStringForJson(email)}",
    "first_name": "${escapeStringForJson(firstName)}",
    "last_name": "${escapeStringForJson(lastName)}",
    "identification": {
      "type": "${escapeStringForJson(identificationType)}",
      "number": "${escapeStringForJson(numberCpf)}"
    }
  }
}`;

  return makeApiRequest({
    method: "post",
    url,
    headers,
    params,
    body: createBody({
      headers,
      params,
      body: ffApiRequestBody,
      bodyType: "JSON",
    }),
    returnBody: true,
    isStreamingApi: false,
  });
}

/// Helper functions to route to the appropriate API Call.

async function makeApiCall(context, data) {
  var callName = data["callName"] || "";
  var variables = data["variables"] || {};

  const callMap = {
    AsaasTokenClienteCall: _asaasTokenClienteCall,
    AsaasPagamentoCall: _asaasPagamentoCall,
    PagPixMPCall: _pagPixMPCall,
  };

  if (!(callName in callMap)) {
    return {
      statusCode: 400,
      error: `API Call "${callName}" not defined as private API.`,
    };
  }

  var apiCall = callMap[callName];
  var response = await apiCall(context, variables);
  return response;
}

async function makeApiRequest({
  method,
  url,
  headers,
  params,
  body,
  returnBody,
  isStreamingApi,
}) {
  return axios
    .request({
      method: method,
      url: url,
      headers: headers,
      params: params,
      responseType: isStreamingApi ? "stream" : "json",
      ...(body && { data: body }),
    })
    .then((response) => {
      return {
        statusCode: response.status,
        headers: response.headers,
        ...(returnBody && { body: response.data }),
        isStreamingApi: isStreamingApi,
      };
    })
    .catch(function (error) {
      return {
        statusCode: error.response.status,
        headers: error.response.headers,
        ...(returnBody && { body: error.response.data }),
        error: error.message,
      };
    });
}

const _unauthenticatedResponse = {
  statusCode: 401,
  headers: {},
  error: "API call requires authentication",
};

function createBody({ headers, params, body, bodyType }) {
  switch (bodyType) {
    case "JSON":
      headers["Content-Type"] = "application/json";
      return body;
    case "TEXT":
      headers["Content-Type"] = "text/plain";
      return body;
    case "X_WWW_FORM_URL_ENCODED":
      headers["Content-Type"] = "application/x-www-form-urlencoded";
      return qs.stringify(params);
  }
}
function escapeStringForJson(val) {
  if (typeof val !== "string") {
    return val;
  }
  return val
    .replace(/[\\]/g, "\\\\")
    .replace(/["]/g, '\\"')
    .replace(/[\n]/g, "\\n")
    .replace(/[\t]/g, "\\t");
}

module.exports = { makeApiCall };
