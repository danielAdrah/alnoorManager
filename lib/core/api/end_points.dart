class EndPoint {
  static String baseUrl = "http://85.31.237.33/test/api/";
  static String logIn = "auth/login/";
  static String listEmployee = "list-employees";
  static String listPilgrims = "list-pilgrims";
  static String addTask(empId) {
    return "send-task/$empId/";
  }

  static String addNotification = "send-notification/";
  static String addEmployee = "create-employee/";
  static String getEmployee(empId) {
    return "get-employee/$empId";
  }

  static String listNotification = "list-notifications/";
  static String oneEmppoyee = "get-employee/";
  static String updateEmployee(id) {
    return "update-employee/$id/";
  }

  static String getPilgrim(id) {
    return "get-pilgrim/$id"; 
  }
}

class ApiKeys {
  static String auth = "Authorization";
  static String username = "username";
  static String password = "password";
  static String deviceId = "device_token";
  static String title = "title";
  static String content = "content";
  static String email = "email";
  static String phonenumber = "phonenumber";
}
