import 'package:flutter/material.dart';
import 'package:fruit_ecommerce_app/feature/register/domain/entity/user_entity.dart';

@immutable
class SignupStates {}

class SignupInitial extends SignupStates {}

class SignupLoading extends SignupStates {}

class SignupSuccess extends SignupStates {
  final UserEntity userEntity;

  SignupSuccess({required this.userEntity});
}

class SignupFailure extends SignupStates {
  final String message;

  SignupFailure({required this.message});
}
