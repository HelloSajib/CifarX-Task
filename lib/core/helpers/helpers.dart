
class Helpers{
  const Helpers._();


  static double calculateDiscountedPrice(double amount, int discountPercent) {
    if(amount <= 0 && discountPercent <= 0) return amount;

    final discount = (amount * discountPercent) / 100;
    final finalPrice = amount - discount;

    return finalPrice;
  }

}