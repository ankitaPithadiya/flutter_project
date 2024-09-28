// ignore_for_file: non_constant_identifier_names

class ApiEndPoints {
  static String baseUrl = "http://192.168.1.27:8081/api/";

  static String WORDPRESS_URL = "";
  static String ASTRO_URL = "";
  static String LOCATION_URL = "";
  static String FIREBASE_URL = "";
  static String XAPI_KEY = "";
  static String RECONNECT_NETWORK_URL = "";

  static String loginApi = "users/loginapp/";
  static String moneySpendBy="users/getListUsers";
  static String expenseType="ExpenseType/getListExpenseType";
  static String companyList="Company/getListCompany";
  static String client="Client/getListClient";
  static String clientLocation="ClientLocation/getListClientLocation";
  static String serviceType="ServiceType/getListServiceType";
  static String equipmentType="EquipmentType/getListEquipmentType";
  static String addService="Service/addService/";
  static String addExpense="Expense/addExpense/";
  static String serviceList="ServiceVisit/serviceVistiReport";
  static String expenseList="Expense/getExpenseReport";
  static String updateServiceStatus="Service/updateServiceStatus";
  static String addServiceVisit="ServiceVisit/addServiceVisit";
  static String updateServiceVisitStatus="ServiceVisit/updateServiceVisitStatus";
  static String updateServiceVisit="ServiceVisit/updateServiceVisit";
  static String uploadimage="ServiceFeedback/uploadimage";
  static String addFeedback="ServiceFeedback/addServiceFeedback";


}
