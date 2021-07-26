import 'package:flutter/widgets.dart';
import 'package:worker_attendace/core/service/authentication_service.dart';
import 'package:worker_attendace/core/service/navigation_service.dart';
import 'package:worker_attendace/locator.dart';
import 'package:worker_attendace/ui/view/auth_screen.dart';
import 'package:worker_attendace/ui/view/homescreen.dart';

class StartupViewModel extends ChangeNotifier {
  final AuthenticationService _authenticationService =
      locator<AuthenticationService>();
  final NavigationService _navigationService = locator<NavigationService>();

  Future handleStartupView() async {
    var hasLoggedInUser = await _authenticationService.isUserLogIn();
    print(hasLoggedInUser);
    if (hasLoggedInUser) {
      _navigationService.navigateTo(HomeScreen.routeName);
    } else {
      _navigationService.navigateTo(AuthScreen.routeName);
    }
  }
}
