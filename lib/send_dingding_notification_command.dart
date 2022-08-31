import 'dart:async';

import 'package:args/command_runner.dart';

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
    final token = int.parse(argResults?['token'] ?? '20');
    print(token);
  }
}
