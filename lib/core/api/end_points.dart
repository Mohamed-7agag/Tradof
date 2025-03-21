abstract class EndPoint {
  static const String baseUrl = 'https://tradof.runasp.net/api/';
  static const String baseUrl2 = 'https://tradof-api.vercel.app/api/';
  // auth
  static const String login = 'auth/log-in';
  static const String registerFreelancer = 'auth/register-freelancer';
  static const String registerCompany = 'auth/register-company';
  static const String forgetPassword = 'auth/forget-password';
  static const String verifyOtp = 'auth/verify-otp';
  static const String resendOtp = 'auth/resend-otp';
  static const String resetPassword = 'auth/change-password';
  static const String getCountries = 'country';
  static const String refreshToken = 'auth/refresh-token';
  static const String getLanguages = 'language';
  static const String getSpecializations = 'specialization';
  static const String updateCompanyProfile = 'Company/UpdateCompany';

  // project
  static String project = 'project';
  static String getUpcomingProjects = 'project/allincomingprojects';
  static String getStartedProjects = 'project/allstartedprojects';
  static String deleteProject(int projectId) => 'project/$projectId';

  //company
  static String changeCompanyPassword(String id) {
    return 'Company/$id/ChangePassword';
  }

  static String getCompanyEmployees(String id) {
    return 'company/$id/employees';
  }

  static String addCompanyEmployee = 'Company/AddEmployee';

  static String getCompanyById(String id) => 'Company/$id';

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

  static String updateCompanySocialMedia(String companyId) {
    return 'Company/$companyId/social-medias/add-or-update-or-remove';
  }

  // Freelancer
  static String getFreelancerById(String id) => 'freelancers/$id';
  static String updateFreelancerSocialMedia(String freelancerId) {
    return 'freelancers/$freelancerId/social-medias/add-or-update-or-remove';
  }

  static String uploadCv(String freelancerId) {
    return 'freelancers/$freelancerId/upload-cv';
  }

  static String changeFreelancerPassword(String freelancerId) {
    return 'freelancers/$freelancerId/change-password';
  }

  static String updateFreelancerProfile(String freelancerId) {
    return 'freelancers/$freelancerId';
  }

  static String addOrDeleteFreelancerLanguagePair(String freelancerId) {
    return 'freelancers/$freelancerId/language-pairs';
  }

  static String addSpecialization(String freelancerId) {
    return 'freelancers/AddSpecialization/$freelancerId';
  }

  static String deleteSpecialization(String freelancerId) {
    return 'freelancers/RemoveSpecialization/$freelancerId';
  }

  static String deleteOffer(int proposalId) {
    return 'proposal/id=$proposalId';
  }

  static String getProposalByFreelancerId = 'proposal/freelancer-proposals';

  static String offer = 'proposal';
  static String feedback = 'feedback/';
  static String calendar = 'calendar/';
  static String askQuestion = 'askQuestion';
  static String createEvent(String calendarId) {
    return 'calendar/$calendarId/event';
  }

  static String updateOrDeleteEvent(String eventId) {
    return 'calendar/event/$eventId';
  }

  static String getAllEvents(String calendarId) {
    return 'calendar/events/$calendarId';
  }
}
