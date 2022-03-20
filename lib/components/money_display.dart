import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final textStyleCurrencyValue = GoogleFonts.nunito(
    textStyle: const TextStyle(
        fontSize: 50,
        fontWeight: FontWeight.bold
    )
);

const textStyleCurrencySymbol = (
    TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w300,
        color: Colors.white60
    )
);

const textStyleCurrencyDecimal = (
    TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.bold,
    )
);

const textStyleHint = (
    TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w300,
      color: Colors.white60
    )
);


class MoneyDisplay extends StatelessWidget {
  const MoneyDisplay({Key? key, required this.value, required this.symbol}) : super(key: key);

  final double value;
  final String symbol;

  @override
  Widget build(BuildContext context) {
    var valueSplited = value.toStringAsFixed(2).split(".");
    var integer = valueSplited[0];
    var fraction = valueSplited[1];


    return Column(
      children: [
        const Text("Spent this week", style: textStyleHint),
        RichText(
          text: TextSpan(children: [
            WidgetSpan(
              child: Transform.translate(
                offset: const Offset(-4, -15),
                child: Text(
                  symbol,
                  style: textStyleCurrencySymbol,
                ),
              ),
            ),
            TextSpan(
                text: integer,
                style: textStyleCurrencyValue
            ),
            WidgetSpan(
              child: Transform.translate(
                offset: const Offset(2, -15),
                child: Text(
                  ".$fraction",
                  style: textStyleCurrencyDecimal,
                ),
              ),
            ),
          ]),
        )
      ],
    );
  }
}
