import 'package:dartz/dartz.dart';
import 'package:super_hero/domain/failure.dart';
import 'package:super_hero/domain/model/super_model/datum.dart';

abstract class SuperHeroRepo {
  Future<Either<MainFailures, List<Datas>>> getSuperHeroes();
  Future saveSuperHeroData(List<Datas> data);
  Future<List<Datas>?> getSuperHeroData();
  Future clearSuperHeroData();
}
