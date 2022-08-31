import 'dart:io';

import 'package:args/args.dart';
import 'package:args/command_runner.dart';
import 'package:build_outputs_script/send_dingding_notification_command.dart';
import 'package:build_outputs_script/upload_pyger_command.dart';
import 'package:dio/dio.dart';

import '../lib/response_model.dart';

void main(List<String> arguments) async {
  // print(arguments);
  // var parser = ArgParser()
  //   ..addOption('type', abbr: 't')
  //   ..addOption('file', abbr: 'f')
  //   ..addFlag('help', abbr: 'h', help: 'Print out usage instructions');
  //
  // final result = parser.parse(arguments);
  //
  // if (result.wasParsed('help')) {
  //   print(parser.usage);
  //   exit(0);
  // }
  //
  // if (result.wasParsed('type')) {
  //   print(result['type']);
  // }
  // if (result.wasParsed('file')) {
  //   print(result['file']);
  // }
  // // print(parser.usage);
  //
  // return;
  //
  // final res = await File('/Users/kevin/flutter_project/build_outputs_script/bin/config.txt').readAsLinesSync();
  //
  // final configList = res
  //     .map(
  //       (e) => e.split('=').last,
  //     )
  //     .toList();
  //
  // print(configList);
  //
  // switch (arguments.first) {
  //   case 'uploadToPyger':
  //     print(arguments.first);
  //     // 获取uKey _apiKey
  //     final uKey = configList.first;
  //     final aKey = configList[1];
  //     final filePath = arguments.last;
  //
  //     print(uKey);
  //     print(aKey);
  //     print(filePath);
  //
  //     uploadFileToPyger(
  //       aKey: aKey,
  //       uKey: uKey,
  //       filePath: filePath,
  //       updateDescription: '',
  //     );
  //     break;
  //   case 'uploadToAliOSS':
  //     print(arguments.first);
  //     break;
  //   case 'sendDingDingNotification':
  //     // 获取钉钉token 发送信息
  //     final token = configList.last;
  //     print('token====$token');
  //     break;
  //   default:
  //     print(arguments.first);
  //     break;
  // }

  // uploadFileToPyger(map);

  final runner = CommandRunner('build', 'handle outputs file')
    ..addCommand(UploadPygerCommand())
    ..addCommand(SendDingDingNotificationCommand());

  await runner.run(arguments);
}

/// @params
/// @params
/// @return
/// @desc 上传蒲公英
void uploadFileToPyger({required String uKey, required String aKey, required String filePath, required String updateDescription}) async {
  // var path = getFilePath();
  var file = File(filePath);
  var fileName = file.path.split('/').last;
  var formData = FormData.fromMap(
    {
      'file': await MultipartFile.fromFile(file.path, filename: fileName),
      'uKey': uKey,
      '_api_key': aKey,
      'updateDescription': updateDescription,
    },
  );
  var dio = Dio();
  var response = await dio.post(
    'https://www.pgyer.com/apiv1/app/upload',
    data: formData,
    onReceiveProgress: (rec, total) {
      print(rec / total);
    },
  );
  // await dio.post('https://www.pgyer.com/apiv1/app/upload');
  var model = ResponseModel.fromJson(response.data);
  print(model.data?.appQRCodeURL);
}

/// @params
/// @params
/// @return
/// @desc
void uploadToFir() {
  var formData = FormData.fromMap({
    'type': 'android',
    'bundle_id': '',
    'api_token': '',
  });
}

/// @params
/// @params
/// @return
/// @desc 上传阿里云
void uploadFileToAliOSS(map) async {
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
  print(model.data?.appQRCodeURL);
}

/// @return void
/// @desc  发送钉钉通知
void sendDingDingNotification() {}
