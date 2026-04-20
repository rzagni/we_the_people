# Basic Usage

```dart
AppConnector.instance.CreateSurvey(createSurveyVariables).execute();
AppConnector.instance.GetSurvey(getSurveyVariables).execute();
AppConnector.instance.ListSurveys().execute();
AppConnector.instance.RegisterUserDevice(registerUserDeviceVariables).execute();
AppConnector.instance.ListUserDevicesByUser(listUserDevicesByUserVariables).execute();
AppConnector.instance.CreateSurveyDelivery(createSurveyDeliveryVariables).execute();
AppConnector.instance.ListSurveyDeliveriesBySurvey(listSurveyDeliveriesBySurveyVariables).execute();
AppConnector.instance.SubmitSurveyResponse(submitSurveyResponseVariables).execute();
AppConnector.instance.ListSurveyResponsesBySurvey(listSurveyResponsesBySurveyVariables).execute();
AppConnector.instance.GetCurrentUser().execute();

```

## Optional Fields

Some operations may have optional fields. In these cases, the Flutter SDK exposes a builder method, and will have to be set separately.

Optional fields can be discovered based on classes that have `Optional` object types.

This is an example of a mutation with an optional field:

```dart
await AppConnector.instance.CreateSurvey({ ... })
.language(...)
.execute();
```

Note: the above example is a mutation, but the same logic applies to query operations as well. Additionally, `createMovie` is an example, and may not be available to the user.

