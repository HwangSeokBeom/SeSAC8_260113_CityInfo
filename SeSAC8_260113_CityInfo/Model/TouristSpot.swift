//
//  TouristSpot.swift
//  SeSAC8_260113_CityInfo
//
//  Created by Hwangseokbeom on 1/15/26.
//

import Foundation

struct TouristSpot {
    let id: Int
    let koreanName: String
    let englishName: String
    let latitude: Double
    let longitude: Double
    let address: String
    let phoneNumber: String
    let websiteURL: String
    let description: String
    let city: String  // CityInfo의 city_name과 매칭 (예: "서울", "부산", "통영")
    var ad: Bool      // true: 광고, false: 일반 관광지
}

struct TouristSpotInfo {
    let spots: [TouristSpot] = [
        // MARK: - 서울 (10개)
        TouristSpot(
            id: 1,
            koreanName: "경복궁",
            englishName: "Gyeongbokgung Palace",
            latitude: 37.5796,
            longitude: 126.9770,
            address: "서울특별시 종로구 사직로 161",
            phoneNumber: "02-3700-3900",
            websiteURL: "https://royal.khs.go.kr/",
            description: "1395년 창건된 조선왕조의 정궁으로, 서울 5대 궁궐 중 가장 크고 아름다운 궁궐입니다.",
            city: "서울",
            ad: false
        ),
        TouristSpot(
            id: 2,
            koreanName: "N서울타워",
            englishName: "N Seoul Tower",
            latitude: 37.5512,
            longitude: 126.9882,
            address: "서울특별시 용산구 남산공원길 105",
            phoneNumber: "02-3455-9277",
            websiteURL: "https://www.nseoultower.co.kr/",
            description: "남산 정상에 위치한 서울의 대표적인 랜드마크로, 사랑의 자물쇠와 야경으로 유명합니다.",
            city: "서울",
            ad: false
        ),
        TouristSpot(
            id: 3,
            koreanName: "롯데월드타워",
            englishName: "Lotte World Tower",
            latitude: 37.5126,
            longitude: 127.1026,
            address: "서울특별시 송파구 올림픽로 300",
            phoneNumber: "02-3213-5000",
            websiteURL: "https://www.lwt.co.kr/",
            description: "555m 높이의 123층 대한민국 최고층 빌딩으로, 전망대 서울스카이에서 서울 전경을 감상할 수 있습니다.",
            city: "서울",
            ad: false
        ),
        
        // MARK: - 광고 1
        TouristSpot(
            id: 1001,
            koreanName: "설 연휴 특별 프로모션",
            englishName: "Lunar New Year Special",
            latitude: 0.0,
            longitude: 0.0,
            address: "",
            phoneNumber: "1588-0000",
            websiteURL: "https://www.promotion.com/",
            description: "🎊 올해 설 연휴엔 이런 여행을 떠나보세요! 국내 인기 여행지 최대 50% 할인 중",
            city: "",
            ad: true
        ),
        
        TouristSpot(
            id: 4,
            koreanName: "북촌한옥마을",
            englishName: "Bukchon Hanok Village",
            latitude: 37.5824,
            longitude: 126.9850,
            address: "서울특별시 종로구 계동길 37",
            phoneNumber: "02-2148-4160",
            websiteURL: "https://hanok.seoul.go.kr/",
            description: "경복궁과 창덕궁 사이에 위치한 전통 한옥 밀집 지역으로, 조선시대 양반가옥의 정취를 느낄 수 있습니다.",
            city: "서울",
            ad: false
        ),
        TouristSpot(
            id: 5,
            koreanName: "광화문광장",
            englishName: "Gwanghwamun Square",
            latitude: 37.5759,
            longitude: 126.9769,
            address: "서울특별시 종로구 세종대로 172",
            phoneNumber: "02-2133-7732",
            websiteURL: "https://gwanghwamun.seoul.go.kr/",
            description: "서울 도심의 중심 광장으로, 세종대왕 동상과 이순신 장군 동상이 있는 시민 휴식 공간입니다.",
            city: "서울",
            ad: false
        ),
        TouristSpot(
            id: 6,
            koreanName: "동대문디자인플라자",
            englishName: "Dongdaemun Design Plaza",
            latitude: 37.5673,
            longitude: 127.0095,
            address: "서울특별시 중구 을지로 281",
            phoneNumber: "02-2153-0000",
            websiteURL: "https://www.ddp.or.kr/",
            description: "자하 하디드가 설계한 세계 최대 비정형 건축물로, 전시와 패션쇼가 열리는 복합문화공간입니다.",
            city: "서울",
            ad: false
        ),
        
        // MARK: - 광고 2
        TouristSpot(
            id: 1002,
            koreanName: "봄맞이 여행 페스티벌",
            englishName: "Spring Travel Festival",
            latitude: 0.0,
            longitude: 0.0,
            address: "",
            phoneNumber: "1588-1111",
            websiteURL: "https://www.springfest.com/",
            description: "🌸 벚꽃 시즌 얼리버드 예약! 3월 출발 상품 20% 할인 + 무료 픽업 서비스",
            city: "",
            ad: true
        ),
        
        TouristSpot(
            id: 7,
            koreanName: "창덕궁",
            englishName: "Changdeokgung Palace",
            latitude: 37.5794,
            longitude: 126.9910,
            address: "서울특별시 종로구 율곡로 99",
            phoneNumber: "02-3668-2300",
            websiteURL: "https://royal.khs.go.kr/",
            description: "유네스코 세계문화유산으로, 자연과 조화를 이룬 후원(비원)이 아름다운 조선의 궁궐입니다.",
            city: "서울",
            ad: false
        ),
        TouristSpot(
            id: 8,
            koreanName: "명동",
            englishName: "Myeongdong",
            latitude: 37.5636,
            longitude: 126.9854,
            address: "서울특별시 중구 명동길 일대",
            phoneNumber: "02-774-9911",
            websiteURL: "https://www.visitseoul.net/",
            description: "서울 최대의 쇼핑 관광지로, 화장품과 패션, 맛집이 밀집한 외국인 관광객 인기 명소입니다.",
            city: "서울",
            ad: false
        ),
        TouristSpot(
            id: 9,
            koreanName: "이태원",
            englishName: "Itaewon",
            latitude: 37.5345,
            longitude: 126.9946,
            address: "서울특별시 용산구 이태원로 일대",
            phoneNumber: "02-794-5579",
            websiteURL: "https://www.visitseoul.net/",
            description: "서울 최초의 관광특구로, 다국적 음식점과 다문화 분위기를 즐길 수 있는 국제적인 거리입니다.",
            city: "서울",
            ad: false
        ),
        TouristSpot(
            id: 10,
            koreanName: "홍대",
            englishName: "Hongdae",
            latitude: 37.5563,
            longitude: 126.9236,
            address: "서울특별시 마포구 어울마당로 일대",
            phoneNumber: "02-323-2240",
            websiteURL: "https://www.visitseoul.net/",
            description: "젊음과 예술의 거리로, 인디밴드 공연과 클럽, 카페가 있는 트렌디한 문화 중심지입니다.",
            city: "서울",
            ad: false
        ),
        
        // MARK: - 광고 3
        TouristSpot(
            id: 1003,
            koreanName: "프리미엄 호텔 특가",
            englishName: "Premium Hotel Deal",
            latitude: 0.0,
            longitude: 0.0,
            address: "",
            phoneNumber: "1588-2222",
            websiteURL: "https://www.hotelpromo.com/",
            description: "✨ 5성급 호텔 1박 특가! 조식 포함 & 레이트 체크아웃 무료 제공",
            city: "",
            ad: true
        ),
        
        // MARK: - 부산 (5개)
        TouristSpot(
            id: 11,
            koreanName: "해운대해수욕장",
            englishName: "Haeundae Beach",
            latitude: 35.1587,
            longitude: 129.1604,
            address: "부산광역시 해운대구 해운대해변로 264",
            phoneNumber: "051-749-5700",
            websiteURL: "https://www.haeundae.go.kr/tour/",
            description: "대한민국 최고의 해수욕장으로, 1.5km 백사장과 다양한 편의시설을 갖추고 있습니다.",
            city: "부산",
            ad: false
        ),
        TouristSpot(
            id: 12,
            koreanName: "광안리해수욕장",
            englishName: "Gwangalli Beach",
            latitude: 35.1525,
            longitude: 129.1190,
            address: "부산광역시 수영구 광안해변로 219",
            phoneNumber: "051-622-4251",
            websiteURL: "https://www.suyeong.go.kr/tour/",
            description: "광안대교의 화려한 야경으로 유명하며, 부산세계불꽃축제가 열리는 장소입니다.",
            city: "부산",
            ad: false
        ),
        TouristSpot(
            id: 13,
            koreanName: "감천문화마을",
            englishName: "Gamcheon Culture Village",
            latitude: 35.0963,
            longitude: 129.0088,
            address: "부산광역시 사하구 감내2로 203",
            phoneNumber: "051-204-1444",
            websiteURL: "https://www.gamcheon.or.kr/",
            description: "한국의 마추픽추로 불리며, 알록달록한 집들과 벽화가 있는 예술마을입니다.",
            city: "부산",
            ad: false
        ),
        
        // MARK: - 광고 4
        TouristSpot(
            id: 1004,
            koreanName: "부산 맛집 투어",
            englishName: "Busan Food Tour",
            latitude: 0.0,
            longitude: 0.0,
            address: "",
            phoneNumber: "1588-3333",
            websiteURL: "https://www.busanfood.com/",
            description: "🍜 부산 로컬 맛집 완전정복! 자갈치 회부터 밀면까지, 현지인 추천 코스",
            city: "",
            ad: true
        ),
        
        TouristSpot(
            id: 14,
            koreanName: "용두산공원",
            englishName: "Yongdusan Park",
            latitude: 35.1007,
            longitude: 129.0260,
            address: "부산광역시 중구 용두산길 37-55",
            phoneNumber: "051-860-7820",
            websiteURL: "https://www.bisco.or.kr/yongdusanpark/",
            description: "부산타워가 위치한 도심 속 공원으로, 부산 시내와 부산항 전경을 조망할 수 있습니다.",
            city: "부산",
            ad: false
        ),
        TouristSpot(
            id: 15,
            koreanName: "자갈치시장",
            englishName: "Jagalchi Market",
            latitude: 35.0913,
            longitude: 129.0247,
            address: "부산광역시 중구 자갈치해안로 52",
            phoneNumber: "051-713-8000",
            websiteURL: "https://bisco.or.kr/jagalchimarket/",
            description: "한국 최대의 수산물 시장으로, 신선한 해산물을 현장에서 바로 맛볼 수 있습니다.",
            city: "부산",
            ad: false
        ),
        
        // MARK: - 통영 (5개)
        TouristSpot(
            id: 16,
            koreanName: "동피랑벽화마을",
            englishName: "Dongpirang Mural Village",
            latitude: 34.8423,
            longitude: 128.4248,
            address: "경상남도 통영시 동피랑1길 6-18",
            phoneNumber: "055-642-3400",
            websiteURL: "https://www.utour.go.kr/",
            description: "동쪽 벼랑이라는 뜻의 마을로, 골목마다 형형색색 벽화가 그려진 포토스팟입니다.",
            city: "통영",
            ad: false
        ),
        TouristSpot(
            id: 17,
            koreanName: "통영케이블카",
            englishName: "Tongyeong Cable Car",
            latitude: 34.8150,
            longitude: 128.4024,
            address: "경상남도 통영시 발개로 205",
            phoneNumber: "1544-3303",
            websiteURL: "https://cablecar.ttdc.kr/",
            description: "국내 최장 1,975m 길이의 케이블카로, 미륵산에서 한려수도 절경을 감상할 수 있습니다.",
            city: "통영",
            ad: false
        ),
        
        // MARK: - 광고 5
        TouristSpot(
            id: 1005,
            koreanName: "여름휴가 사전예약",
            englishName: "Summer Vacation Pre-order",
            latitude: 0.0,
            longitude: 0.0,
            address: "",
            phoneNumber: "1588-4444",
            websiteURL: "https://www.summervacation.com/",
            description: "🏖️ 여름휴가 얼리버드 오픈! 6~8월 인기 여행지 최저가 보장 + 무료 취소",
            city: "",
            ad: true
        ),
        
        TouristSpot(
            id: 18,
            koreanName: "통영중앙시장",
            englishName: "Tongyeong Jungang Market",
            latitude: 34.8404,
            longitude: 128.4230,
            address: "경상남도 통영시 중앙시장1길 14-16",
            phoneNumber: "055-649-5225",
            websiteURL: "https://www.utour.go.kr/",
            description: "400년 역사의 전통시장으로, 충무김밥과 꿀빵 등 통영 대표 먹거리를 맛볼 수 있습니다.",
            city: "통영",
            ad: false
        ),
        TouristSpot(
            id: 19,
            koreanName: "세병관",
            englishName: "Sebyeonggwan Hall",
            latitude: 34.8432,
            longitude: 128.4214,
            address: "경상남도 통영시 세병로 27",
            phoneNumber: "055-645-3805",
            websiteURL: "https://www.tyhansancf.or.kr/",
            description: "국보 제305호로, 조선 삼도수군통제영의 중심건물이자 가장 넓은 목조건축물입니다.",
            city: "통영",
            ad: false
        ),
        TouristSpot(
            id: 20,
            koreanName: "통영해저터널",
            englishName: "Tongyeong Undersea Tunnel",
            latitude: 34.8370,
            longitude: 128.4130,
            address: "경상남도 통영시 도천1길 1",
            phoneNumber: "055-650-0582",
            websiteURL: "https://www.utour.go.kr/",
            description: "1932년 완공된 동양 최초의 해저터널로, 길이 483m의 등록문화재입니다.",
            city: "통영",
            ad: false
        )
    ]
}
