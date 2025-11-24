import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_ecommerce_app/feature/register/domain/repo/register_repo/register_repo.dart';
import 'package:fruit_ecommerce_app/feature/register/presentation/manager/signup_states.dart';

class SignupCubit extends Cubit<SignupStates> {
  SignupCubit(this.registerRepo) : super(SignupInitial());
  final RegisterRepo registerRepo;

  createUserWithEmailAndPassword(
    String email,
    String password,
    String name,
  ) async {
    emit(SignupLoading());
    var result = await registerRepo.createUserWithEmailAndPassword(
      email,
      password,
      name,
    );
    result.fold(
      (failure) => SignupFailure(message: failure.message),
      (userEntity) => SignupSuccess(userEntity: userEntity),
    );
  }
}
