import 'dart:async';

import 'package:args/command_runner.dart';
import 'package:dio/dio.dart';

/// @date: 2022/8/31 16:41
/// @author: kevin
/// @description: dart

class SendDingDingNotificationCommand extends Command {
  SendDingDingNotificationCommand() {
    argParser.addOption('token', help: 'access token');
    argParser.addOption('message', help: 'message');
  }

  @override
  String get description => 'send DingDing notification';

  @override
  String get name => 'sendDingDing';

  @override
  FutureOr<void> run() {
    print(argResults?.arguments);
    print(argParser.usage);
    final token = argResults?['token'] ?? '';
    final message = argResults?['message'] ?? '';
    print(token);
    print(message);
    sendNotification(token, message);
  }

  /// @params
  /// @params
  /// @return
  /// @desc
  void sendNotification(String token, String message) async {
    var formData = FormData.fromMap(
      {
        'msgtype': 'markdown',
        'markdown': {
          'title': 'App 构建',
          'text': message,
        }
      },
    );
    await Dio().post(
      'https://oapi.dingtalk.com/robot/send?access_token=$token',
      data: formData,
    );
  }
}
