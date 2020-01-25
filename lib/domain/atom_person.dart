import 'package:webfeed/domain/atom_link.dart';
import 'package:webfeed/util/helpers.dart';
import 'package:xml/xml.dart';

class AtomPerson {
  final String name;
  final String uri;
  final String email;
  final List<AtomLink> links;

  AtomPerson(this.name, this.uri, this.email, this.links);

  factory AtomPerson.parse(XmlElement element) {
    var name = findElementOrNull(element, "name")?.text;
    var uri = findElementOrNull(element, "uri")?.text;
    var email = findElementOrNull(element, "email")?.text;
    var links = element.findElements("link").map((element) {
      return AtomLink.parse(element);
    }).toList();
    return AtomPerson(name, uri, email, links);
  }
}
