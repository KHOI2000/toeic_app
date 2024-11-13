int toJsonBit(bool value) {
  if (value) {
    return 1;
  }
  return 0;
}

bool fromJsonBit(int value) {
  if (value == 1) {
    return true;
  }
  return false;
}
