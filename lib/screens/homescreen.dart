import 'package:flutter/material.dart';
import '../widgets/circle_dots.dart';
import '../widgets/custom_button.dart';
import '../widgets/drawer.dart';
import '../widgets/transaction_container.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  bool _isDragging = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
  }

  void _onDragStart(DragStartDetails details) {
    final screenWidth = MediaQuery.of(context).size.width;
    final dx = details.globalPosition.dx;

    final isOpening = _controller.isDismissed && dx < 60;
    final isClosing = _controller.isCompleted && dx > screenWidth - 60;

    _isDragging = isOpening || isClosing;
  }

  void _onDragUpdate(DragUpdateDetails details) {
    if (_isDragging) {
      final delta = details.primaryDelta! / MediaQuery.of(context).size.width;
      _controller.value += delta;
    }
  }

  void _onDragEnd(DragEndDetails details) {
    if (_controller.value > 0.5) {
      _controller.forward();
    } else {
      _controller.reverse();
    }
    _isDragging = false;
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return GestureDetector(
      onHorizontalDragStart: _onDragStart,
      onHorizontalDragUpdate: _onDragUpdate,
      onHorizontalDragEnd: _onDragEnd,
      behavior: HitTestBehavior.translucent,
      child: AnimatedBuilder(
        animation: _controller,
        builder: (context, _) {
          final slide = width * _controller.value;
          return Stack(
            children: [
              Scaffold(
                backgroundColor: Colors.white,
                body: SingleChildScrollView(
                  padding: EdgeInsets.only(
                    top: kToolbarHeight,
                    left: 16,
                    right: 16,
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkResponse(
                            splashColor: Colors.transparent,
                            onTap: () => _controller.forward(),
                            child: Hero(
                              tag: 'avatar',
                              child: CircleAvatar(
                                radius: 24,
                                backgroundColor: Colors.black,
                                child: Text(
                                  'JD',
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Color(0xFF08A227),
                              elevation: 0,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(48),
                              ),
                            ),
                            child: Text(
                              'Earn N10k',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 90),
                      const Text(
                        'GBP Balance',
                        style: TextStyle(
                          color: Color(0xFF8d8c8a),
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const Text(
                        'GBP 67',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 34,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 16),
                      Container(
                        decoration: BoxDecoration(
                          color: Color(0xFFE6E6E6),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        padding: EdgeInsets.symmetric(
                          vertical: 8,
                          horizontal: 16,
                        ),
                        child: const Text(
                          'Accounts',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                      const SizedBox(height: 30),
                      const SizedBox(
                        height: 12,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CircleDot(active: true),
                            CircleDot(active: false),
                            CircleDot(active: false),
                            CircleDot(active: false),
                          ],
                        ),
                      ),
                      const SizedBox(height: 16),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CustomButton(
                            icon: Icons.arrow_upward,
                            label: 'Send',
                            bg: Colors.black,
                            fg: Colors.white,
                          ),
                          const SizedBox(width: 8),
                          CustomButton(
                            icon: Icons.swap_horiz,
                            label: 'Convert',
                            bg: Color(0xFFE6E6E6),
                            fg: Colors.black,
                          ),
                          const SizedBox(width: 8),
                          CustomButton(
                            icon: Icons.add,
                            label: 'Add',
                            bg: Color(0xFFE6E6E6),
                            fg: Colors.black,
                          ),
                          const SizedBox(width: 8),
                          ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Color(0xFFE6E6E6),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            child: const Icon(
                              Icons.more_horiz,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 24),
                      const TransactionContainer(),
                      const SizedBox(height: 24),
                      const TransactionContainer(),
                    ],
                  ),
                ),
              ),
              Transform.translate(
                offset: Offset(-width + slide, 0),
                child: SizedBox(
                  width: width,
                  height: MediaQuery.of(context).size.height,
                  child: CustomDrawer(
                    onClose: () => _controller.reverse(),
                    animationValue: _controller.value,
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
