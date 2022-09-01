import 'dart:async';
import 'dart:io';

import 'package:args/command_runner.dart';
import 'package:build_outputs_script/response_model.dart';
import 'package:dio/dio.dart';

/// @date: 2022/8/31 15:10
/// @author: kevin
/// @description: dart

class UploadPygerCommand extends Command {
  UploadPygerCommand() {
    argParser.addOption('aKey', help: 'pyger _api_key');
    argParser.addOption('uKey', help: 'pyger uKey');
    argParser.addOption('desc', help: 'pyger description');
    argParser.addOption('file', help: 'upload file path');
  }

  @override
  String get description => 'upload file to pyger';

  @override
  String get name => 'uploadToPyger';

  @override
  FutureOr<void> run() {
    final aKey = argResults?['aKey'] ?? '';
    final uKey = argResults?['uKey'] ?? '';
    final desc = argResults?['desc'] ?? '';
    final file = argResults?['file'] ?? '';
    uploadFile(aKey, uKey, file, desc);
  }

  Future<void> uploadFile(aKey, uKey, filePath, desc) async {
    var dio = Dio();
    var file = File(filePath);
    var formData = FormData.fromMap(
      {
        'file': await MultipartFile.fromFile(file.path, filename: filePath.split('/').last),
        'uKey': uKey,
        '_api_key': aKey,
        'updateDescription': desc,
      },
    );
    var response = await dio.post(
      'https://www.pgyer.com/apiv1/app/upload',
      data: formData,
      onReceiveProgress: (rec, total) {},
    );
    var model = ResponseModel.fromJson(response.data);
    print(model.data?.appQRCodeURL);
  }
}
