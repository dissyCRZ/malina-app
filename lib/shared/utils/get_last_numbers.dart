String getLastNumber(String id, int count) {
  int firstIndex = id.toString().length - count;
  firstIndex = firstIndex < 0 ? 0 : firstIndex;
  return id.toString().substring(
        firstIndex,
      );
}
