import 'dart:io';

import 'package:dio/dio.dart';

import 'response_model.dart';

///
///
///
///
void main(List<String> arguments) {
  print(arguments);
  print('Hello world!'.isLengthBigThan10());
  // uploadFile();
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
void uploadFile() async {
  // var path = getFilePath();
  var file = File('C:\\Users\\kevin\\Downloads\\唯寻工作台_2.0.5.apk');
  var fileName = file.path.split('/').last;
  var formData = FormData.fromMap({
    'file': await MultipartFile.fromFile(file.path, filename: fileName),
  });
  var dio = Dio();
  var response = await dio.post('https://www.pgyer.com/apiv1/app/upload', data: formData);
  // await dio.post('https://www.pgyer.com/apiv1/app/upload');
  var model = ResponseModel.fromJson(response.data);
  print(model.code);
}
