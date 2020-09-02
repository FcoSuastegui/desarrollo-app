import 'package:flutter/material.dart';

class CardFrontLayout {
  String bankName;
  String cardNumber;
  String cardExpiry;
  String cardHolderName;
  Widget cardTypeIcon;
  double cardWidth;
  double cardHeight;
  Color textColor;

  CardFrontLayout(
      {this.bankName = "",
      this.cardNumber = "",
      this.cardExpiry = "",
      this.cardHolderName = "",
      this.cardTypeIcon,
      this.cardWidth = 0,
      this.cardHeight = 0,
      this.textColor});

  Widget layout1() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 8, 20, 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(
            height: 8,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Expanded(
                flex: 1,
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Image.asset(
                    "assets/card_wallet/card_chip_silver.png",
                    width: 40,
                    height: 40,
                  ),
                )
              ),
              cardTypeIcon
            ],
          ),
          Expanded(
            child: Align(
              alignment: Alignment.topLeft,
              child: Container(
                height: 30.0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Expanded(
                          child: Container(
                            child: Text(
                              cardNumber == null || cardNumber.isEmpty
                                  ? 'XXXX XXXX XXXX XXXX'
                                  : cardNumber,
                              style: TextStyle(
                                  color: textColor,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 15.0
                              ),
                            ),
                          ),
                        ),
                      ]
                    )
                  ]
                )
              )
            )
          ),
          
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Expanded(
                flex: 2,
                child: Text(
                  "Nombre del titular",
                  style: TextStyle(
                    color: textColor,
                    fontSize: 10.0
                  ),
                ),
              ),
              Expanded(
                child: Text(
                  "Válido hasta",
                  textAlign: TextAlign.right,
                  style: TextStyle(
                      color: textColor,
                      fontWeight: FontWeight.w500,
                      fontSize: 10.0
                  ),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Expanded(
                flex: 3,
                child: Text(
                  cardHolderName == null || cardHolderName.isEmpty
                  ? ""
                  : _capitalize(cardHolderName),
                  style: TextStyle(
                    color: textColor,
                    fontSize: 10.0
                  ),
                ),
              ),
              Expanded(
                child: Text(
                  cardExpiry == null || cardExpiry.isEmpty
                      ? "MM/YY"
                      : cardExpiry,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: textColor,
                    fontWeight: FontWeight.w500,
                    fontSize: 10.0
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  String _capitalize(String text) =>  text[0].toUpperCase() + text.substring(1);

  
}
