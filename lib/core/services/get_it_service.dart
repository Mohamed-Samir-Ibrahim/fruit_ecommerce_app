import 'package:fruit_ecommerce_app/core/services/firebase_auth_service.dart';
import 'package:fruit_ecommerce_app/feature/register/data/repo/register_repo_impl.dart';
import 'package:fruit_ecommerce_app/feature/register/domain/repo/register_repo/register_repo.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setUp() {
  getIt.registerSingleton<FirebaseAuthService>(FirebaseAuthService());
  getIt.registerSingleton<RegisterRepo>(
    RegisterRepoImpl(getIt<FirebaseAuthService>()),
  );
}
