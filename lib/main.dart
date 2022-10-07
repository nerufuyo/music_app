import 'package:flutter/material.dart';
import 'package:music_app/presentation/bloc/track/track_bloc.dart';
import 'package:music_app/presentation/pages/main_pages.dart';
import 'package:provider/provider.dart';
import 'injection.dart' as di;

void main() async {
  di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(
          create: (_) => di.locator<TrackBloc>(),
        ),
      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Music App',
          onGenerateRoute: (RouteSettings setttings) {
            switch (setttings.name) {
              case MainPage.routeName:
                return MaterialPageRoute(
                  builder: (context) => const MainPage(),
                );

              default:
                return MaterialPageRoute(
                  builder: (context) => const MainPage(),
                );
            }
          }),
    );
  }
}
