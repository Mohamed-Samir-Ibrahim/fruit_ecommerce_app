import 'package:dartz/dartz.dart';
import 'package:fruit_ecommerce_app/core/failure/failure.dart';
import 'package:fruit_ecommerce_app/feature/register/domain/entity/user_entity.dart';

abstract class RegisterRepo {
  Future<Either<Failure, UserEntity>> createUserWithEmailAndPassword(
    String email,
    String password,
    String name,
  );
}
