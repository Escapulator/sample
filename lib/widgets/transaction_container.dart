import 'package:flutter/material.dart';

class TransactionContainer extends StatelessWidget {
  const TransactionContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 260,
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(16)),
      child: Column(
        children: [
          Row(
            children: [
              Text('Transactions', style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.w700)),
              SizedBox(width: 8),
              Icon(Icons.arrow_forward_ios, size: 18),
            ],
          ),
          Flexible(
            child: ListView.builder(
              itemCount: 3,
              padding: EdgeInsets.zero,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder:
                  (context, index) => ListTile(
                    contentPadding: EdgeInsets.zero,
                    leading: CircleAvatar(),
                    title: Row(
                      children: [
                        Text('GBP ', style: TextStyle(color: Colors.black, fontWeight: FontWeight.w600, fontSize: 18)),
                        Icon(Icons.arrow_forward, color: Colors.black, size: 20),
                        Text(' NGN', style: TextStyle(color: Colors.black, fontWeight: FontWeight.w600, fontSize: 18)),
                      ],
                    ),
                    subtitle: Text(
                      'Converted * Yesterday',
                      style: TextStyle(color: Color(0xFFA6A6A6), fontSize: 14, fontWeight: FontWeight.w400),
                    ),
                    trailing: Padding(
                      padding: const EdgeInsets.only(top: 6.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            '50 GBP',
                            style: TextStyle(color: Colors.black, fontWeight: FontWeight.w600, fontSize: 18),
                          ),
                          Text(
                            '110,862 NGN',
                            style: TextStyle(color: Color(0xFFA6A6A6), fontSize: 14, fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                    ),
                  ),
            ),
          ),
        ],
      ),
    );
  }
}
