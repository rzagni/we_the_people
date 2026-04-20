part of 'app.dart';

class ListUserDevicesByUserVariablesBuilder {
  String userId;

  final FirebaseDataConnect _dataConnect;
  ListUserDevicesByUserVariablesBuilder(this._dataConnect, {required  this.userId,});
  Deserializer<ListUserDevicesByUserData> dataDeserializer = (dynamic json)  => ListUserDevicesByUserData.fromJson(jsonDecode(json));
  Serializer<ListUserDevicesByUserVariables> varsSerializer = (ListUserDevicesByUserVariables vars) => jsonEncode(vars.toJson());
  Future<QueryResult<ListUserDevicesByUserData, ListUserDevicesByUserVariables>> execute({QueryFetchPolicy fetchPolicy = QueryFetchPolicy.preferCache}) {
    return ref().execute(fetchPolicy: fetchPolicy);
  }

  QueryRef<ListUserDevicesByUserData, ListUserDevicesByUserVariables> ref() {
    ListUserDevicesByUserVariables vars= ListUserDevicesByUserVariables(userId: userId,);
    return _dataConnect.query("ListUserDevicesByUser", dataDeserializer, varsSerializer, vars);
  }
}

@immutable
class ListUserDevicesByUserUserDevices {
  final String id;
  final String userId;
  final String fcmToken;
  final EnumValue<DevicePlatform> platform;
  final bool notificationsEnabled;
  ListUserDevicesByUserUserDevices.fromJson(dynamic json):
  
  id = nativeFromJson<String>(json['id']),
  userId = nativeFromJson<String>(json['userId']),
  fcmToken = nativeFromJson<String>(json['fcmToken']),
  platform = devicePlatformDeserializer(json['platform']),
  notificationsEnabled = nativeFromJson<bool>(json['notificationsEnabled']);
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final ListUserDevicesByUserUserDevices otherTyped = other as ListUserDevicesByUserUserDevices;
    return id == otherTyped.id && 
    userId == otherTyped.userId && 
    fcmToken == otherTyped.fcmToken && 
    platform == otherTyped.platform && 
    notificationsEnabled == otherTyped.notificationsEnabled;
    
  }
  @override
  int get hashCode => Object.hashAll([id.hashCode, userId.hashCode, fcmToken.hashCode, platform.hashCode, notificationsEnabled.hashCode]);
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['id'] = nativeToJson<String>(id);
    json['userId'] = nativeToJson<String>(userId);
    json['fcmToken'] = nativeToJson<String>(fcmToken);
    json['platform'] = 
    devicePlatformSerializer(platform)
    ;
    json['notificationsEnabled'] = nativeToJson<bool>(notificationsEnabled);
    return json;
  }

  ListUserDevicesByUserUserDevices({
    required this.id,
    required this.userId,
    required this.fcmToken,
    required this.platform,
    required this.notificationsEnabled,
  });
}

@immutable
class ListUserDevicesByUserData {
  final List<ListUserDevicesByUserUserDevices> userDevices;
  ListUserDevicesByUserData.fromJson(dynamic json):
  
  userDevices = (json['userDevices'] as List<dynamic>)
        .map((e) => ListUserDevicesByUserUserDevices.fromJson(e))
        .toList();
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final ListUserDevicesByUserData otherTyped = other as ListUserDevicesByUserData;
    return userDevices == otherTyped.userDevices;
    
  }
  @override
  int get hashCode => userDevices.hashCode;
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['userDevices'] = userDevices.map((e) => e.toJson()).toList();
    return json;
  }

  ListUserDevicesByUserData({
    required this.userDevices,
  });
}

@immutable
class ListUserDevicesByUserVariables {
  final String userId;
  @Deprecated('fromJson is deprecated for Variable classes as they are no longer required for deserialization.')
  ListUserDevicesByUserVariables.fromJson(Map<String, dynamic> json):
  
  userId = nativeFromJson<String>(json['userId']);
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final ListUserDevicesByUserVariables otherTyped = other as ListUserDevicesByUserVariables;
    return userId == otherTyped.userId;
    
  }
  @override
  int get hashCode => userId.hashCode;
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['userId'] = nativeToJson<String>(userId);
    return json;
  }

  ListUserDevicesByUserVariables({
    required this.userId,
  });
}

