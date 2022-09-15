import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:super_hero/application/cubit/super_heroes_cubit.dart';
import 'package:super_hero/domain/model/super_model/datum.dart';
import 'package:super_hero/infrastructure/superhero.dart';
import 'package:super_hero/infrastructure/superhero_repo.dart';
import 'package:super_hero/presentation/detailed/detailed.dart';

// class HomeScreen extends StatelessWidget {
//   const HomeScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         centerTitle: true,
//         title: Text("Super Heroes"),
//         leading: IconButton(onPressed: () async {}, icon: Icon(Icons.clear)),
//       ),
//       body: Container(
//         padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
//         child: BlocBuilder<SuperHeroesCubit, SuperHeroesState>(
//           builder: (context, state) {
//             if (state is SuperHeroesLoading) {
//               return Center(
//                 child: CircularProgressIndicator(),
//               );
//             } else if (state is SuperHeroesSuccess) {
//               return Container(
//                 child: ListView.separated(
//                     itemBuilder: (context, index) => ListTile(
//                           title: Text(state.superHeroes[index].name),
//                         ),
//                     separatorBuilder: (context, index) => SizedBox(height: 20),
//                     itemCount: state.superHeroes.length),
//               );
//             }
//             return HomeErrorWidget();
//           },
//         ),
//       ),
//     );
//   }
// }

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple[100],
      body: CustomScrollView(
        slivers: [
          CommonAppBar(title: "SUPER HEROES"),
          BlocBuilder<SuperHeroesCubit, SuperHeroesState>(
            builder: (context, state) {
              if (state is SuperHeroesLoading) {
                return SliverToBoxAdapter(child: CircularProgressIndicator());
              } else if (state is SuperHeroesSuccess) {
                return SliverList(
                    delegate: SliverChildBuilderDelegate(
                        childCount: state.superHeroes.length, (context, index) {
                  final thisSuperHero = state.superHeroes[index];
                  return HomeTileWidget(thisSuperHero: thisSuperHero);
                }));
              } else {
                return SliverToBoxAdapter(child: HomeErrorWidget());
              }
            },
          )
        ],
      ),
    );
  }
}

class HomeTileWidget extends StatelessWidget {
  const HomeTileWidget({
    Key? key,
    required this.thisSuperHero,
  }) : super(key: key);

  final Datas thisSuperHero;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: ListTile(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (_) => DetailedScreen(superHero: thisSuperHero)));
        },
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        tileColor: Colors.deepPurple[300],
        leading:
            CircleAvatar(backgroundImage: NetworkImage(thisSuperHero.photo)),
        title: Text(
          thisSuperHero.superheroName,
          style: TextStyle(
              color: Colors.white, fontSize: 16, fontWeight: FontWeight.w500),
        ),
      ),
    );
  }
}

class CommonAppBar extends StatelessWidget {
  const CommonAppBar({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      pinned: true,
      backgroundColor: Colors.deepPurple[500],
      expandedHeight: 200,
      flexibleSpace: FlexibleSpaceBar(
        background: Container(color: Colors.deepPurple[300]),
        title: Text(title),
        centerTitle: true,
      ),
    );
  }
}

class HomeErrorWidget extends StatelessWidget {
  const HomeErrorWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Somthing Went Wrong"),
          SizedBox(height: 20),
          TextButton.icon(
              onPressed: () {
                context.read<SuperHeroesCubit>().getAllSuperHeroes();
              },
              icon: Icon(Icons.replay),
              label: Text("Try Again"))
        ],
      ),
    );
  }
}
