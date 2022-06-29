import 'package:stacked_basic/ui/views/home/home_view.dart';
import 'package:stacked_basic/ui/views/profile/profile_view.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';

@StackedApp(
  routes: [
    MaterialRoute(page: HomeView, initial: true),
    MaterialRoute(page: ProfileView),
  ],
  dependencies: [
    LazySingleton(classType: NavigationService),
  ],
)
class AppSetup {}

// flutter pub run build_runner build --delete-conflicting-outputs
