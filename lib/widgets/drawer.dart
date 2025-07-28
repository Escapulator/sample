import 'package:flutter/material.dart';
import '../core/feature_list.dart';
import 'drawer_tile.dart';

class CustomDrawer extends StatelessWidget {
  final VoidCallback onClose;
  final double animationValue;

  const CustomDrawer({
    super.key,
    required this.onClose,
    required this.animationValue,
  });

  @override
  Widget build(BuildContext context) {
    final backgroundColor = Color.lerp(
      const Color(0x33F5F1F2),
      const Color(0xFFF5F1F2),
      animationValue,
    );
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
              decoration: const BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
              ),
              child: const Icon(Icons.close),
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: CustomScrollView(
          physics: ClampingScrollPhysics(),
          slivers: [
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  children: [
                    const SizedBox(height: 30),
                    if (animationValue == 1.0)
                      CircleAvatar(
                        radius: 40,
                        backgroundColor: Colors.black,
                        child: const Text(
                          'JD',
                          style: TextStyle(
                            fontSize: 28,
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    const SizedBox(height: 20),
                    const Text(
                      'John Doe',
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ),
            SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              sliver: SliverList.separated(
                itemBuilder: (context, index) {
                  final item = listFeature[index];
                  return index < listFeature.length - 1
                      ? DrawerTile(title: item.title!, subtitle: item.subtitle!)
                      : ListTile(
                        tileColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        title: Text(
                          item.title!,
                          style: TextStyle(
                            color: Colors.red,
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        trailing: Icon(
                          Icons.arrow_forward_ios,
                          color: Color(0XFFAFAFAF),
                        ),
                      );
                },
                separatorBuilder:
                    (context, index) => const SizedBox(height: 16),
                itemCount: listFeature.length,
              ),
            ),
            SliverToBoxAdapter(child: SizedBox(height: 30)),
          ],
        ),
      ),
    );
  }
}
