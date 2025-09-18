import 'package:flutter/material.dart';

//* Old Code
// class ContentItem {
//   String type; 
//   String data;
//   ContentItem(this.type, this.data);

//   Widget build(BuildContext context) {
//     if (type == 'text') {
//       return Text(data);
//     } else if (type == 'image') {
//       return Image.network(data);
//     }
//     return Container();
//   }
// }

// class ContentDisplay extends StatelessWidget {
//   final List<ContentItem> items;
//   ContentDisplay(this.items);
//   @override
//   Widget build(BuildContext context) {
//     return Column(children: items.map((item) => item.build(context)).toList());
//   }
// }

//* Answer Code

//? the was a violation of Open/Closed Principle which made the code hard to extend and maintain.
//? The build method in ContentItem had to be modified each time a new content type was added.
//? To fix this, we can use polymorphism by creating subclasses for each content type.

// Abstract base class for content items
abstract class ContentItem {
  final String data;
  ContentItem(this.data);

  Widget build(BuildContext context);
}

// Concrete implementation for each format: Text, Image, etc.
class TextItem extends ContentItem {
  TextItem(String data) : super(data);

  @override
  Widget build(BuildContext context) {
    return Text(data);
  }
}

class ImageItem extends ContentItem {
  ImageItem(String data) : super(data);

  @override
  Widget build(BuildContext context) {
    return Image.network(data);
  }
}


// Display widget  nothing changed here
class ContentDisplay extends StatelessWidget {
  final List<ContentItem> items;
  const ContentDisplay(this.items);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: items.map((item) => item.build(context)).toList(),
    );
  }
}
