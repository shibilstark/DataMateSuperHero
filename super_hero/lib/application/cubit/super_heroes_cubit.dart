import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:super_hero/domain/failure.dart';
import 'package:super_hero/domain/model/super_model/datum.dart';
import 'package:super_hero/infrastructure/superhero_repo.dart';

part 'super_heroes_state.dart';

class SuperHeroesCubit extends Cubit<SuperHeroesState> {
  final SuperHeroRepo superHeroRepo;
  SuperHeroesCubit(this.superHeroRepo) : super(SuperHeroesInitial());

  void getAllSuperHeroes() async {
    emit(SuperHeroesLoading());
    await superHeroRepo.getSuperHeroData().then((heroList) async {
      if (heroList == null) {
        final apiResult = await superHeroRepo.getSuperHeroes();

        apiResult.fold(
          (fail) {
            emit(SuperHeroesError(failureType: fail.failureType));
          },
          (success) async {
            await superHeroRepo.saveSuperHeroData(success);
            final datas = await superHeroRepo.getSuperHeroData();
            emit(SuperHeroesSuccess(superHeroes: datas!));
          },
        );

        // await superHeroRepo.getSuperHeroes().then((result) {
        //   result.fold((failure) {
        //     emit(SuperHeroesError(failureType: failure.failureType));
        //   }, (datas) async {
        //     await superHeroRepo.saveSuperHeroData(datas).then((_) async {
        //       final datas = await superHeroRepo.getSuperHeroData();
        //       emit(SuperHeroesSuccess(superHeroes: datas!));
        //     });
        //   });
        // });
      } else {
        emit(SuperHeroesSuccess(superHeroes: heroList));
      }
    });
  }
}
