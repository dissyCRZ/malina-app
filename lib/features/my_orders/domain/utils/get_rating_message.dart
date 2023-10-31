String getRatingMessage(int num) {
  switch (num) {
    case 1:
      return 'Очень плохо';
    case 2:
      return 'Плохо';
    case 3:
      return 'Нормально';
    case 4:
      return 'Хорошо';
    case 5:
      return 'Отлично!';
  }
  return '';
}
