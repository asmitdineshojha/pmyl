import 'dart:convert';

import 'package:http/http.dart' as http;

class EmiCalService {
  Future<Map<String, dynamic>> emiCal(
      String? loanAmount, String? emiTenure) async {
    http.Response response = await http.get(Uri.parse(
        "http://194.233.69.10/lms/ajax.php?action=quickLoanCalculation&loanAmount=$loanAmount&emiTenure=$emiTenure"));
    var payload = jsonDecode(response.body);
    print(payload);
    if (payload['success'] == 1) {
      return payload['data'];
    }
    return payload;
  }
}
