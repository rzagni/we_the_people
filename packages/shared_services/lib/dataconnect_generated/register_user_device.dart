part of 'app.dart';

class RegisterUserDeviceVariablesBuilder {
  String id;
  String fcmToken;
  DevicePlatform platform;
  bool notificationsEnabled;

  final FirebaseDataConnect _dataConnect;
  RegisterUserDeviceVariablesBuilder(this._dataConnect, {required  this.id,required  this.fcmToken,required  this.platform,required  this.notificationsEnabled,});
  Deserializer<RegisterUserDeviceData> dataDeserializer = (dynamic json)  => RegisterUserDeviceData.fromJson(jsonDecode(json));
  Serializer<RegisterUserDeviceVariables> varsSerializer = (RegisterUserDeviceVariables vars) => jsonEncode(vars.toJson());
  Future<OperationResult<RegisterUserDeviceData, RegisterUserDeviceVariables>> execute() {
    return ref().execute();
  }

  MutationRef<RegisterUserDeviceData, RegisterUserDeviceVariables> ref() {
    RegisterUserDeviceVariables vars= RegisterUserDeviceVariables(id: id,fcmToken: fcmToken,platform: platform,notificationsEnabled: notificationsEnabled,);
    return _dataConnect.mutation("RegisterUserDevice", dataDeserializer, varsSerializer, vars);
  }
}

@immutable
class RegisterUserDeviceUserDeviceUpsert {
  final String id;
  RegisterUserDeviceUserDeviceUpsert.fromJson(dynamic json):
  
  id = nativeFromJson<String>(json['id']);
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final RegisterUserDeviceUserDeviceUpsert otherTyped = other as RegisterUserDeviceUserDeviceUpsert;
    return id == otherTyped.id;
    
  }
  @override
  int get hashCode => id.hashCode;
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['id'] = nativeToJson<String>(id);
    return json;
  }

  RegisterUserDeviceUserDeviceUpsert({
    required this.id,
  });
}

@immutable
class RegisterUserDeviceData {
  final RegisterUserDeviceUserDeviceUpsert userDevice_upsert;
  RegisterUserDeviceData.fromJson(dynamic json):
  
  userDevice_upsert = RegisterUserDeviceUserDeviceUpsert.fromJson(json['userDevice_upsert']);
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final RegisterUserDeviceData otherTyped = other as RegisterUserDeviceData;
    return userDevice_upsert == otherTyped.userDevice_upsert;
    
  }
  @override
  int get hashCode => userDevice_upsert.hashCode;
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['userDevice_upsert'] = userDevice_upsert.toJson();
    return json;
  }

  RegisterUserDeviceData({
    required this.userDevice_upsert,
  });
}

@immutable
class RegisterUserDeviceVariables {
  final String id;
  final String fcmToken;
  final DevicePlatform platform;
  final bool notificationsEnabled;
  @Deprecated('fromJson is deprecated for Variable classes as they are no longer required for deserialization.')
  RegisterUserDeviceVariables.fromJson(Map<String, dynamic> json):
  
  id = nativeFromJson<String>(json['id']),
  fcmToken = nativeFromJson<String>(json['fcmToken']),
  platform = DevicePlatform.values.byName(json['platform']),
  notificationsEnabled = nativeFromJson<bool>(json['notificationsEnabled']);
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final RegisterUserDeviceVariables otherTyped = other as RegisterUserDeviceVariables;
    return id == otherTyped.id && 
    fcmToken == otherTyped.fcmToken && 
    platform == otherTyped.platform && 
    notificationsEnabled == otherTyped.notificationsEnabled;
    
  }
  @override
  int get hashCode => Object.hashAll([id.hashCode, fcmToken.hashCode, platform.hashCode, notificationsEnabled.hashCode]);
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['id'] = nativeToJson<String>(id);
    json['fcmToken'] = nativeToJson<String>(fcmToken);
    json['platform'] = 
    platform.name
    ;
    json['notificationsEnabled'] = nativeToJson<bool>(notificationsEnabled);
    return json;
  }

  RegisterUserDeviceVariables({
    required this.id,
    required this.fcmToken,
    required this.platform,
    required this.notificationsEnabled,
  });
}

