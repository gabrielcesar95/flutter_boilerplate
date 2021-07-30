class FormValidationException implements Exception {
  Map? errors;

  FormValidationException(dynamic responseData) {
    if (responseData['errors'] != null) {
      errors = responseData['errors'];
    }
  }
}
