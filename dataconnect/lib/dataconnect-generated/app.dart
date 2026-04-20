library dataconnect_generated;
import 'package:firebase_data_connect/firebase_data_connect.dart';
import 'package:flutter/foundation.dart';
import 'dart:convert';
import 'package:flutter/foundation.dart';

part 'get_current_user.dart';

part 'upsert_current_user.dart';

part 'complete_onboarding.dart';






/// A sealed class representing either a known enum value or an unknown string value.
@immutable
sealed class EnumValue<T extends Enum> {
  const EnumValue();

  

  /// The string representation of the value.
  String get stringValue;
  @override
  String toString() {
    return "EnumValue($stringValue)";
  }
}

/// Represents a known, valid enum value.
class Known<T extends Enum> extends EnumValue<T> {
  /// The actual enum value.
  final T value;

  const Known(this.value);

  @override
  String get stringValue => value.name;

  @override
  String toString() {
    return "Known($stringValue)";
  }
}
/// Represents an unknown or unrecognized enum value.
class Unknown extends EnumValue<Never> {
  /// The raw string value that couldn't be mapped to a known enum.
  @override
  final String stringValue;

  const Unknown(this.stringValue);
  @override
  String toString() {
    return "Unknown($stringValue)";
  }
}

class AppConnector {
  
  
  GetCurrentUserVariablesBuilder getCurrentUser () {
    return GetCurrentUserVariablesBuilder(dataConnect, );
  }
  
  
  UpsertCurrentUserVariablesBuilder upsertCurrentUser ({required String email, }) {
    return UpsertCurrentUserVariablesBuilder(dataConnect, email: email,);
  }
  
  
  CompleteOnboardingVariablesBuilder completeOnboarding ({required String email, required String region, required String language, required bool notificationsEnabled, }) {
    return CompleteOnboardingVariablesBuilder(dataConnect, email: email,region: region,language: language,notificationsEnabled: notificationsEnabled,);
  }
  

  static ConnectorConfig connectorConfig = ConnectorConfig(
    'us-west1',
    'app',
    'wethepeople',
  );

  AppConnector({required this.dataConnect});
  static AppConnector get instance {
    
    return AppConnector(
        dataConnect: FirebaseDataConnect.instanceFor(
            connectorConfig: connectorConfig,
            
            sdkType: CallerSDKType.generated));
  }

  FirebaseDataConnect dataConnect;
}
