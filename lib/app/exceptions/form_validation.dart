class FormValidationException implements Exception {
  Map? errors;

  FormValidationException(dynamic responseData) {
    if (responseData['errors'] != null) {
      this.errors = responseData['errors'];
    }
  }
}
