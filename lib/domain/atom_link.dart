import 'package:xml/xml.dart';

class AtomLink {
  final String href;
  final String rel;
  final String type;
  final String hreflang;
  final String title;
  final int length;
  final int width;
  final int height;

  AtomLink(
    this.href,
    this.rel,
    this.type,
    this.hreflang,
    this.title,
    this.length,
    this.width,
      this.height,
  );

  factory AtomLink.parse(XmlElement element) {
    var href = element.getAttribute("href");
    var rel = element.getAttribute("rel");
    var type = element.getAttribute("type");
    var title = element.getAttribute("title");
    var hreflang = element.getAttribute("hreflang");
    var length = 0;
    if (element.getAttribute("length") != null) {
      length = int.parse(element.getAttribute("length"));
    }
    var width;
    var temp = element.getAttribute('media:width');
    if(temp!= null){
      width = int.parse(temp);
    }
    var height;
    temp = element.getAttribute('media:height');
    if(temp!= null){
      height = int.parse(temp);
    }

    return AtomLink(href, rel, type, hreflang, title, length, width, height);
  }
}
