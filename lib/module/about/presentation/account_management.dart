import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/presentation/resources/size_constants.dart';

class AccountManagement extends ConsumerWidget {
  const AccountManagement({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(title: const Text("Account Management"),
      centerTitle: true,
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: SC.lH, vertical: SC.lW),
        child: Column(
          children: [
            Expanded(
              child: Text(
                "Tinder is one of the most popular dating apps worldwide. It allows users to create profiles, swipe through potential matches, and chat with those they're interested in. It's known for its simple interface and casual approach to dating.Tinder is one of the most popular dating apps worldwide. It allows users to create profiles, swipe through potential matches, and chat with those they're interested in. It's known for its simple interface and casual approach to dating.Tinder is one of the most popular dating apps worldwide. It allows users to create profiles, swipe through potential matches, and chat with those they're interested in. It's known for its simple interface and casual approach to dating.Tinder is one of the most popular dating apps worldwide. It allows users to create profiles, swipe through potential matches, and chat with those they're interested in. It's known for its simple interface and casual approach to dating.Tinder is one of the most popular dating apps worldwide. It allows users to create profiles, swipe through potential matches, and chat with those they're interested in. It's known for its simple interface and casual approach to dating.Tinder is one of the most popular dating apps worldwide. It allows users to create profiles, swipe through potential matches, and chat with those they're interested in. It's known for its simple interface and casual approach to dating.Tinder is one of the most popular dating apps worldwide. It allows users to create profiles, swipe through potential matches, and chat with those they're interested in. It's known for its simple interface and casual approach to dating.Tinder is one of the most popular dating apps worldwide. It allows users to create profiles, swipe through potential matches, and chat with those they're interested in. It's known for its simple interface and casual approach to dating.Tinder is one of the most popular dating apps worldwide. It allows users to create profiles, swipe through potential matches, and chat with those they're interested in. It's known for its simple interface and casual approach to dating.Tinder is one of the most popular dating apps worldwide. It allows users to create profiles, swipe through potential matches, and chat with those they're interested in. It's known for its simple interface and casual approach to dating.Tinder is one of the most popular dating apps worldwide. It allows users to create profiles, swipe through potential matches, and chat with those they're interested in. It's known for its simple interface and casual approach to dating.popular dating apps worldwide. It allows users to create profiles, swipe through potential matches, and chat with those they're interested in. It's known for its simple interface and casual approach to dating.commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt",
                textAlign: TextAlign.justify,
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(),
              ),
            )
          ],
        ),
      ),
    );
  }
}
