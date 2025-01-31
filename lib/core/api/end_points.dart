abstract class EndPoint {
  static const String baseUrl = 'http://tradof.runasp.net/api/';
  static const String login = 'auth/login';
  static const String registerFreelancer = 'auth/register-freelancer';
  static const String registerCompany = 'auth/register-company';
  static const String forgetPassword = 'auth/forget-password';
  static const String verifyOtp = 'auth/verify-otp';
  static const String resetPassword = 'auth/change-password';
  static const String getCountries = 'country';
  static const String getLanguages = 'language';
  static const String getSpecializations = 'specialization';

  static  String getCompanybyId(String id) {
      return 'Company/$id';
  }
}
