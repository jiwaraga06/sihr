import 'package:sihr/source/env/env.dart';

class ApiLogBook {
  static getLogBook() {
    return "$url/api/v1/t_logbook";
  }

  static createLogBook() {
    return "$url/api/v1/t_logbook";
  }

  static updateLogBook(id) {
    return "$url/api/v1/t_logbook/$id";
  }
}
