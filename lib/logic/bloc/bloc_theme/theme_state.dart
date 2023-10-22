part of 'theme_bloc.dart';

@immutable
sealed class ThemeState {
  ThemeData themeData;
  ThemeState({required this.themeData});
}

final class ThemeInitial extends ThemeState {
  ThemeInitial()
      : super(
          themeData: ThemeData(primarySwatch: Colors.pink),
        );
}

final class ThemeSuccessState extends ThemeState {
  ThemeSuccessState({required super.themeData});
}
