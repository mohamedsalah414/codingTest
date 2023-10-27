import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:codingtest/src/core/utils/app_colors.dart';
import 'package:codingtest/src/core/utils/app_strings.dart';
import 'package:codingtest/src/modules/home/presentation/screens/home_screen.dart';
import 'dependency_injection.dart' as di;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        /*BlocProvider(
          create: (context) => di.sl<WeatherCubit>(),
        ), BlocProvider(
          create: (context) => di.sl<ForecastCubit>(),
        ),BlocProvider(
          create: (context) => FavouriteCubit(),
        ),*/
      ],
      child: MaterialApp(
          title: AppStrings.appName,
          debugShowCheckedModeBanner: false,
          themeMode: ThemeMode.dark,
          darkTheme: ThemeData(
            colorScheme: ColorScheme.fromSeed(
              seedColor: AppColor.yellow,
            ),
            useMaterial3: true,
            scaffoldBackgroundColor: Colors.white,
            textTheme: Theme.of(context).textTheme.apply(
              fontFamily: 'Roboto',
             ),
          ),
          home: const HomeScreen()),
    );
  }
}
