import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:super_hero/application/cubit/super_heroes_cubit.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Super Heroes"),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        child: BlocBuilder<SuperHeroesCubit, SuperHeroesState>(
          builder: (context, state) {
            if (state is SuperHeroesLoading) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is SuperHeroesSuccess) {
              return Container(
                child: ListView.separated(
                    itemBuilder: (context, index) => ListTile(
                          title: Text(state.superHeroes[index].name),
                        ),
                    separatorBuilder: (context, index) => SizedBox(height: 20),
                    itemCount: state.superHeroes.length),
              );
            }
            return Container(
              child: Column(
                children: [],
              ),
            );
          },
        ),
      ),
    );
  }
}
