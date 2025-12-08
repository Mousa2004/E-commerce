class ApiEndpoints {
  static const String baseUrl = "https://ecommerce.routemisr.com/";
  static const String apiLogin = "api/v1/auth/signin";
  static const String apiRegister = "api/v1/auth/signup";
  static const String apiCategories = "api/v1/categories";
  static const String apiProducts = "api/v1/products";
  static const String apiBrands = "api/v1/brands";
  static const String apiAddCart = "api/v1/cart";
  static const String apiGetCart = "api/v1/cart";
  static const String apiDeleteCart = "api/v1/cart/{productId}";
  static const String apiUpdateCart = "api/v1/cart/{productId}";
  static const String apiaddToWishlist = "api/v1/wishlist";
  static const String apideleteFromWishlist = "api/v1/wishlist/{productId}";
  static const String apiSubcategories =
      "api/v1/categories/{categoryId}/subcategories";

  static const String apiPaymantBase = "https://accept.paymob.com/";
  static const String apiAuthTokenPaymant = "api/auth/tokens";
  static const String apiOrderIdTokenPaymant = "api/ecommerce/orders";
  static const String apiRequestTokenPaymant = "api/acceptance/payment_keys";
  static const String apiKeyPayment =
      "ZXlKaGJHY2lPaUpJVXpVeE1pSXNJblI1Y0NJNklrcFhWQ0o5LmV5SmpiR0Z6Y3lJNklrMWxjbU5vWVc1MElpd2ljSEp2Wm1sc1pWOXdheUk2TVRFeE1qUTRPU3dpYm1GdFpTSTZJakUzTmpVeE9UUTFOamt1TVRReE5UQTFJbjAuY3VVa01fUWFldDlFbE81ZzRUMlB6aEtGY19DVU5iYktFcnFVaTVQam5tU1l2eFNXMGpsYWdDekI4VVduTDBVTGdaN0pjOUlfaDh3QTJlMGtSR1NwZVE=";
  static const int apiIntegrationId = 5422260;
}
