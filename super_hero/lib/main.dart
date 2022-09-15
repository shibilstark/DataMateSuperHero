// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'package:super_hero/application/cubit/super_heroes_cubit.dart';
import 'package:super_hero/domain/model/super_model/datum.dart';
import 'package:super_hero/infrastructure/superhero.dart';
import 'package:super_hero/infrastructure/superhero_repo.dart';
import 'package:super_hero/presentation/splash/splash.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();

  if (!Hive.isAdapterRegistered(DatasAdapter().typeId)) {
    Hive.registerAdapter(DatasAdapter());
  }
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  late final SuperHeroRepo superHeroRepo;
  MyApp({
    Key? key,
  }) {
    superHeroRepo = SuperHeroService();
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => SuperHeroesCubit(superHeroRepo)),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SplashScreen(),
      ),
    );
  }
}
