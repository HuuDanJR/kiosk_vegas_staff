import 'package:http/http.dart' as http;
import 'dart:convert';
class SoapClient {
   getUserData() async  {
     String soap = '''<?xml version="1.0"?>
<soapenv:Envelope xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/"
                  xmlns:tot="http://www.totvs.com/">
  <soapenv:Header/>
  <soapenv:Body>
    <tot:RealizarConsultaSQL>      
      <tot:codSentenca>ETHOS.TESTE</tot:codSentenca>    
      <tot:codColigada>0</tot:codColigada>       
      <tot:codSistema>F</tot:codSistema>       
      <tot:parameters></tot:parameters>
    </tot:RealizarConsultaSQL>
  </soapenv:Body>
</soapenv:Envelope>''';

  http.Response response = await http.post(
    Uri.parse('http://totvs.brazilsouth.cloudapp.azure.com:8051/wherever'),
    headers: {
      'content-type': 'text/xmlc',
      'authorization': 'bWVzdHJlOnRvdHZz',
      'SOAPAction': 'http://www.totvs.com/IwsConsultaSQL/RealizarConsultaSQL',
    },
    body: utf8.encode(soap),
  );
  print(response.statusCode);
  }
}

// getUserData() async {
//   var requestBody = '''<?xml version="1.0" encoding="utf-8"?>
//     <soap:Envelope xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:soap="http://schemas.xmlsoap.org/soap/envelope/">
//       <soap:Body>
//         <Add xmlns="http://tempuri.org/">
//           <intA>2</intA>
//           <intB>4</intB>
//         </Add>
//       </soap:Body>
//     </soap:Envelope>''';

//   Response response = await post(
//     Uri.parse('http://www.dneonline.com/calculator.asmx'),
//     headers: {
//       'content-type': 'text/xml; charset=utf-8',
//       'SOAPAction': 'http://tempuri.org/Add',
//       'Host': 'www.dneonline.com',
//     },
//     body: utf8.encode(requestBody),
//   );

//   print("Response status: ${response.statusCode}");
//   print("Response body: ${response.body}");
// }
