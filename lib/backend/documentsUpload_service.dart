import 'package:flutter/src/widgets/framework.dart';
import 'package:http/http.dart' as http;

class DocumentsUploadService {
  Future documentsUpload(filePath) async {
    final request = await http.MultipartRequest('POST',
        Uri.parse("http://194.233.69.10/lms/ajaxfile_api.php"));
    request.files.add(
      await http.MultipartFile.fromPath('file-input',filePath),
    );


    request.send().then((response) {
      if (response.statusCode == 200) print("Uploaded!");
    });

  //       var payload = jsonDecode(response.body);
  //   print(payload);
  //   if (payload['success'] == 1) {
  //     return payload['url'];
  //   }
  //   return payload;
  // }
}}
