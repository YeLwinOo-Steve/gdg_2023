import 'package:flutter/material.dart';
import 'package:remote_banner/state/home_state.dart';

import '../../features/dependencies/injection.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final homeState = locator.get<HomeState>();

  @override
  void initState() {
    super.initState();
    initCall();
  }

  void initCall() async {
    await homeState.onInit();
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        await homeState.onInit();
      },
      child: AnimatedBuilder(
          animation: homeState,
          builder: (context, _) {
            if (homeState.isLoading) {
              return const Center(
                child: SizedBox(
                    width: 50, height: 50, child: CircularProgressIndicator()),
              );
            }
            return Scaffold(
                appBar: AppBar(
                  title: Text(
                    homeState.remoteAppTitle,
                  ),
                  centerTitle: true,
                ),
                body: Column(
                  children: [
                    if (homeState.showMainBanner) ...[
                      Container(
                        height: 100,
                        width: double.maxFinite,
                        color: Colors.teal.shade100,
                        child: const Center(
                          child: Text('Showing Main Banner'),
                        ),
                      ),
                    ],
                  ],
                ));
          }),
    );
  }
}
