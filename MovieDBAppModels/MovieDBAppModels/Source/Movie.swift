//
//  Movie.swift
//  MovieDBAppModels
//
//  Created by Claudio Barbera on 20/02/21.
//

import Foundation

public struct Movie: Decodable {
    
    public let id: Int
    public let overview: String
    public let title: String
    public let voteAverage: Double
    public let voteCount: Int
    
    /*
     "adult": false,
                "backdrop_path": "/drulhSX7P5TQlEMQZ3JoXKSDEfz.jpg",
                "genre_ids": [
                    18,
                    14,
                    878
                ],
                "id": 581389,
                "original_language": "ko",
                "original_title": "승리호",
                "overview": "Nel 2092, l'astronave Victory è una delle tante che sopravvive recuperando detriti spaziali. L'equipaggio è composto dal geniale pilota spaziale Tae-ho, dal misterioso ex pirata Jang, dall'ingegnere Tiger Park e dal robot militare riprogrammato Bubs. Ben presto, il team si ritrova a recuperare con successo una navetta spaziale precipitata al cui interno trova una bambina di sette anni. Costei non è altro che il robot umanoide voluto dalle guardie spaziali UTS e per tale ragione la squadra decide di chiedere un riscatto per il suo rilascio.",
                "popularity": 2581.195,
                "poster_path": "/m2EExYYTjIfAEQqyPKN1I7xOpsk.jpg",
                "release_date": "2021-02-05",
                "title": "Space Sweepers",
                "video": false,
                "vote_average": 7.3,
                "vote_count": 219
            },
     */
}
