/* 
Copyright (c) 2022 Swift Models Generated from JSON powered by http://www.json4swift.com

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

For support, please feel free to contact me at https://www.linkedin.com/in/syedabsar

*/

import Foundation
struct Gallery : Codable {
	let id : Int?
	let title : String?
	let path_origin : String?
	let path_thumbnail : String?
	let path_small : String?
	let path_medium : String?
	let path_large : String?
	let source : String?
	let content : String?
	let photographer : String?
	let keyword : String?

	enum CodingKeys: String, CodingKey {

		case id = "id"
		case title = "title"
		case path_origin = "path_origin"
		case path_thumbnail = "path_thumbnail"
		case path_small = "path_small"
		case path_medium = "path_medium"
		case path_large = "path_large"
		case source = "source"
		case content = "content"
		case photographer = "photographer"
		case keyword = "keyword"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		id = try values.decodeIfPresent(Int.self, forKey: .id)
		title = try values.decodeIfPresent(String.self, forKey: .title)
		path_origin = try values.decodeIfPresent(String.self, forKey: .path_origin)
		path_thumbnail = try values.decodeIfPresent(String.self, forKey: .path_thumbnail)
		path_small = try values.decodeIfPresent(String.self, forKey: .path_small)
		path_medium = try values.decodeIfPresent(String.self, forKey: .path_medium)
		path_large = try values.decodeIfPresent(String.self, forKey: .path_large)
		source = try values.decodeIfPresent(String.self, forKey: .source)
		content = try values.decodeIfPresent(String.self, forKey: .content)
		photographer = try values.decodeIfPresent(String.self, forKey: .photographer)
		keyword = try values.decodeIfPresent(String.self, forKey: .keyword)
	}

}
