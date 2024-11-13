enum ErrorCode {
  success('00'),
  failed('01');

  final String code;

  const ErrorCode(this.code);
}
