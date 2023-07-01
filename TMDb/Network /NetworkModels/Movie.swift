

import Foundation
struct Movie: Codable {
	let adult: Bool?
	let backdropPath: String?
	let id: Int?
	let title: String?
	let originalLanguage: String?
	let originalTitle: String?
	let overview: String?
	let posterPath: String?
	let mediaType: String?
	let genreIds: [Int]?
	let popularity: Double?
	let releaseDate: String?
	let video: Bool?
	let voteAverage: Double?
	let voteCount: Int?

	enum CodingKeys: String, CodingKey {

		case adult = "adult"
		case backdropPath = "backdrop_path"
		case id = "id"
		case title = "title"
		case originalLanguage = "original_language"
		case originalTitle = "original_title"
		case overview = "overview"
		case posterPath = "poster_path"
		case mediaType = "media_type"
		case genreIds = "genre_ids"
		case popularity = "popularity"
		case releaseDate = "release_date"
		case video = "video"
		case voteAverage = "vote_average"
		case voteCount = "vote_count"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		adult = try values.decodeIfPresent(Bool.self, forKey: .adult)
		backdropPath = try values.decodeIfPresent(String.self, forKey: .backdropPath)
		id = try values.decodeIfPresent(Int.self, forKey: .id)
		title = try values.decodeIfPresent(String.self, forKey: .title)
		originalLanguage = try values.decodeIfPresent(String.self, forKey: .originalLanguage)
		originalTitle = try values.decodeIfPresent(String.self, forKey: .originalTitle)
		overview = try values.decodeIfPresent(String.self, forKey: .overview)
		posterPath = try values.decodeIfPresent(String.self, forKey: .posterPath)
		mediaType = try values.decodeIfPresent(String.self, forKey: .mediaType)
		genreIds = try values.decodeIfPresent([Int].self, forKey: .genreIds)
		popularity = try values.decodeIfPresent(Double.self, forKey: .popularity)
		releaseDate = try values.decodeIfPresent(String.self, forKey: .releaseDate)
		video = try values.decodeIfPresent(Bool.self, forKey: .video)
		voteAverage = try values.decodeIfPresent(Double.self, forKey: .voteAverage)
		voteCount = try values.decodeIfPresent(Int.self, forKey: .voteCount)
	}

}
