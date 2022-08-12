import 'dart:io';

import 'package:dio/dio.dart';

import 'response_model.dart';

///
///
///
///
void main(List<String> arguments) {
  print(arguments);
  var map = {};
  for (var item in arguments) {
    // print(item.split('='));
    var itemList = item.split('=');
    map.putIfAbsent(itemList[0], () => itemList[1]);
  }
  print(map);
  uploadFile(map);
}

/// @params
/// @return
/// @desc 获取文件路径
String getFilePath() {
  var path = '9966';
  return path;
}

/// @params
/// @params
/// @return
/// @desc
void uploadFile(map) async {
  // var path = getFilePath();
  var file = File(map['filePath']);
  var fileName = file.path.split('/').last;
  var formData = FormData.fromMap(
    {
      'file': await MultipartFile.fromFile(file.path, filename: fileName),
      'uKey': map['uKey'],
      '_api_key': map['_api_key'],
    },
  );
  var dio = Dio();
  var response = await dio.post('https://www.pgyer.com/apiv1/app/upload', data: formData, onReceiveProgress: (rec, total) {
    print(rec / total);
  });
  // await dio.post('https://www.pgyer.com/apiv1/app/upload');
  var model = ResponseModel.fromJson(response.data);
  print(model.data.appQRCodeURL);
}
