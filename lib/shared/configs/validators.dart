import 'package:form_validator/form_validator.dart';

String? Function(String?)? fieldRequired(String value) =>
    ValidationBuilder().required('Поле $value не может быть пустым').build();
