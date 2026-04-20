part of 'generated.dart';

class CompleteOnboardingVariablesBuilder {
  String email;
  String region;
  String language;
  bool notificationsEnabled;

  final FirebaseDataConnect _dataConnect;
  CompleteOnboardingVariablesBuilder(this._dataConnect, {required  this.email,required  this.region,required  this.language,required  this.notificationsEnabled,});
  Deserializer<CompleteOnboardingData> dataDeserializer = (dynamic json)  => CompleteOnboardingData.fromJson(jsonDecode(json));
  Serializer<CompleteOnboardingVariables> varsSerializer = (CompleteOnboardingVariables vars) => jsonEncode(vars.toJson());
  Future<OperationResult<CompleteOnboardingData, CompleteOnboardingVariables>> execute() {
    return ref().execute();
  }

  MutationRef<CompleteOnboardingData, CompleteOnboardingVariables> ref() {
    CompleteOnboardingVariables vars= CompleteOnboardingVariables(email: email,region: region,language: language,notificationsEnabled: notificationsEnabled,);
    return _dataConnect.mutation("CompleteOnboarding", dataDeserializer, varsSerializer, vars);
  }
}

@immutable
class CompleteOnboardingAppUserUpsert {
  final String id;
  CompleteOnboardingAppUserUpsert.fromJson(dynamic json):
  
  id = nativeFromJson<String>(json['id']);
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final CompleteOnboardingAppUserUpsert otherTyped = other as CompleteOnboardingAppUserUpsert;
    return id == otherTyped.id;
    
  }
  @override
  int get hashCode => id.hashCode;
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['id'] = nativeToJson<String>(id);
    return json;
  }

  CompleteOnboardingAppUserUpsert({
    required this.id,
  });
}

@immutable
class CompleteOnboardingData {
  final CompleteOnboardingAppUserUpsert appUser_upsert;
  CompleteOnboardingData.fromJson(dynamic json):
  
  appUser_upsert = CompleteOnboardingAppUserUpsert.fromJson(json['appUser_upsert']);
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final CompleteOnboardingData otherTyped = other as CompleteOnboardingData;
    return appUser_upsert == otherTyped.appUser_upsert;
    
  }
  @override
  int get hashCode => appUser_upsert.hashCode;
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['appUser_upsert'] = appUser_upsert.toJson();
    return json;
  }

  CompleteOnboardingData({
    required this.appUser_upsert,
  });
}

@immutable
class CompleteOnboardingVariables {
  final String email;
  final String region;
  final String language;
  final bool notificationsEnabled;
  @Deprecated('fromJson is deprecated for Variable classes as they are no longer required for deserialization.')
  CompleteOnboardingVariables.fromJson(Map<String, dynamic> json):
  
  email = nativeFromJson<String>(json['email']),
  region = nativeFromJson<String>(json['region']),
  language = nativeFromJson<String>(json['language']),
  notificationsEnabled = nativeFromJson<bool>(json['notificationsEnabled']);
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final CompleteOnboardingVariables otherTyped = other as CompleteOnboardingVariables;
    return email == otherTyped.email && 
    region == otherTyped.region && 
    language == otherTyped.language && 
    notificationsEnabled == otherTyped.notificationsEnabled;
    
  }
  @override
  int get hashCode => Object.hashAll([email.hashCode, region.hashCode, language.hashCode, notificationsEnabled.hashCode]);
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['email'] = nativeToJson<String>(email);
    json['region'] = nativeToJson<String>(region);
    json['language'] = nativeToJson<String>(language);
    json['notificationsEnabled'] = nativeToJson<bool>(notificationsEnabled);
    return json;
  }

  CompleteOnboardingVariables({
    required this.email,
    required this.region,
    required this.language,
    required this.notificationsEnabled,
  });
}

