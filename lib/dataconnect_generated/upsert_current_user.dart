part of 'generated.dart';

class UpsertCurrentUserVariablesBuilder {
  String email;

  final FirebaseDataConnect _dataConnect;
  UpsertCurrentUserVariablesBuilder(this._dataConnect, {required  this.email,});
  Deserializer<UpsertCurrentUserData> dataDeserializer = (dynamic json)  => UpsertCurrentUserData.fromJson(jsonDecode(json));
  Serializer<UpsertCurrentUserVariables> varsSerializer = (UpsertCurrentUserVariables vars) => jsonEncode(vars.toJson());
  Future<OperationResult<UpsertCurrentUserData, UpsertCurrentUserVariables>> execute() {
    return ref().execute();
  }

  MutationRef<UpsertCurrentUserData, UpsertCurrentUserVariables> ref() {
    UpsertCurrentUserVariables vars= UpsertCurrentUserVariables(email: email,);
    return _dataConnect.mutation("UpsertCurrentUser", dataDeserializer, varsSerializer, vars);
  }
}

@immutable
class UpsertCurrentUserAppUserUpsert {
  final String id;
  UpsertCurrentUserAppUserUpsert.fromJson(dynamic json):
  
  id = nativeFromJson<String>(json['id']);
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final UpsertCurrentUserAppUserUpsert otherTyped = other as UpsertCurrentUserAppUserUpsert;
    return id == otherTyped.id;
    
  }
  @override
  int get hashCode => id.hashCode;
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['id'] = nativeToJson<String>(id);
    return json;
  }

  UpsertCurrentUserAppUserUpsert({
    required this.id,
  });
}

@immutable
class UpsertCurrentUserData {
  final UpsertCurrentUserAppUserUpsert appUser_upsert;
  UpsertCurrentUserData.fromJson(dynamic json):
  
  appUser_upsert = UpsertCurrentUserAppUserUpsert.fromJson(json['appUser_upsert']);
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final UpsertCurrentUserData otherTyped = other as UpsertCurrentUserData;
    return appUser_upsert == otherTyped.appUser_upsert;
    
  }
  @override
  int get hashCode => appUser_upsert.hashCode;
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['appUser_upsert'] = appUser_upsert.toJson();
    return json;
  }

  UpsertCurrentUserData({
    required this.appUser_upsert,
  });
}

@immutable
class UpsertCurrentUserVariables {
  final String email;
  @Deprecated('fromJson is deprecated for Variable classes as they are no longer required for deserialization.')
  UpsertCurrentUserVariables.fromJson(Map<String, dynamic> json):
  
  email = nativeFromJson<String>(json['email']);
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final UpsertCurrentUserVariables otherTyped = other as UpsertCurrentUserVariables;
    return email == otherTyped.email;
    
  }
  @override
  int get hashCode => email.hashCode;
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['email'] = nativeToJson<String>(email);
    return json;
  }

  UpsertCurrentUserVariables({
    required this.email,
  });
}

