part of 'app.dart';

class CompleteOnboardingVariablesBuilder {
  String email;
  String zipCode;
  String city;
  String state;
  String language;
  bool notificationsEnabled;

  final FirebaseDataConnect _dataConnect;
  CompleteOnboardingVariablesBuilder(this._dataConnect, {required  this.email,required  this.zipCode,required  this.city,required  this.state,required  this.language,required  this.notificationsEnabled,});
  Deserializer<CompleteOnboardingData> dataDeserializer = (dynamic json)  => CompleteOnboardingData.fromJson(jsonDecode(json));
  Serializer<CompleteOnboardingVariables> varsSerializer = (CompleteOnboardingVariables vars) => jsonEncode(vars.toJson());
  Future<OperationResult<CompleteOnboardingData, CompleteOnboardingVariables>> execute() {
    return ref().execute();
  }

  MutationRef<CompleteOnboardingData, CompleteOnboardingVariables> ref() {
    CompleteOnboardingVariables vars= CompleteOnboardingVariables(email: email,zipCode: zipCode,city: city,state: state,language: language,notificationsEnabled: notificationsEnabled,);
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
  final String zipCode;
  final String city;
  final String state;
  final String language;
  final bool notificationsEnabled;
  @Deprecated('fromJson is deprecated for Variable classes as they are no longer required for deserialization.')
  CompleteOnboardingVariables.fromJson(Map<String, dynamic> json):
  
  email = nativeFromJson<String>(json['email']),
  zipCode = nativeFromJson<String>(json['zipCode']),
  city = nativeFromJson<String>(json['city']),
  state = nativeFromJson<String>(json['state']),
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
    zipCode == otherTyped.zipCode && 
    city == otherTyped.city && 
    state == otherTyped.state && 
    language == otherTyped.language && 
    notificationsEnabled == otherTyped.notificationsEnabled;
    
  }
  @override
  int get hashCode => Object.hashAll([email.hashCode, zipCode.hashCode, city.hashCode, state.hashCode, language.hashCode, notificationsEnabled.hashCode]);
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['email'] = nativeToJson<String>(email);
    json['zipCode'] = nativeToJson<String>(zipCode);
    json['city'] = nativeToJson<String>(city);
    json['state'] = nativeToJson<String>(state);
    json['language'] = nativeToJson<String>(language);
    json['notificationsEnabled'] = nativeToJson<bool>(notificationsEnabled);
    return json;
  }

  CompleteOnboardingVariables({
    required this.email,
    required this.zipCode,
    required this.city,
    required this.state,
    required this.language,
    required this.notificationsEnabled,
  });
}

