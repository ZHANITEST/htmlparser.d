/*
 * htmlparser.d
 *
 * @ D언어에 가볍게 쓸만한 HTML파서가 없다는 걸 깨닫고, 포팅하게 되었습니다. ;)
 * @ License: Mozilla Public License
 *
 * ==================== Original ====================
 * HTML Parser By John Resig (ejohn.org)
 * Original code by Erik Arvidsson, Mozilla Public License
 * http://erik.eae.net/simplehtmlparser/simplehtmlparser.js
 *
 * // Use like so:
 * HTMLParser(htmlString, {
 *     start: function(tag, attrs, unary) {},
 *     end: function(tag) {},
 *     chars: function(text) {},
 *     comment: function(text) {}
 * });
 *
 * // or to get an XML string:
 * HTMLtoXML(htmlString);
 *
 * // or to get an XML DOM Document
 * HTMLtoDOM(htmlString);
 *
 * // or to inject into an existing document/DOM node
 * HTMLtoDOM(htmlString, document);
 * HTMLtoDOM(htmlString, document.body);
 *
 */
import std.string:split;

bool[string] makeMap( string str ){
	bool[string] obj;
	string[] items = split(str, ",");
	for ( uint i = 0; i < items.length; i++ )
		obj[ items[i] ] = true;
	return obj;
}

string tartTag = "/^<([-A-Za-z0-9_]+)((?:\\s+\\w+(?:\\s*=\\s*(?:(?:\"[^\"]*\")|(?:'[^']*')|[^>\\s]+))?)*)\\s*(\\/?)>/";
string endTag = "/^<\\/([-A-Za-z0-9_]+)[^>]*>/";
string attr = "/([-A-Za-z0-9_]+)(?:\\s*=\\s*(?:(?:\"((?:\\.|[^\"])*)\")|(?:'((?:\\.|[^'])*)')|([^>\\s]+)))?/g";