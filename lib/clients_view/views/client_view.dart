import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

import '../../comon_widgets/client_contact.dart';
import '../../comon_widgets/search_bar.dart';

class ClientView extends StatefulWidget {
  const ClientView({super.key});

  @override
  State<ClientView> createState() => _ClientViewState();
}

class _ClientViewState extends State<ClientView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: FadeInDown(
            delay: Duration(milliseconds: 600), child: const Text('الحجاج')),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 50),
            FadeInRight(
                delay: Duration(milliseconds: 600),
                child: CustomSearchBar(
                  hintText: "ابحث عن الحاج",
                )),
            const SizedBox(height: 20),
            ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 9,
                itemBuilder: ((context, index) {
                  return FadeInLeft(
                      delay: Duration(milliseconds: 600),
                      child: ClientContact());
                })),
          ],
        ),
      ),
    );
  }
}
