import 'package:qubeCommerce/features/auth/domain/entities/login_with_phone_credentials.dart';

import '../../../user/domain/entities/user.dart';
import '../entities/login_credentials.dart';
import '../entities/logout_params.dart';
import '../entities/otp_confirmation_parameters.dart';
import '../entities/password_reset_request_params.dart';
import '../entities/register_credentials.dart';
import '../entities/reset_password_parameters.dart';
import '../entities/reset_password_response.dart';
import '../entities/social_media_credentials.dart';

abstract interface class AuthenticationBaseRepository {
  const AuthenticationBaseRepository();

  Future<void> confirmOtpToResetPassword({
    required OtpConfirmationParameters parameters,
  });

  /// Return token.
  Future<String> login({
    required LoginCredentials credentials,
  });

  /// Return token.
  Future<String> loginWithPhone({
    required LoginWithPhoneCredentials credentials,
  });

  Future<User> loginWithSocialMedia({
    required SocialMediaCredentials credentials,
  });

  Future<void> logout({
    required LogoutParameters parameters,
  });

  Future<ResetPasswordResponse> sendOtpToResetPassword({
    required PasswordResetRequestParameters parameters,
  });

  Future<String> register({
    required RegisterCredentials credentials,
  });

  Future<String> resetPasswordByOtp({
    required ResetPasswordParameters parameters,
  });
}
