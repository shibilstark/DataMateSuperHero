part of 'super_heroes_cubit.dart';

abstract class SuperHeroesState extends Equatable {
  const SuperHeroesState();

  @override
  List<Object> get props => [];
}

class SuperHeroesInitial extends SuperHeroesState {}

class SuperHeroesLoading extends SuperHeroesState {}

class SuperHeroesSuccess extends SuperHeroesState {
  final List<Datas> superHeroes;

  const SuperHeroesSuccess({required this.superHeroes});

  @override
  List<Object> get props => [superHeroes];
}

class SuperHeroesError extends SuperHeroesState {
  final FailureType failureType;

  const SuperHeroesError({required this.failureType});
  @override
  List<Object> get props => [failureType];
}
