import 'package:args/command_runner.dart';

/// @date: 2022/8/31 15:10
/// @author: kevin
/// @description: dart

class UploadPygerCommand extends Command {
  UploadPygerCommand() {
    argParser.addOption('aKey', help: 'pyger _api_key');
    argParser.addOption('uKey', help: 'pyger uKey');
  }

  @override
  String get description => 'upload file to pyger';

  @override
  String get name => 'uploadToPyger';

  @override
  void run() {
    // argParser.addOption('aKey', abbr: 'ak');
    // argParser.addOption('uKey', abbr: 'uk');
    // argParser.addOption('file', abbr: 'f');
    print(argResults?.arguments);
    print(argParser.usage);
    final size = int.parse(argResults?['size'] ?? '20');
    print(size);
  }
}
