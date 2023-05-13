import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PersonDetail extends ConsumerWidget {
  const PersonDetail({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Users Details",style: Theme.of(context).textTheme.bodyText2!.copyWith(fontWeight: FontWeight.w300),),
      centerTitle: true,
      ),
    
    );
    }
}