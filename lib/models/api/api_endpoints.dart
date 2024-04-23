class ApiEndPoints {
  static final String baseUrl = 'https://su-socialmedia.onrender.com/api/v1.0/';
  static _AuthEndPoints _authEndPoints = _AuthEndPoints();
}

class _AuthEndPoints {
  final String registerEmail = 'auth/register';
  final String loginEmail = 'auth/login';
}
