import 'package:dartz/dartz.dart';
import 'package:fruit_ecommerce_app/core/failure/custom_exception.dart';
import 'package:fruit_ecommerce_app/core/failure/failure.dart';
import 'package:fruit_ecommerce_app/core/services/firebase_auth_service.dart';
import 'package:fruit_ecommerce_app/feature/register/data/model/user_model.dart';
import 'package:fruit_ecommerce_app/feature/register/domain/entity/user_entity.dart';
import 'package:fruit_ecommerce_app/feature/register/domain/repo/register_repo/register_repo.dart';

class RegisterRepoImpl implements RegisterRepo {
  FirebaseAuthService firebaseAuthService;

  RegisterRepoImpl(this.firebaseAuthService);

  @override
  Future<Either<Failure, UserEntity>> createUserWithEmailAndPassword(
    String email,
    String password,
    String name,
  ) async {
    try {
      var user = await firebaseAuthService.createUserWithEmailAndPassword(
        email,
        password,
      );
      return Right(UserModel.fromFirebaseUser(user));
    } on CustomException catch (e) {
      return left(ServerFailure(message: e.message));
    } catch (e) {
      return left(
        ServerFailure(message: 'Something went wrong, try again later.'),
      );
    }
  }
}
