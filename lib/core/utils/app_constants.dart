import 'package:flutter/widgets.dart';
import 'package:hugeicons/hugeicons.dart';

abstract class AppConstants {
  static const String token = "userToken";
  static const String refreshToken = "refreshToken";
  static const String role = "role";
  static const String userId = "userId";
  static const String firstTime = "firstTime";
  static const String calenderId = "calendarId";
  static String kUserId = '';
  static String websocketUrl = 'wss://tradofserver.azurewebsites.net';
}

const List<String> employeesGroups = [
  "Adminstrator",
  "SeniorProject",
  "SeniorProjectManager",
  "FinanceManager",
  "ClientFinanceManager",
  "ProjectManager",
  "ClientManager",
  "VendorManager",
  "VendorFinanceManager"
];


IconData notificationIcons(String type) {
    switch (type) {
      case 'Technical Support':
        return HugeIcons.strokeRoundedCustomerService02;
      case 'Offer':
        return HugeIcons.strokeRoundedClipboard;
      case 'Payment':
        return HugeIcons.strokeRoundedCreditCardPos;
      case 'Message':
        return HugeIcons.strokeRoundedMail01;
      case 'Calendar':
        return HugeIcons.strokeRoundedCalendar02;
      case 'Project':
        return HugeIcons.strokeRoundedFile01;
      case 'Feedback':
        return HugeIcons.strokeRoundedComment01;
      case 'Evaluation':
        return HugeIcons.strokeRoundedChartEvaluation;
      case 'Report':
        return HugeIcons.strokeRoundedComplaint;
      case 'Subscriptions':
        return HugeIcons.strokeRoundedMoneyExchange03;
      case 'Withdraw Profit':
        return HugeIcons.strokeRoundedWallet02;
      case 'AskQuestion':
        return HugeIcons.strokeRoundedHelpCircle;
      default:
        return HugeIcons.strokeRoundedNotification03;
    }
  }