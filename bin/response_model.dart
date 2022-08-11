/// @date: 2022/8/11 23:40
/// @author: kevin
/// @description: dart

class ResponseModel {
  int code;
  String message;
  Data data;

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
      data['data'] = this.data.toJson();
    }
    return data;
  }
}

class Data {
  String appKey;
  String userKey;
  String appType;
  String appIsLastest;
  String appFileSize;
  String appName;
  String appVersion;
  String appVersionNo;
  String appBuildVersion;
  String appIdentifier;
  String appIcon;
  String appDescription;
  String appUpdateDescription;
  String appScreenshots;
  String appShortcutUrl;
  String appCreated;
  String appUpdated;
  String appQRCodeURL;

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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['appKey'] = this.appKey;
    data['userKey'] = this.userKey;
    data['appType'] = this.appType;
    data['appIsLastest'] = this.appIsLastest;
    data['appFileSize'] = this.appFileSize;
    data['appName'] = this.appName;
    data['appVersion'] = this.appVersion;
    data['appVersionNo'] = this.appVersionNo;
    data['appBuildVersion'] = this.appBuildVersion;
    data['appIdentifier'] = this.appIdentifier;
    data['appIcon'] = this.appIcon;
    data['appDescription'] = this.appDescription;
    data['appUpdateDescription'] = this.appUpdateDescription;
    data['appScreenshots'] = this.appScreenshots;
    data['appShortcutUrl'] = this.appShortcutUrl;
    data['appCreated'] = this.appCreated;
    data['appUpdated'] = this.appUpdated;
    data['appQRCodeURL'] = this.appQRCodeURL;
    return data;
  }
}

extension MyString on String {
  bool isLengthBigThan10() {
    return length > 10;
  }
}
