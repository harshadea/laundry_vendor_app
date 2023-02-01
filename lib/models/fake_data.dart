import 'package:ecomikstoreapp/models/fake_models/chat_message_model.dart';
import 'package:ecomikstoreapp/models/fake_models/intro_content_model.dart';
import 'package:ecomikstoreapp/models/fake_models/my_order_model.dart';
import 'package:ecomikstoreapp/models/fake_models/product_model.dart';
import 'package:ecomikstoreapp/models/fake_models/product_review_model.dart';
import 'package:ecomikstoreapp/models/fake_models/recent_payment_product_model.dart';
import 'package:ecomikstoreapp/models/fake_models/recent_transaction_model.dart';
import 'package:flutter/material.dart';

class FakeData {
  // Intro screens
  static List<FakeIntroContent> fakeIntroContents = [
    FakeIntroContent(
        localSVGImageLocation: 'assets/images/intro_illustration1.png',
        slogan: 'Discover something new',
        content:
            'Lorem Ipsum is simply dummy text of the printing and typesetting industry'),
    FakeIntroContent(
        localSVGImageLocation: 'assets/images/intro_illustration2.png',
        slogan: 'Clearly different',
        content:
            'Lorem Ipsum is simply dummy text of the printing and typesetting industry'),
    FakeIntroContent(
        localSVGImageLocation: 'assets/images/intro_illustration3.png',
        slogan: 'Buy, think & grow',
        content:
            'Lorem Ipsum is simply dummy text of the printing and typesetting industry'),
  ];

  // Products for various screens
  static List<FakeProductModel> products = [
    FakeProductModel(
        name: 'Sony DR-ZX1AP',
        shortDescription: 'Wireless headphone',
        productImage: Image.asset(
                'assets/images/demo_images/product_categories/item1.png')
            .image,
        price: '14.99',
        availableColors: [
          const Color(0xFFEB8169),
          const Color(0xFFC5C0D6),
          const Color(0xFF292B49),
          const Color(0xFF9BC9BE),
        ],
        availableSizes: ['S', 'M', 'X', 'XL', 'XXL'],
        description:
            'There are many variations of passages Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable.',
        rating: 4.2),
    FakeProductModel(
        name: 'Bose Quiet Comfort',
        shortDescription: 'Wireless headphone',
        productImage: Image.asset(
                'assets/images/demo_images/product_categories/item2.png')
            .image,
        price: '14.99',
        availableColors: [
          const Color(0xFFEB8169),
          const Color(0xFFC5C0D6),
          const Color(0xFF292B49),
          const Color(0xFF9BC9BE),
        ],
        availableSizes: ['S', 'M', 'X', 'XL', 'XXL'],
        description:
            'There are many variations of passages Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable.',
        rating: 4.2),
    FakeProductModel(
        name: 'Beats Pro Wired',
        shortDescription: 'Wireless headphone',
        productImage: Image.asset(
                'assets/images/demo_images/product_categories/item3.png')
            .image,
        price: '14.99',
        availableColors: [
          const Color(0xFFEB8169),
          const Color(0xFFC5C0D6),
          const Color(0xFF292B49),
          const Color(0xFF9BC9BE),
        ],
        availableSizes: ['S', 'M', 'X', 'XL', 'XXL'],
        description:
            'There are many variations of passages Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable.',
        rating: 4.2),
    FakeProductModel(
        name: 'JBL Wireless',
        shortDescription: 'Wireless headphone',
        productImage: Image.asset(
                'assets/images/demo_images/product_categories/item4.png')
            .image,
        price: '14.99',
        availableColors: [
          const Color(0xFFEB8169),
          const Color(0xFFC5C0D6),
          const Color(0xFF292B49),
          const Color(0xFF9BC9BE),
        ],
        availableSizes: ['S', 'M', 'X', 'XL', 'XXL'],
        description:
            'There are many variations of passages Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable.',
        rating: 4.2),
  ];

  /// Sample delivery man chat data
  static List<FakeChatMessageModel> deliveryManChats = [
    FakeChatMessageModel(
      isMyMessage: false,
      message: 'Hey there?\nHow much time?',
      dateTimeText: '11:59 am',
    ),
    FakeChatMessageModel(
      isMyMessage: true,
      message: 'On my way sir.\nWill reach in 10 mins.',
      dateTimeText: '11:59 am',
    ),
    FakeChatMessageModel(
      isMyMessage: false,
      message: 'Ok come with carefully!\nRemember the address please!',
      dateTimeText: '11:59 am',
    ),
    FakeChatMessageModel(
      isMyMessage: true,
      message:
          'Btw, I want to know more about the room space and facilities & can I get some more picture of current.',
      dateTimeText: 'Sep 04 2020',
    ),
  ];

