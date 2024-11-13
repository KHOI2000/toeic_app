enum StatusCode {
  notFound(404),
  error(500),
  unauthorized(401),
  success(200),
  postSuccess(201);

  final int code;

  const StatusCode(this.code);
}
