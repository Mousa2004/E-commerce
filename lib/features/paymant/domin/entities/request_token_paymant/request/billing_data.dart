class BillingData {
  String? email;
  String? firstName;
  String? lastName;
  String? phoneNumber;
  String? street;
  String? building;
  String? floor;
  String? apartment;
  String? city;
  String? country;

  BillingData({
    this.email,
    this.firstName,
    this.lastName,
    this.phoneNumber,
    this.street,
    this.building = "NA",
    this.floor = "NA",
    this.apartment = "NA",
    this.city,
    this.country = "NA",
  });
}