  /// Reviews
  static List<FakeProductReview> reviews = [
    FakeProductReview(
        reviewerName: 'Michle Jhon Smith',
        rating: 4,
        reviewDateText: '23 Sep, 2021',
        reviewText:
            'There are many variations of passages Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable.',
        reviewerProfileImage:
            Image.asset('assets/images/demo_images/reviewers/reviewer1.png')
                .image),
    FakeProductReview(
        reviewerName: 'Angle Saniya',
        rating: 4,
        reviewDateText: '23 Sep, 2021',
        reviewText:
            'There are many variations of passages Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable.',
        reviewerProfileImage:
            Image.asset('assets/images/demo_images/reviewers/reviewer2.png')
                .image)
  ];

  /// My orders
  static List<FakeMyOrderModel> myOrders = [
    FakeMyOrderModel(
        name: 'AJ504 Green Airpod',
        price: '23.00',
        productImage:
            Image.asset('assets/images/demo_images/my_orders/image1.png').image,
        dateText: '26 Dec, 2021',
        orderStatus: 'pending'),
    FakeMyOrderModel(
        name: 'Havit Gamenote',
        price: '23.00',
        productImage:
            Image.asset('assets/images/demo_images/my_orders/image2.png').image,
        dateText: '26 Dec, 2021',
        orderStatus: 'delivered'),
    FakeMyOrderModel(
        name: 'Havit HV-H2116D',
        price: '23.00',
        productImage: Image.asset(
                'assets/images/demo_images/product_categories/item3.png')
            .image,
        dateText: '26 Dec, 2021',
        orderStatus: 'processing'),
    FakeMyOrderModel(
        name: 'KWG Taurus M1',
        price: '23.00',
        productImage:
            Image.asset('assets/images/demo_images/my_orders/image3.png').image,
        dateText: '26 Dec, 2021',
        orderStatus: 'cancelled'),
    FakeMyOrderModel(
        name: 'Havit HV-H2002D',
        price: '23.00',
        productImage:
            Image.asset('assets/images/demo_images/my_orders/image4.png').image,
        dateText: '26 Dec, 2021',
        orderStatus: 'delivered'),
  ];

  /// Recently my bought product
  static List<FakeRecentPaymentProduct> recentPaymentProducts = [
    FakeRecentPaymentProduct(
        productName: 'Sennheiser Headphones',
        paymentDateTimeText: '30 Sep 2021, 11:59am',
        priceText: '129.00',
        itemCount: 3,
        productImage:
            Image.asset('assets/images/demo_images/recent_payment/image1.png')
                .image),
    FakeRecentPaymentProduct(
        productName: 'JBL Headphones',
        paymentDateTimeText: '30 Sep 2021, 11:59am',
        priceText: '129.00',
        itemCount: 3,
        productImage:
            Image.asset('assets/images/demo_images/recent_payment/image2.png')
                .image),
    FakeRecentPaymentProduct(
        productName: 'Beats Headphones',
        paymentDateTimeText: '30 Sep 2021, 11:59am',
        priceText: '129.00',
        itemCount: 3,
        productImage:
            Image.asset('assets/images/demo_images/recent_payment/image3.png')
                .image),
    FakeRecentPaymentProduct(
        productName: 'Bose Headphones',
        paymentDateTimeText: '30 Sep 2021, 11:59am',
        priceText: '129.00',
        itemCount: 3,
        productImage:
            Image.asset('assets/images/demo_images/recent_payment/image4.png')
                .image),
  ];

  /// Recent transactions
  static List<FakeRecentTransaction> recentTransactions = [
    FakeRecentTransaction(
        title: '#ECO52597',
        itemCount: 4,
        dateText: '23 July, 2021',
        timeText: '10:30 pm',
        amountText: '6.80',
        transactionType: 'earning-up'),
    FakeRecentTransaction(
        title: '#ECO84585',
        itemCount: 4,
        dateText: '23 July, 2021',
        timeText: '10:30 pm',
        amountText: '6.80',
        transactionType: 'earning-down'),
    FakeRecentTransaction(
        title: 'Send to bank',
        itemCount: 4,
        dateText: '23 July, 2021',
        timeText: '10:30 pm',
        amountText: '6.80',
        transactionType: 'send-to-bank')
  ];
}
