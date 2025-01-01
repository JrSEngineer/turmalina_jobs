import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:turmalina_jobs/src/app/modules/auth/view/stores/auth_store.dart';
import 'package:turmalina_jobs/src/shared/widgets/app_container.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  late AuthStore _store;

  @override
  void initState() {
    super.initState();

    _store = Modular.get<AuthStore>();
  }

  @override
  Widget build(BuildContext context) {
    const image = 'https://images.pexels.com/photos/93820/pexels-photo-93820.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1';

    final userProfileImageComponentSize = MediaQuery.sizeOf(context).height * 0.18;

    final userProfileImageComponentSpacer = MediaQuery.sizeOf(context).height * 0.012;

    return Container(
      color: Theme.of(context).colorScheme.background,
      child: Stack(
        children: [
          SizedBox(
            width: MediaQuery.sizeOf(context).width,
            child: Image.asset(
              fit: BoxFit.fill,
              'assets/images/app_turmalina_jobs_background.png',
            ),
          ),
          AppContainer(
            color: Colors.transparent,
            child: Column(
              children: [
                Column(
                  children: [
                    Container(
                      height: userProfileImageComponentSize,
                      width: userProfileImageComponentSize,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(
                            image,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: userProfileImageComponentSpacer),
                    Text(
                      'User Name',
                      style: Theme.of(context).textTheme.headlineLarge,
                    ),
                    Text(
                      'user@email.com',
                      style: Theme.of(context).textTheme.labelLarge,
                    ),
                  ],
                ),
              ],
            ),
          ),
          Positioned(
            top: MediaQuery.sizeOf(context).height * 0.042,
            right: 0,
            child: TextButton(
              onPressed: _store.signOut,
              child: Text(
                'Sair',
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
