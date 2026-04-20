part of 'app.dart';

class GetCurrentUserVariablesBuilder {
  
  final FirebaseDataConnect _dataConnect;
  GetCurrentUserVariablesBuilder(this._dataConnect, );
  Deserializer<GetCurrentUserData> dataDeserializer = (dynamic json)  => GetCurrentUserData.fromJson(jsonDecode(json));
  
  Future<QueryResult<GetCurrentUserData, void>> execute({QueryFetchPolicy fetchPolicy = QueryFetchPolicy.preferCache}) {
    return ref().execute(fetchPolicy: fetchPolicy);
  }

  QueryRef<GetCurrentUserData, void> ref() {
    
    return _dataConnect.query("GetCurrentUser", dataDeserializer, emptySerializer, null);
  }
}

@immutable
class GetCurrentUserAppUsers {
  final String id;
  final String email;
  final bool profileCompleted;
  final String? zipCode;
  final String? city;
  final String? state;
  final String? language;
  final bool notificationsEnabled;
  GetCurrentUserAppUsers.fromJson(dynamic json):
  
  id = nativeFromJson<String>(json['id']),
  email = nativeFromJson<String>(json['email']),
  profileCompleted = nativeFromJson<bool>(json['profileCompleted']),
  zipCode = json['zipCode'] == null ? null : nativeFromJson<String>(json['zipCode']),
  city = json['city'] == null ? null : nativeFromJson<String>(json['city']),
  state = json['state'] == null ? null : nativeFromJson<String>(json['state']),
  language = json['language'] == null ? null : nativeFromJson<String>(json['language']),
  notificationsEnabled = nativeFromJson<bool>(json['notificationsEnabled']);
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final GetCurrentUserAppUsers otherTyped = other as GetCurrentUserAppUsers;
    return id == otherTyped.id && 
    email == otherTyped.email && 
    profileCompleted == otherTyped.profileCompleted && 
    zipCode == otherTyped.zipCode && 
    city == otherTyped.city && 
    state == otherTyped.state && 
    language == otherTyped.language && 
    notificationsEnabled == otherTyped.notificationsEnabled;
    
  }
  @override
  int get hashCode => Object.hashAll([id.hashCode, email.hashCode, profileCompleted.hashCode, zipCode.hashCode, city.hashCode, state.hashCode, language.hashCode, notificationsEnabled.hashCode]);
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['id'] = nativeToJson<String>(id);
    json['email'] = nativeToJson<String>(email);
    json['profileCompleted'] = nativeToJson<bool>(profileCompleted);
    if (zipCode != null) {
      json['zipCode'] = nativeToJson<String?>(zipCode);
    }
    if (city != null) {
      json['city'] = nativeToJson<String?>(city);
    }
    if (state != null) {
      json['state'] = nativeToJson<String?>(state);
    }
    if (language != null) {
      json['language'] = nativeToJson<String?>(language);
    }
    json['notificationsEnabled'] = nativeToJson<bool>(notificationsEnabled);
    return json;
  }

  GetCurrentUserAppUsers({
    required this.id,
    required this.email,
    required this.profileCompleted,
    this.zipCode,
    this.city,
    this.state,
    this.language,
    required this.notificationsEnabled,
  });
}

@immutable
class GetCurrentUserData {
  final List<GetCurrentUserAppUsers> appUsers;
  GetCurrentUserData.fromJson(dynamic json):
  
  appUsers = (json['appUsers'] as List<dynamic>)
        .map((e) => GetCurrentUserAppUsers.fromJson(e))
        .toList();
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final GetCurrentUserData otherTyped = other as GetCurrentUserData;
    return appUsers == otherTyped.appUsers;
    
  }
  @override
  int get hashCode => appUsers.hashCode;
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['appUsers'] = appUsers.map((e) => e.toJson()).toList();
    return json;
  }

  GetCurrentUserData({
    required this.appUsers,
  });
}

