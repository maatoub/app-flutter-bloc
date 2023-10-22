import 'package:first_app/logic/bloc/bloc_counter/counter_bloc.dart';
import 'package:first_app/logic/bloc/bloc_theme/theme_bloc.dart';
import 'package:first_app/ui/pages/About.dart';
import 'package:first_app/ui/pages/counter_statful_screen.dart';
import 'package:first_app/ui/pages/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => CounterBloc(),
        ),
        BlocProvider(
          create: (context) => ThemeBloc(),
        ),
      ],
      child: const RootView(),
    );
  }
}

///************************************* */
class RootView extends StatelessWidget {
  const RootView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (context, state) {
        return MaterialApp(
          theme: state.themeData,
          routes: {
            "/": (context) => const HomePage(),
            "/contact": (context) => const CounterStateFulScreen(),
            "/about": (context) => const About(),
          },
          initialRoute: "/",
        );
      },
    );
  }
}
