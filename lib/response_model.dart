/// @date: 2022/8/11 23:40
/// @author: kevin
/// @description: dart

class ResponseModel {
  int? code;
  String? message;
  Data? data;

  ResponseModel({this.code, this.message, this.data});

  ResponseModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    message = json['message'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['code'] = code;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  String? appKey;
  String? userKey;
  String? appType;
  String? appIsLastest;
  String? appFileSize;
  String? appName;
  String? appVersion;
  String? appVersionNo;
  String? appBuildVersion;
  String? appIdentifier;
  String? appIcon;
  String? appDescription;
  String? appUpdateDescription;
  String? appScreenshots;
  String? appShortcutUrl;
  String? appCreated;
  String? appUpdated;
  String? appQRCodeURL;

  Data(
      {this.appKey,
      this.userKey,
      this.appType,
      this.appIsLastest,
      this.appFileSize,
      this.appName,
      this.appVersion,
      this.appVersionNo,
      this.appBuildVersion,
      this.appIdentifier,
      this.appIcon,
      this.appDescription,
      this.appUpdateDescription,
      this.appScreenshots,
      this.appShortcutUrl,
      this.appCreated,
      this.appUpdated,
      this.appQRCodeURL});

  Data.fromJson(Map<String, dynamic> json) {
    appKey = json['appKey'];
    userKey = json['userKey'];
    appType = json['appType'];
    appIsLastest = json['appIsLastest'];
    appFileSize = json['appFileSize'];
    appName = json['appName'];
    appVersion = json['appVersion'];
    appVersionNo = json['appVersionNo'];
    appBuildVersion = json['appBuildVersion'];
    appIdentifier = json['appIdentifier'];
    appIcon = json['appIcon'];
    appDescription = json['appDescription'];
    appUpdateDescription = json['appUpdateDescription'];
    appScreenshots = json['appScreenshots'];
    appShortcutUrl = json['appShortcutUrl'];
    appCreated = json['appCreated'];
    appUpdated = json['appUpdated'];
    appQRCodeURL = json['appQRCodeURL'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['appKey'] = appKey;
    data['userKey'] = userKey;
    data['appType'] = appType;
    data['appIsLastest'] = appIsLastest;
    data['appFileSize'] = appFileSize;
    data['appName'] = appName;
    data['appVersion'] = appVersion;
    data['appVersionNo'] = appVersionNo;
    data['appBuildVersion'] = appBuildVersion;
    data['appIdentifier'] = appIdentifier;
    data['appIcon'] = appIcon;
    data['appDescription'] = appDescription;
    data['appUpdateDescription'] = appUpdateDescription;
    data['appScreenshots'] = appScreenshots;
    data['appShortcutUrl'] = appShortcutUrl;
    data['appCreated'] = appCreated;
    data['appUpdated'] = appUpdated;
    data['appQRCodeURL'] = appQRCodeURL;
    return data;
  }
}
