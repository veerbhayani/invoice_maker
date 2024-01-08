class Products {
  String? productName;
  String? price;

  Products({this.productName, this.price});

  factory Products.fromJson(Map<String, dynamic> json) => Products(
        price: json['price'],
        productName: json['productName'],
      );

  Map<String, dynamic> toJson() {
    Map<String, dynamic> data = {};
    if (productName != null) {
      data['productName'] = productName;
    }
    if (price != null) {
      data['price'] = price;
    }
    return data;
  }
}

class Customer {
  String? customerName;
  String? customerNumber;

  Customer({this.customerName, this.customerNumber});

  // Factory method to create a Customer instance from a Map
  factory Customer.fromJson(Map<String, dynamic> json) => Customer(
        customerName: json['customerName'],
        customerNumber: json['customerNumber'],
      );

  Map<String, dynamic> toJson() {
    Map<String, dynamic> data = {};
    if (customerName != null) {
      data['customerName'] = customerName;
    }
    if (customerNumber != null) {
      data['customerNumber'] = customerNumber;
    }

    return data;
  }
}

  // Method to convert a Customer instance to a Map
  

