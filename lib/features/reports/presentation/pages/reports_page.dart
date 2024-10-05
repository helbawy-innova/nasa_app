import 'package:flutter/material.dart';

import '../../../../utility/app_widgets/svg_icon.dart';
import '../../../../utility/colors/app_colors.dart';

class ReportsPage extends StatelessWidget {
  const ReportsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.separated(
        itemCount: 10,
        padding: const EdgeInsets.all(24),
        itemBuilder: (context, index) {
          return Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              border: Border.all(width: .5, color: Colors.grey.withOpacity(.5)),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Report Title", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 4,
                        backgroundColor: Colors.red,
                      ),
                      SizedBox(width: 8),
                      Text("Data Report", style: TextStyle(fontSize: 12)),
                    ],
                  ),
                ),
                Row(
                  children: [
                    Container(
                      width: 30,
                      height: 30,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.white, width: 2),
                        image: DecorationImage(
                          image: NetworkImage("https://images.pexels.com/photos/614810/pexels-photo-614810.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1"),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    SizedBox(width: 8),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Mohamed Helbawy", style: TextStyle(fontSize: 12, color: MainThemeColors.primary)),
                        Text("Admin", style: TextStyle(fontSize: 10)),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 8),
                Text(
                  "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla nec purus feugiat, molestie ipsum et, ultricies nunc. Nulla facilisi. Nullam ac nisi non nunc tincidunt fringilla. Nulla facilisi. Nullam ac nisi non nunc tincidunt fringilla.",
                  style: TextStyle(fontSize: 14),
                  maxLines: 4,
                  overflow: TextOverflow.ellipsis,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  child: Divider(thickness: .5, height: 0),
                ),
                Row(
                  children: [
                    Expanded(
                      child: Row(
                        children: [
                          drawSvgIcon('calendar', iconColor: MainThemeColors.grey1, width: 16, height: 16),
                          SizedBox(width: 8),
                          Text(
                            "12/12/2021",
                            style: TextStyle(fontSize: 14),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: 16),
                    CircleAvatar(
                      radius: 18,
                      backgroundColor: MainThemeColors.primary2,
                      child: Center(
                        child: Icon(Icons.download),
                      ),
                    ),
                    SizedBox(width: 16),
                    CircleAvatar(
                      radius: 18,
                      backgroundColor: MainThemeColors.primary2,
                      child: Center(
                        child: Icon(Icons.share),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
        separatorBuilder: (context, index) {
          return SizedBox(height: 16);
        },
      ),
    );
  }
}
