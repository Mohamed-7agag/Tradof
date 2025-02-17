import '../model/company_register_request_model.dart';
import '../model/freelancer_register_request_model.dart';

abstract class RegisterationRepo {
  Future<String> freelancerRegister(
    FreelancerRegisterRequestModel freelancerRegisterRequestModel,
  );
  Future<String> companyRegister(
    CompanyRegisterRequestModel companyRegisterRequestModel,
  );
}
