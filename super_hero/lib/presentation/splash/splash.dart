import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:super_hero/application/cubit/super_heroes_cubit.dart';
import 'package:super_hero/infrastructure/superhero.dart';
import 'package:super_hero/infrastructure/superhero_repo.dart';
import 'package:super_hero/presentation/home/home.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      context.read<SuperHeroesCubit>().getAllSuperHeroes();
      await Future.delayed(Duration(seconds: 2));
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (_) => HomeScreen()));
    });
    return Scaffold(
      body: Center(child: CircularProgressIndicator()),
    );
  }
}
