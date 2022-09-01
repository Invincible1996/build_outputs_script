import 'dart:async';

import 'package:args/command_runner.dart';
import 'package:dio/dio.dart';

/// @date: 2022/8/31 16:41
/// @author: kevin
/// @description: dart

class SendDingDingNotificationCommand extends Command {
  SendDingDingNotificationCommand() {
    argParser
      ..addOption('token', help: 'access token')
      ..addOption('msg', help: 'message');
  }

  @override
  String get description => 'send DingDing notification';

  @override
  String get name => 'sendDingDing';

  @override
  FutureOr<void> run() {
    // print(argResults?.arguments);
    // print(argParser.usage);
    final token = argResults?['token'] ?? '';
    final message = argResults?['msg'] ?? '';
    print(token);
    print(message);
    sendNotification(token, message);
  }

  /// @params
  /// @params
  /// @return
  /// @desc
  void sendNotification(String token, String message) async {
    var url = 'https://www.pgyer.com/app/qrcodeHistory/150e86904926ca0b3566125f1ce4411055361a2f263456d46098475a38d26bee';

    var formData = {
      'msgtype': 'markdown',
      'markdown': {
        'title': 'App',
        "text": r'' + message,
      }
    };
    var dio = Dio();
    dio.options = BaseOptions(headers: {
      'Content-type': 'application/json',
    });

    final response = await dio.post(
      'https://oapi.dingtalk.com/robot/send?access_token=$token',
      data: formData,
    );
    print(response.statusCode);
  }
}
