class ApiUrls {
  // Private constructor to prevent instantiation
  ApiUrls._();

  /// Development Base Url
  //static const String _baseURL = "http://13.232.166.226:3031";
  /// Staging Base Url
  //static const String _baseURL = "http://192.168.20.244:9090";
  /// Production Base Url
  static const String _baseURL = "https://api.arafah.shop";

  static const String _imageBaseURL = "https://arafah-files.s3.ap-south-1.amazonaws.com/images/";

  /// Products Endpoints
  static const String products = "/api/products";


  // Public getter to access the base URL
  static String get baseURL => _baseURL;
  static String get imageBaseURL => _imageBaseURL;

  // Pass without access token
  static List<String> basicAuthUrls = [];

}