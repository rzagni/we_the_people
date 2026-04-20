library dataconnect_generated;
import 'package:firebase_data_connect/firebase_data_connect.dart';
import 'package:flutter/foundation.dart';
import 'dart:convert';

part 'get_current_user.dart';

part 'upsert_current_user.dart';

part 'complete_onboarding.dart';







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
    
    CacheSettings cacheSettings = CacheSettings(
      maxAge: Duration(milliseconds:0),
      storage: CacheStorage.persistent,
    );
    
    return AppConnector(
        dataConnect: FirebaseDataConnect.instanceFor(
            connectorConfig: connectorConfig,
            
            cacheSettings: cacheSettings,
            
            sdkType: CallerSDKType.generated));
  }

  FirebaseDataConnect dataConnect;
}
