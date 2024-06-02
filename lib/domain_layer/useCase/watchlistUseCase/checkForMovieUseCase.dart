
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../reposatoryContract/watchListRepository.dart';

@injectable
class CheckInFireBaseUseCase {
  @factoryMethod
  WatchListRepository watchListRepository;
  CheckInFireBaseUseCase({required this.watchListRepository});
  Future<Either<bool, String>> invoke(String id) {
    return watchListRepository.checkInFireBase(id);
  }
}
