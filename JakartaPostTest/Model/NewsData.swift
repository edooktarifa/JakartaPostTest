/* 
Copyright (c) 2022 Swift Models Generated from JSON powered by http://www.json4swift.com

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

For support, please feel free to contact me at https://www.linkedin.com/in/syedabsar

*/

import Foundation
struct NewsData : Codable {
	let id : String?
	let published_date : String?
	let location : String?
	let title : String?
	let path : String?
	let summary : String?
	let channels : Channels?
	let tags : [Tags]?
	let gallery : [Gallery]?
	let is_premium : Bool?
	let is_longform : Bool?
	let source_id : Int?
	let line : String?
	let writer : Writer?
	let publisher : Publisher?

	enum CodingKeys: String, CodingKey {

		case id = "id"
		case published_date = "published_date"
		case location = "location"
		case title = "title"
		case path = "path"
		case summary = "summary"
		case channels = "channels"
		case tags = "tags"
		case gallery = "gallery"
		case is_premium = "is_premium"
		case is_longform = "is_longform"
		case source_id = "source_id"
		case line = "line"
		case writer = "writer"
		case publisher = "publisher"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		id = try values.decodeIfPresent(String.self, forKey: .id)
		published_date = try values.decodeIfPresent(String.self, forKey: .published_date)
		location = try values.decodeIfPresent(String.self, forKey: .location)
		title = try values.decodeIfPresent(String.self, forKey: .title)
		path = try values.decodeIfPresent(String.self, forKey: .path)
		summary = try values.decodeIfPresent(String.self, forKey: .summary)
		channels = try values.decodeIfPresent(Channels.self, forKey: .channels)
		tags = try values.decodeIfPresent([Tags].self, forKey: .tags)
		gallery = try values.decodeIfPresent([Gallery].self, forKey: .gallery)
		is_premium = try values.decodeIfPresent(Bool.self, forKey: .is_premium)
		is_longform = try values.decodeIfPresent(Bool.self, forKey: .is_longform)
		source_id = try values.decodeIfPresent(Int.self, forKey: .source_id)
		line = try values.decodeIfPresent(String.self, forKey: .line)
		writer = try values.decodeIfPresent(Writer.self, forKey: .writer)
		publisher = try values.decodeIfPresent(Publisher.self, forKey: .publisher)
	}

}
