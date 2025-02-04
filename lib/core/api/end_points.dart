abstract class EndPoint {
  static const String baseUrl = 'http://tradof.runasp.net/api/';
  // auth
  static const String login = 'auth/log-in';
  static const String registerFreelancer = 'auth/register-freelancer';
  static const String registerCompany = 'auth/register-company';
  static const String forgetPassword = 'auth/forget-password';
  static const String verifyOtp = 'auth/verify-otp';
  static const String resetPassword = 'auth/change-password';
  static const String getCountries = 'country';
  static const String getLanguages = 'language';
  static const String getSpecializations = 'specialization';
  static const String updateCompanyProfile = 'Company/UpdateCompany';
  // project
  static const String createProject = 'project';

  //company

  static String getCompanybyId(String id) => 'Company/$id';

  static String addPreferredLanguage(String companyId, int languageId) {
    return 'Company/AddLanguage/$companyId?languageId=$languageId';
  }

  static String deletePreferredLanguage(String companyId, int languageId) {
    return 'Company/RemoveLanguage/$companyId?languageId=$languageId';
  }

  static String addIndustries(String companyId, int industryId) {
    return 'Company/AddIndustry/$companyId?specializationId=$industryId';
  }

  static String deleteIndustries(String companyId, int industryId) {
    return 'Company/RemoveIndustry/$companyId?specializationId=$industryId';
  }
}
