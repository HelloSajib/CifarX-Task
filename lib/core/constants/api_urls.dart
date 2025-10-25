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

  /// auth API endpoints
  static const String signIn = "/api/customers/login";
  static const String signUp = "/api/customers/signup";
  static const String sendOTP = "/api/customers/resend-otp";
  static const String verifyOTP = "/api/customers/otp-verify";
  static const String resetPassword = "/api/customers/reset-password";
  // static const String refreshToken = "/api/v1/auth/refresh";
  // static const String deactivate = "/api/v1/auth/users/";


  /// Account Endpoints
  static const String account = "/api/customers";
  static const String accountDelete = "/api/delete-requests";


  /// Products Endpoints
  static const String products = "/api/products";

  /// Carts Endpoints
  static const String getCarts = "/api/cart";
  static const String carts = "/api/cart/items";

  /// Favourites Endpoints
  static const String favourites= "/api/wishlist";

  /// Shipping Address Endpoints
  static const String shippingAddress = "/api/addresses";

  /// Checkout Endpoints
  static const String createOrder = "/api/orders";
  static const String coupon = "/api/coupons/verify";

  /// Orders Endpoints
  static const String orderItems = "/api/orders/items";

  /// Product Reviews Endpoints
  static const String reviews = "/api/reviews";
  static const String getReviews = "/api/reviews/product/";


  /// Basic EndPoints
  static const String campaigns = "/api/basic/campaigns";
  static const String categories = "/api/basic/categories";
  static const String subCategories = "/api/basic/sub-categories";

  /// Common Endpoints
  static const String upload = "/api/aws/get-s3-file-token";


  // Public getter to access the base URL
  static String get baseURL => _baseURL;
  static String get imageBaseURL => _imageBaseURL;

  // Pass without access token
  static List<String> basicAuthUrls = [
    signIn,
    signUp,
    sendOTP,
    verifyOTP,
    campaigns,
    categories,
    subCategories,
    accountDelete
  ];

}