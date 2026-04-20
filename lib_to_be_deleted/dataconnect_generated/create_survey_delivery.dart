part of 'app.dart';

class CreateSurveyDeliveryVariablesBuilder {
  String id;
  String surveyId;
  String userId;
  String deviceId;
  DeliveryStatus status;

  final FirebaseDataConnect _dataConnect;
  CreateSurveyDeliveryVariablesBuilder(this._dataConnect, {required  this.id,required  this.surveyId,required  this.userId,required  this.deviceId,required  this.status,});
  Deserializer<CreateSurveyDeliveryData> dataDeserializer = (dynamic json)  => CreateSurveyDeliveryData.fromJson(jsonDecode(json));
  Serializer<CreateSurveyDeliveryVariables> varsSerializer = (CreateSurveyDeliveryVariables vars) => jsonEncode(vars.toJson());
  Future<OperationResult<CreateSurveyDeliveryData, CreateSurveyDeliveryVariables>> execute() {
    return ref().execute();
  }

  MutationRef<CreateSurveyDeliveryData, CreateSurveyDeliveryVariables> ref() {
    CreateSurveyDeliveryVariables vars= CreateSurveyDeliveryVariables(id: id,surveyId: surveyId,userId: userId,deviceId: deviceId,status: status,);
    return _dataConnect.mutation("CreateSurveyDelivery", dataDeserializer, varsSerializer, vars);
  }
}

@immutable
class CreateSurveyDeliverySurveyDeliveryInsert {
  final String id;
  CreateSurveyDeliverySurveyDeliveryInsert.fromJson(dynamic json):
  
  id = nativeFromJson<String>(json['id']);
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final CreateSurveyDeliverySurveyDeliveryInsert otherTyped = other as CreateSurveyDeliverySurveyDeliveryInsert;
    return id == otherTyped.id;
    
  }
  @override
  int get hashCode => id.hashCode;
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['id'] = nativeToJson<String>(id);
    return json;
  }

  CreateSurveyDeliverySurveyDeliveryInsert({
    required this.id,
  });
}

@immutable
class CreateSurveyDeliveryData {
  final CreateSurveyDeliverySurveyDeliveryInsert surveyDelivery_insert;
  CreateSurveyDeliveryData.fromJson(dynamic json):
  
  surveyDelivery_insert = CreateSurveyDeliverySurveyDeliveryInsert.fromJson(json['surveyDelivery_insert']);
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final CreateSurveyDeliveryData otherTyped = other as CreateSurveyDeliveryData;
    return surveyDelivery_insert == otherTyped.surveyDelivery_insert;
    
  }
  @override
  int get hashCode => surveyDelivery_insert.hashCode;
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['surveyDelivery_insert'] = surveyDelivery_insert.toJson();
    return json;
  }

  CreateSurveyDeliveryData({
    required this.surveyDelivery_insert,
  });
}

@immutable
class CreateSurveyDeliveryVariables {
  final String id;
  final String surveyId;
  final String userId;
  final String deviceId;
  final DeliveryStatus status;
  @Deprecated('fromJson is deprecated for Variable classes as they are no longer required for deserialization.')
  CreateSurveyDeliveryVariables.fromJson(Map<String, dynamic> json):
  
  id = nativeFromJson<String>(json['id']),
  surveyId = nativeFromJson<String>(json['surveyId']),
  userId = nativeFromJson<String>(json['userId']),
  deviceId = nativeFromJson<String>(json['deviceId']),
  status = DeliveryStatus.values.byName(json['status']);
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final CreateSurveyDeliveryVariables otherTyped = other as CreateSurveyDeliveryVariables;
    return id == otherTyped.id && 
    surveyId == otherTyped.surveyId && 
    userId == otherTyped.userId && 
    deviceId == otherTyped.deviceId && 
    status == otherTyped.status;
    
  }
  @override
  int get hashCode => Object.hashAll([id.hashCode, surveyId.hashCode, userId.hashCode, deviceId.hashCode, status.hashCode]);
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['id'] = nativeToJson<String>(id);
    json['surveyId'] = nativeToJson<String>(surveyId);
    json['userId'] = nativeToJson<String>(userId);
    json['deviceId'] = nativeToJson<String>(deviceId);
    json['status'] = 
    status.name
    ;
    return json;
  }

  CreateSurveyDeliveryVariables({
    required this.id,
    required this.surveyId,
    required this.userId,
    required this.deviceId,
    required this.status,
  });
}

