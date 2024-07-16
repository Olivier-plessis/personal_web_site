import 'package:design_ui/design_ui.dart';
import 'package:flutter/material.dart';
import 'package:olivierplessis/src/home/domain/model/portfolio/portfolio_model.dart';

class WorkDetailItemLayout extends StatelessWidget {
  WorkDetailItemLayout({super.key, required this.workItem});
  final WorkItem? workItem;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 66.0.h),
            const Text('Description', style: TextStyle()),
            const SizedBox(height: 8),
            buildMessageRow(
                message:
                    'lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
                imagePath: workItem?.coverImage ?? ''),
            const SizedBox(height: 12),
          ],
        ),
      ),
    );
  }

  Row buildMessageRow({required String imagePath, required String message}) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CircleAvatar(
          backgroundImage: AssetImage(
            imagePath,
            package: 'design_ui',
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: Colors.black26, width: 2),
            ),
            padding: const EdgeInsets.all(16),
            // child: const Text('What a trip! Thanks for all the memories! Whats next?'),
            child: Text(message),
          ),
        ),
      ],
    );
  }
}
