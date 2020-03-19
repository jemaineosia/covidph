import 'package:covidph/constants/route_names.dart';
import 'package:covidph/locator.dart';
import 'package:covidph/services/navigation_service.dart';
import 'package:covidph/services/push_notification_service.dart';
import 'package:covidph/viewmodels/base_model.dart';

class SplashViewModel extends BaseModel {
  final NavigationService _navigationService = locator<NavigationService>();
  final PushNotificationService _pushNotificationService =
      locator<PushNotificationService>();

  Future handleStartUpLogic() async {
    await _pushNotificationService.initialise();

    _navigationService.navigateTo(DashboardViewRoute);
  }
}
