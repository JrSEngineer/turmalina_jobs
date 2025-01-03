import 'package:flutter_modular/flutter_modular.dart';
import 'package:turmalina_jobs/src/app/modules/home/view/pages/chat_page.dart';
import 'package:turmalina_jobs/src/app/modules/home/view/pages/home_page.dart';
import 'package:turmalina_jobs/src/app/modules/home/view/pages/profile_page.dart';

class HomeModule extends Module {
  @override
  void routes(RouteManager r) {
    r.child('/', child: (_) => const HomePage());
    r.child('/chat', child: (_) => const ChatPage());
    r.child('/profile', child: (_) => const ProfilePage());
  }
}
