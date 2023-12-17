import 'package:dailynews24/cubit/get_categories_cubit.dart';
import 'package:dailynews24/cubit/new_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:dailynews24/screens/welcome.dart';

Future main() async {
  await dotenv.load(fileName: "assets/.env");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => NewCubit(),
        ),
        BlocProvider(
          create: (context) => GetCategoriesCubit(),
        ),
      ],
      child: MaterialApp(
        title: 'DailyNews 24',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.redAccent,
          ),
          useMaterial3: true,
        ),
        home: const Welcome(),
      ),
    );
  }
}
