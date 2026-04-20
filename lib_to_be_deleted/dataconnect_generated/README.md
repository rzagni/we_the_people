# dataconnect_generated SDK

## Installation
```sh
flutter pub get firebase_data_connect
flutterfire configure
```
For more information, see [Flutter for Firebase installation documentation](https://firebase.google.com/docs/data-connect/flutter-sdk#use-core).

## Data Connect instance
Each connector creates a static class, with an instance of the `DataConnect` class that can be used to connect to your Data Connect backend and call operations.

### Connecting to the emulator

```dart
String host = 'localhost'; // or your host name
int port = 9399; // or your port number
AppConnector.instance.dataConnect.useDataConnectEmulator(host, port);
```

You can also call queries and mutations by using the connector class.
## Queries

### GetSurveyById
#### Required Arguments
```dart
String id = ...;
AppConnector.instance.getSurveyById(
  id: id,
).execute();
```



#### Return Type
`execute()` returns a `QueryResult<GetSurveyByIdData, GetSurveyByIdVariables>`
```dart
/// Result of an Operation Request (query/mutation).
class OperationResult<Data, Variables> {
  OperationResult(this.dataConnect, this.data, this.ref);
  Data data;
  OperationRef<Data, Variables> ref;
  FirebaseDataConnect dataConnect;
}

/// Result of a query request. Created to hold extra variables in the future.
class QueryResult<Data, Variables> extends OperationResult<Data, Variables> {
  QueryResult(super.dataConnect, super.data, super.ref);
}

final result = await AppConnector.instance.getSurveyById(
  id: id,
);
GetSurveyByIdData data = result.data;
final ref = result.ref;
```

#### Getting the Ref
Each builder returns an `execute` function, which is a helper function that creates a `Ref` object, and executes the underlying operation.
An example of how to use the `Ref` object is shown below:
```dart
String id = ...;

final ref = AppConnector.instance.getSurveyById(
  id: id,
).ref();
ref.execute();

ref.subscribe(...);
```


### ListSurveys
#### Required Arguments
```dart
// No required arguments
AppConnector.instance.listSurveys().execute();
```



#### Return Type
`execute()` returns a `QueryResult<ListSurveysData, void>`
```dart
/// Result of an Operation Request (query/mutation).
class OperationResult<Data, Variables> {
  OperationResult(this.dataConnect, this.data, this.ref);
  Data data;
  OperationRef<Data, Variables> ref;
  FirebaseDataConnect dataConnect;
}

/// Result of a query request. Created to hold extra variables in the future.
class QueryResult<Data, Variables> extends OperationResult<Data, Variables> {
  QueryResult(super.dataConnect, super.data, super.ref);
}

final result = await AppConnector.instance.listSurveys();
ListSurveysData data = result.data;
final ref = result.ref;
```

#### Getting the Ref
Each builder returns an `execute` function, which is a helper function that creates a `Ref` object, and executes the underlying operation.
An example of how to use the `Ref` object is shown below:
```dart
final ref = AppConnector.instance.listSurveys().ref();
ref.execute();

ref.subscribe(...);
```


### ListMyUserDevices
#### Required Arguments
```dart
// No required arguments
AppConnector.instance.listMyUserDevices().execute();
```



#### Return Type
`execute()` returns a `QueryResult<ListMyUserDevicesData, void>`
```dart
/// Result of an Operation Request (query/mutation).
class OperationResult<Data, Variables> {
  OperationResult(this.dataConnect, this.data, this.ref);
  Data data;
  OperationRef<Data, Variables> ref;
  FirebaseDataConnect dataConnect;
}

/// Result of a query request. Created to hold extra variables in the future.
class QueryResult<Data, Variables> extends OperationResult<Data, Variables> {
  QueryResult(super.dataConnect, super.data, super.ref);
}

final result = await AppConnector.instance.listMyUserDevices();
ListMyUserDevicesData data = result.data;
final ref = result.ref;
```

#### Getting the Ref
Each builder returns an `execute` function, which is a helper function that creates a `Ref` object, and executes the underlying operation.
An example of how to use the `Ref` object is shown below:
```dart
final ref = AppConnector.instance.listMyUserDevices().ref();
ref.execute();

ref.subscribe(...);
```


### ListSurveyResponsesBySurvey
#### Required Arguments
```dart
String surveyId = ...;
AppConnector.instance.listSurveyResponsesBySurvey(
  surveyId: surveyId,
).execute();
```



#### Return Type
`execute()` returns a `QueryResult<ListSurveyResponsesBySurveyData, ListSurveyResponsesBySurveyVariables>`
```dart
/// Result of an Operation Request (query/mutation).
class OperationResult<Data, Variables> {
  OperationResult(this.dataConnect, this.data, this.ref);
  Data data;
  OperationRef<Data, Variables> ref;
  FirebaseDataConnect dataConnect;
}

/// Result of a query request. Created to hold extra variables in the future.
class QueryResult<Data, Variables> extends OperationResult<Data, Variables> {
  QueryResult(super.dataConnect, super.data, super.ref);
}

final result = await AppConnector.instance.listSurveyResponsesBySurvey(
  surveyId: surveyId,
);
ListSurveyResponsesBySurveyData data = result.data;
final ref = result.ref;
```

#### Getting the Ref
Each builder returns an `execute` function, which is a helper function that creates a `Ref` object, and executes the underlying operation.
An example of how to use the `Ref` object is shown below:
```dart
String surveyId = ...;

final ref = AppConnector.instance.listSurveyResponsesBySurvey(
  surveyId: surveyId,
).ref();
ref.execute();

ref.subscribe(...);
```


### GetMySurveyResponseByDelivery
#### Required Arguments
```dart
String deliveryId = ...;
AppConnector.instance.getMySurveyResponseByDelivery(
  deliveryId: deliveryId,
).execute();
```



#### Return Type
`execute()` returns a `QueryResult<GetMySurveyResponseByDeliveryData, GetMySurveyResponseByDeliveryVariables>`
```dart
/// Result of an Operation Request (query/mutation).
class OperationResult<Data, Variables> {
  OperationResult(this.dataConnect, this.data, this.ref);
  Data data;
  OperationRef<Data, Variables> ref;
  FirebaseDataConnect dataConnect;
}

/// Result of a query request. Created to hold extra variables in the future.
class QueryResult<Data, Variables> extends OperationResult<Data, Variables> {
  QueryResult(super.dataConnect, super.data, super.ref);
}

final result = await AppConnector.instance.getMySurveyResponseByDelivery(
  deliveryId: deliveryId,
);
GetMySurveyResponseByDeliveryData data = result.data;
final ref = result.ref;
```

#### Getting the Ref
Each builder returns an `execute` function, which is a helper function that creates a `Ref` object, and executes the underlying operation.
An example of how to use the `Ref` object is shown below:
```dart
String deliveryId = ...;

final ref = AppConnector.instance.getMySurveyResponseByDelivery(
  deliveryId: deliveryId,
).ref();
ref.execute();

ref.subscribe(...);
```


### GetCurrentUser
#### Required Arguments
```dart
// No required arguments
AppConnector.instance.getCurrentUser().execute();
```



#### Return Type
`execute()` returns a `QueryResult<GetCurrentUserData, void>`
```dart
/// Result of an Operation Request (query/mutation).
class OperationResult<Data, Variables> {
  OperationResult(this.dataConnect, this.data, this.ref);
  Data data;
  OperationRef<Data, Variables> ref;
  FirebaseDataConnect dataConnect;
}

/// Result of a query request. Created to hold extra variables in the future.
class QueryResult<Data, Variables> extends OperationResult<Data, Variables> {
  QueryResult(super.dataConnect, super.data, super.ref);
}

final result = await AppConnector.instance.getCurrentUser();
GetCurrentUserData data = result.data;
final ref = result.ref;
```

#### Getting the Ref
Each builder returns an `execute` function, which is a helper function that creates a `Ref` object, and executes the underlying operation.
An example of how to use the `Ref` object is shown below:
```dart
final ref = AppConnector.instance.getCurrentUser().ref();
ref.execute();

ref.subscribe(...);
```

## Mutations

### CreateSurvey
#### Required Arguments
```dart
String id = ...;
String question = ...;
SurveyStatus status = ...;
String createdBy = ...;
AppConnector.instance.createSurvey(
  id: id,
  question: question,
  status: status,
  createdBy: createdBy,
).execute();
```

#### Optional Arguments
We return a builder for each query. For CreateSurvey, we created `CreateSurveyBuilder`. For queries and mutations with optional parameters, we return a builder class.
The builder pattern allows Data Connect to distinguish between fields that haven't been set and fields that have been set to null. A field can be set by calling its respective setter method like below:
```dart
class CreateSurveyVariablesBuilder {
  ...
   CreateSurveyVariablesBuilder language(String? t) {
   _language.value = t;
   return this;
  }
  CreateSurveyVariablesBuilder region(String? t) {
   _region.value = t;
   return this;
  }
  CreateSurveyVariablesBuilder topic(String? t) {
   _topic.value = t;
   return this;
  }

  ...
}
AppConnector.instance.createSurvey(
  id: id,
  question: question,
  status: status,
  createdBy: createdBy,
)
.language(language)
.region(region)
.topic(topic)
.execute();
```

#### Return Type
`execute()` returns a `OperationResult<CreateSurveyData, CreateSurveyVariables>`
```dart
/// Result of an Operation Request (query/mutation).
class OperationResult<Data, Variables> {
  OperationResult(this.dataConnect, this.data, this.ref);
  Data data;
  OperationRef<Data, Variables> ref;
  FirebaseDataConnect dataConnect;
}

final result = await AppConnector.instance.createSurvey(
  id: id,
  question: question,
  status: status,
  createdBy: createdBy,
);
CreateSurveyData data = result.data;
final ref = result.ref;
```

#### Getting the Ref
Each builder returns an `execute` function, which is a helper function that creates a `Ref` object, and executes the underlying operation.
An example of how to use the `Ref` object is shown below:
```dart
String id = ...;
String question = ...;
SurveyStatus status = ...;
String createdBy = ...;

final ref = AppConnector.instance.createSurvey(
  id: id,
  question: question,
  status: status,
  createdBy: createdBy,
).ref();
ref.execute();
```


### RegisterUserDevice
#### Required Arguments
```dart
String id = ...;
String fcmToken = ...;
DevicePlatform platform = ...;
bool notificationsEnabled = ...;
AppConnector.instance.registerUserDevice(
  id: id,
  fcmToken: fcmToken,
  platform: platform,
  notificationsEnabled: notificationsEnabled,
).execute();
```



#### Return Type
`execute()` returns a `OperationResult<RegisterUserDeviceData, RegisterUserDeviceVariables>`
```dart
/// Result of an Operation Request (query/mutation).
class OperationResult<Data, Variables> {
  OperationResult(this.dataConnect, this.data, this.ref);
  Data data;
  OperationRef<Data, Variables> ref;
  FirebaseDataConnect dataConnect;
}

final result = await AppConnector.instance.registerUserDevice(
  id: id,
  fcmToken: fcmToken,
  platform: platform,
  notificationsEnabled: notificationsEnabled,
);
RegisterUserDeviceData data = result.data;
final ref = result.ref;
```

#### Getting the Ref
Each builder returns an `execute` function, which is a helper function that creates a `Ref` object, and executes the underlying operation.
An example of how to use the `Ref` object is shown below:
```dart
String id = ...;
String fcmToken = ...;
DevicePlatform platform = ...;
bool notificationsEnabled = ...;

final ref = AppConnector.instance.registerUserDevice(
  id: id,
  fcmToken: fcmToken,
  platform: platform,
  notificationsEnabled: notificationsEnabled,
).ref();
ref.execute();
```


### CreateSurveyDelivery
#### Required Arguments
```dart
String id = ...;
String surveyId = ...;
String userId = ...;
String deviceId = ...;
DeliveryStatus status = ...;
AppConnector.instance.createSurveyDelivery(
  id: id,
  surveyId: surveyId,
  userId: userId,
  deviceId: deviceId,
  status: status,
).execute();
```



#### Return Type
`execute()` returns a `OperationResult<CreateSurveyDeliveryData, CreateSurveyDeliveryVariables>`
```dart
/// Result of an Operation Request (query/mutation).
class OperationResult<Data, Variables> {
  OperationResult(this.dataConnect, this.data, this.ref);
  Data data;
  OperationRef<Data, Variables> ref;
  FirebaseDataConnect dataConnect;
}

final result = await AppConnector.instance.createSurveyDelivery(
  id: id,
  surveyId: surveyId,
  userId: userId,
  deviceId: deviceId,
  status: status,
);
CreateSurveyDeliveryData data = result.data;
final ref = result.ref;
```

#### Getting the Ref
Each builder returns an `execute` function, which is a helper function that creates a `Ref` object, and executes the underlying operation.
An example of how to use the `Ref` object is shown below:
```dart
String id = ...;
String surveyId = ...;
String userId = ...;
String deviceId = ...;
DeliveryStatus status = ...;

final ref = AppConnector.instance.createSurveyDelivery(
  id: id,
  surveyId: surveyId,
  userId: userId,
  deviceId: deviceId,
  status: status,
).ref();
ref.execute();
```


### MarkSurveyDeliveryOpened
#### Required Arguments
```dart
String deliveryId = ...;
AppConnector.instance.markSurveyDeliveryOpened(
  deliveryId: deliveryId,
).execute();
```



#### Return Type
`execute()` returns a `OperationResult<MarkSurveyDeliveryOpenedData, MarkSurveyDeliveryOpenedVariables>`
```dart
/// Result of an Operation Request (query/mutation).
class OperationResult<Data, Variables> {
  OperationResult(this.dataConnect, this.data, this.ref);
  Data data;
  OperationRef<Data, Variables> ref;
  FirebaseDataConnect dataConnect;
}

final result = await AppConnector.instance.markSurveyDeliveryOpened(
  deliveryId: deliveryId,
);
MarkSurveyDeliveryOpenedData data = result.data;
final ref = result.ref;
```

#### Getting the Ref
Each builder returns an `execute` function, which is a helper function that creates a `Ref` object, and executes the underlying operation.
An example of how to use the `Ref` object is shown below:
```dart
String deliveryId = ...;

final ref = AppConnector.instance.markSurveyDeliveryOpened(
  deliveryId: deliveryId,
).ref();
ref.execute();
```


### SubmitSurveyResponse
#### Required Arguments
```dart
String id = ...;
String surveyId = ...;
String deliveryId = ...;
SurveyAnswer answer = ...;
AppConnector.instance.submitSurveyResponse(
  id: id,
  surveyId: surveyId,
  deliveryId: deliveryId,
  answer: answer,
).execute();
```



#### Return Type
`execute()` returns a `OperationResult<SubmitSurveyResponseData, SubmitSurveyResponseVariables>`
```dart
/// Result of an Operation Request (query/mutation).
class OperationResult<Data, Variables> {
  OperationResult(this.dataConnect, this.data, this.ref);
  Data data;
  OperationRef<Data, Variables> ref;
  FirebaseDataConnect dataConnect;
}

final result = await AppConnector.instance.submitSurveyResponse(
  id: id,
  surveyId: surveyId,
  deliveryId: deliveryId,
  answer: answer,
);
SubmitSurveyResponseData data = result.data;
final ref = result.ref;
```

#### Getting the Ref
Each builder returns an `execute` function, which is a helper function that creates a `Ref` object, and executes the underlying operation.
An example of how to use the `Ref` object is shown below:
```dart
String id = ...;
String surveyId = ...;
String deliveryId = ...;
SurveyAnswer answer = ...;

final ref = AppConnector.instance.submitSurveyResponse(
  id: id,
  surveyId: surveyId,
  deliveryId: deliveryId,
  answer: answer,
).ref();
ref.execute();
```


### MarkSurveyDeliveryAnswered
#### Required Arguments
```dart
String deliveryId = ...;
AppConnector.instance.markSurveyDeliveryAnswered(
  deliveryId: deliveryId,
).execute();
```



#### Return Type
`execute()` returns a `OperationResult<MarkSurveyDeliveryAnsweredData, MarkSurveyDeliveryAnsweredVariables>`
```dart
/// Result of an Operation Request (query/mutation).
class OperationResult<Data, Variables> {
  OperationResult(this.dataConnect, this.data, this.ref);
  Data data;
  OperationRef<Data, Variables> ref;
  FirebaseDataConnect dataConnect;
}

final result = await AppConnector.instance.markSurveyDeliveryAnswered(
  deliveryId: deliveryId,
);
MarkSurveyDeliveryAnsweredData data = result.data;
final ref = result.ref;
```

#### Getting the Ref
Each builder returns an `execute` function, which is a helper function that creates a `Ref` object, and executes the underlying operation.
An example of how to use the `Ref` object is shown below:
```dart
String deliveryId = ...;

final ref = AppConnector.instance.markSurveyDeliveryAnswered(
  deliveryId: deliveryId,
).ref();
ref.execute();
```


### UpsertCurrentUser
#### Required Arguments
```dart
String email = ...;
AppConnector.instance.upsertCurrentUser(
  email: email,
).execute();
```



#### Return Type
`execute()` returns a `OperationResult<UpsertCurrentUserData, UpsertCurrentUserVariables>`
```dart
/// Result of an Operation Request (query/mutation).
class OperationResult<Data, Variables> {
  OperationResult(this.dataConnect, this.data, this.ref);
  Data data;
  OperationRef<Data, Variables> ref;
  FirebaseDataConnect dataConnect;
}

final result = await AppConnector.instance.upsertCurrentUser(
  email: email,
);
UpsertCurrentUserData data = result.data;
final ref = result.ref;
```

#### Getting the Ref
Each builder returns an `execute` function, which is a helper function that creates a `Ref` object, and executes the underlying operation.
An example of how to use the `Ref` object is shown below:
```dart
String email = ...;

final ref = AppConnector.instance.upsertCurrentUser(
  email: email,
).ref();
ref.execute();
```


### CompleteOnboarding
#### Required Arguments
```dart
String email = ...;
String zipCode = ...;
String city = ...;
String state = ...;
String language = ...;
bool notificationsEnabled = ...;
AppConnector.instance.completeOnboarding(
  email: email,
  zipCode: zipCode,
  city: city,
  state: state,
  language: language,
  notificationsEnabled: notificationsEnabled,
).execute();
```



#### Return Type
`execute()` returns a `OperationResult<CompleteOnboardingData, CompleteOnboardingVariables>`
```dart
/// Result of an Operation Request (query/mutation).
class OperationResult<Data, Variables> {
  OperationResult(this.dataConnect, this.data, this.ref);
  Data data;
  OperationRef<Data, Variables> ref;
  FirebaseDataConnect dataConnect;
}

final result = await AppConnector.instance.completeOnboarding(
  email: email,
  zipCode: zipCode,
  city: city,
  state: state,
  language: language,
  notificationsEnabled: notificationsEnabled,
);
CompleteOnboardingData data = result.data;
final ref = result.ref;
```

#### Getting the Ref
Each builder returns an `execute` function, which is a helper function that creates a `Ref` object, and executes the underlying operation.
An example of how to use the `Ref` object is shown below:
```dart
String email = ...;
String zipCode = ...;
String city = ...;
String state = ...;
String language = ...;
bool notificationsEnabled = ...;

final ref = AppConnector.instance.completeOnboarding(
  email: email,
  zipCode: zipCode,
  city: city,
  state: state,
  language: language,
  notificationsEnabled: notificationsEnabled,
).ref();
ref.execute();
```

