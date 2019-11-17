
import 'package:flutter/material.dart';

class DivBox extends StatelessWidget {
    @override
      Widget build(BuildContext context) {
        return Container(
            child: Column(
                children: <Widget>[
                    // 变相当间距
                    SizedBox(height : 20.0),
                    SizedBox(
                        width: 150.0,
                        height: 150.0,
                        child: Container(
                            // margin:,
                            // alignment: Alignment(-0.9, 0.8),
                            // alignment: Alignment.topRight,
                            alignment: Alignment.bottomRight,
                            decoration: BoxDecoration(
                                
                                 color: Colors.red,
                                 borderRadius: BorderRadius.circular(8.0)
                            ),
                            child: Icon(Icons.account_balance_wallet, color: Colors.white,),
                               
                        ),
                    )
                ],
            ),
        );
      }
}