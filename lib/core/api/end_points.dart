abstract class EndPoint {
  // Base URLs
  static const String baseUrl = 'https://tradof.runasp.net/api/';
  static const String baseUrl2 = 'https://tradofserver.azurewebsites.net/api/';

  // Authentication Endpoints
  static const String login = 'auth/log-in';
  static const String registerFreelancer = 'auth/register-freelancer';
  static const String registerCompany = 'auth/register-company';
  static const String forgetPassword = 'auth/forget-password';
  static const String verifyOtp = 'auth/verify-otp';
  static const String resendOtp = 'auth/resend-otp';
  static const String resetPassword = 'auth/change-password';
  static const String refreshToken = 'auth/refresh-token';

  // Common Data Endpoints
  static const String getCountries = 'country';
  static const String getLanguages = 'language';
  static const String getSpecializations = 'specialization';

  // Project Endpoints
  static const String createProject = 'project';
  static const String allProjects = 'project/unassigned-projects';
  static const String currentProjects = 'project/projects/freelancer';
  static const String getUpcomingProjects =
      'project/unassigned-projects/company';
  static const String getStartedProjects = 'project/allstartedprojects';
  static String deleteProject(int projectId) => 'project/$projectId';
  static String sendProjectReview(int projectId) =>
      'project/SendReviewRequest/$projectId';
  static String markProjectAsFinished(int projectId) =>
      'project/MarkAsFinished/$projectId';

  // Company Endpoints
  static const String updateCompanyProfile = 'Company/UpdateCompany';
  static const String addCompanyEmployee = 'Company/AddEmployee';
  static String getCompanyById(String id) => 'Company/$id';
  static String getCompanyEmployees(String id) => 'company/$id/employees';
  static String changeCompanyPassword(String id) =>
      'Company/$id/ChangePassword';
  static String addPreferredLanguage(String companyId) =>
      'Company/AddLanguage/$companyId';
  static String deletePreferredLanguage(String companyId) =>
      'Company/RemoveLanguage/$companyId';
  static String addIndustries(String companyId) =>
      'Company/AddSpecialization/$companyId';
  static String deleteIndustries(String companyId) =>
      'Company/RemoveSpecialization/$companyId';
  static String updateCompanySocialMedia(String companyId) =>
      'Company/$companyId/social-medias/add-or-update-or-remove';

  // Freelancer Endpoints
  static String getFreelancerById(String id) => 'freelancers/$id';
  static String updateFreelancerProfile(String freelancerId) =>
      'freelancers/$freelancerId';
  static String updateFreelancerSocialMedia(String freelancerId) =>
      'freelancers/$freelancerId/social-medias/add-or-update-or-remove';
  static String uploadCv(String freelancerId) =>
      'freelancers/$freelancerId/upload-cv';
  static String changeFreelancerPassword(String freelancerId) =>
      'freelancers/$freelancerId/change-password';
  static String addOrDeleteFreelancerLanguagePair(String freelancerId) =>
      'freelancers/$freelancerId/language-pairs';
  static String addSpecialization(String freelancerId) =>
      'freelancers/AddSpecialization/$freelancerId';
  static String deleteSpecialization(String freelancerId) =>
      'freelancers/RemoveSpecialization/$freelancerId';

  // Proposal/Offer Endpoints
  static const String offer = 'proposal';
  static const String getProposalByFreelancerId =
      'proposal/freelancer-proposals';
  static String deleteOffer(int proposalId) => 'proposal/$proposalId';
  static String cancelOffer(int proposalId) =>
      'proposal/cancel?proposalId=$proposalId';
  static const String acceptOffer = 'proposal/accept';
  static const String denyOffer = 'proposal/deny';

  // Miscellaneous Endpoints
  static const String feedback = 'feedback';
  static const String calendar = 'calendar';
  static const String askQuestion = 'askQuestion';
  static const String createEvent = 'calendar/event';
  static const String getSubscription = 'subscription/details';
  static const String companyFinancialProjects = 'financial/projects-company';
  static const String freelancerFinancialProjects = 'financial/projects-freelancer';
  static const String getIncomeStatistics = 'financial/income-statistics';
  static String updateOrDeleteEvent(String eventId) => 'calendar/$eventId';
  static const String getAllEvents = 'calendar/events';
  static const String technicalSupport = 'technicalSupport';
  static String statistics(String userId) =>
      'financial/company-statistics/$userId';
}
