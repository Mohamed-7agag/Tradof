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
  static String createProject(String id) => 'project?$id';

  //company
  static String changeCompanyPassword(String id) {
    return 'Company/ChangePassword?companyId=$id';
  }

  static String getCompanyEmployees(String id) {
    return 'company/$id/employees';
  }

  static String addCompanyEmployee = 'Company/AddEmployee';

  static String getCompanybyId(String id) => 'Company/$id';

  static String addPreferredLanguage(String companyId) {
    return 'Company/AddLanguage/$companyId';
  }

  static String deletePreferredLanguage(String companyId) {
    return 'Company/RemoveLanguage/$companyId';
  }

  static String addIndustries(String companyId) {
    return 'Company/AddSpecialization/$companyId';
  }

  static String deleteIndustries(String companyId) {
    return 'Company/RemoveSpecialization/$companyId';
  }

  static String addUpateSocialMedia(String companyId) {
    return 'Company/$companyId/social-medias/add-or-update-or-remove';
  }
}
