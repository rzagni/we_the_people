part of 'app.dart';

class ListMyUserDevicesVariablesBuilder {
  
  final FirebaseDataConnect _dataConnect;
  ListMyUserDevicesVariablesBuilder(this._dataConnect, );
  Deserializer<ListMyUserDevicesData> dataDeserializer = (dynamic json)  => ListMyUserDevicesData.fromJson(jsonDecode(json));
  
  Future<QueryResult<ListMyUserDevicesData, void>> execute({QueryFetchPolicy fetchPolicy = QueryFetchPolicy.preferCache}) {
    return ref().execute(fetchPolicy: fetchPolicy);
  }

  QueryRef<ListMyUserDevicesData, void> ref() {
    
    return _dataConnect.query("ListMyUserDevices", dataDeserializer, emptySerializer, null);
  }
}

@immutable
class ListMyUserDevicesUserDevices {
  final String id;
  final String userId;
  final String fcmToken;
  final EnumValue<DevicePlatform> platform;
  final bool notificationsEnabled;
  ListMyUserDevicesUserDevices.fromJson(dynamic json):
  
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

    final ListMyUserDevicesUserDevices otherTyped = other as ListMyUserDevicesUserDevices;
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

  ListMyUserDevicesUserDevices({
    required this.id,
    required this.userId,
    required this.fcmToken,
    required this.platform,
    required this.notificationsEnabled,
  });
}

@immutable
class ListMyUserDevicesData {
  final List<ListMyUserDevicesUserDevices> userDevices;
  ListMyUserDevicesData.fromJson(dynamic json):
  
  userDevices = (json['userDevices'] as List<dynamic>)
        .map((e) => ListMyUserDevicesUserDevices.fromJson(e))
        .toList();
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final ListMyUserDevicesData otherTyped = other as ListMyUserDevicesData;
    return userDevices == otherTyped.userDevices;
    
  }
  @override
  int get hashCode => userDevices.hashCode;
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['userDevices'] = userDevices.map((e) => e.toJson()).toList();
    return json;
  }

  ListMyUserDevicesData({
    required this.userDevices,
  });
}

