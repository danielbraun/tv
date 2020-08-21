SELECT query_to_xml_and_xmlschema('select * from tv.channels where active = true order by position, id;', FALSE, FALSE, '') AS xml;
