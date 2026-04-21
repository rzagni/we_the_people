import 'package:shared_services/dataconnect_generated/app.dart';

class DeviceRepository {
  final AppConnector _connector;

  DeviceRepository({AppConnector? connector})
    : _connector = connector ?? AppConnector.instance;

  Future<void> registerUserDevice({
    required String id,
    required String fcmToken,
    required DevicePlatform platform,
    required bool notificationsEnabled,
  }) async {
    await _connector
        .registerUserDevice(
          id: id,
          fcmToken: fcmToken,
          platform: platform,
          notificationsEnabled: notificationsEnabled,
        )
        .execute();
  }

  Future<List<ListMyUserDevicesUserDevices>> listMyUserDevices() async {
    final result = await _connector.listMyUserDevices().execute();
    return result.data.userDevices;
  }
}
