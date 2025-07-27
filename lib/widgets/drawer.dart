import 'package:flutter/material.dart';
import '../core/feature_list.dart';
import 'drawer_tile.dart';

class CustomDrawer extends StatelessWidget {
  final VoidCallback onClose;
  final double animationValue;

  const CustomDrawer({super.key, required this.onClose, required this.animationValue});

  @override
  Widget build(BuildContext context) {
    final backgroundColor = Color.lerp(const Color(0x33F5F1F2), const Color(0xFFF5F1F2), animationValue);

    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        elevation: 0,
        forceMaterialTransparency: true,
        backgroundColor: backgroundColor,
        leading: Padding(
          padding: EdgeInsets.only(left: 16),
          child: InkWell(
            splashColor: Colors.transparent,
            onTap: onClose,
            child: Container(
              padding: const EdgeInsets.all(8),
              decoration: const BoxDecoration(color: Colors.white, shape: BoxShape.circle),
              child: const Icon(Icons.close),
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            const SizedBox(height: 30),
            Material(
              child: Hero(
                tag: 'avatar',
                child: CircleAvatar(
                  radius: 40,
                  backgroundColor: Colors.black,
                  child: const Text(
                    'JD',
                    style: TextStyle(fontSize: 28, color: Colors.white, fontWeight: FontWeight.w600),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            const Text('John Doe', style: TextStyle(fontSize: 32, fontWeight: FontWeight.w700)),
            Flexible(
              child: ListView.separated(
                shrinkWrap: true,
                padding: EdgeInsets.symmetric(vertical: 20),
                physics: ClampingScrollPhysics(),
                itemBuilder:
                    (context, index) =>
                        DrawerTile(title: listFeature[index].title!, subtitle: listFeature[index].subtitle!),
                separatorBuilder: (context, index) => SizedBox(height: 16),
                itemCount: listFeature.length,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
