import 'package:http/http.dart' as http;
import 'dart:convert';

import '../model/most_popular_post_model.dart';

abstract class MostPopularPost {
  Future<MostPostPopular?> getMostPopularPost();
}

class ProductionMostPopularPost implements MostPopularPost {
  @override
  Future<MostPostPopular?> getMostPopularPost() async {
    final api =
        "http://api.nytimes.com/svc/mostpopular/v2/mostviewed/all-sections/7.json?api-key=gWXf2nefu2bVFvQk40S8WkTXSAEAAkQn";

    try {
      final response = await http.get(Uri.parse(api));
      if (response.statusCode == 200) {
        return Future(
            () => MostPostPopular.fromJson(json.decode(response.body)));
      }
    } on Exception catch (e) {
      print(e);
    }

    return null;
  }
}


class MockMostPopularPost implements MostPopularPost {
  @override
  Future<MostPostPopular?> getMostPopularPost() {
    return Future(() => MostPostPopular.fromJson(json.decode(mockData)));
  }
}

final mockData = """{
    "status": "OK",
    "copyright": "Copyright (c) 2023 The New York Times Company.  All Rights Reserved.",
    "num_results": 20,
    "results": [
        {
            "uri": "nyt://article/4256ff2d-e6f7-5760-b1e8-0fd6b4f3776d",
            "url": "https://www.nytimes.com/2023/11/30/well/eat/protein-age.html",
            "id": 100000009064417,
            "asset_id": 100000009064417,
            "source": "New York Times",
            "published_date": "2023-11-30",
            "updated": "2023-12-01 12:32:23",
            "section": "Well",
            "subsection": "Eat",
            "nytdsection": "well",
            "adx_keywords": "Proteins;Content Type: Service;Diet and Nutrition;Elderly;Teenagers and Adolescence;Muscles;Children and Childhood;Age, Chronological",
            "column": null,
            "byline": "By Alice Callahan",
            "type": "Article",
            "title": "How Your Protein Needs Change as You Age",
            "abstract": "Your protein requirements will fluctuate throughout your life. Here’s a stage-by-stage guide to help you hit your goals.",
            "des_facet": [
                "Proteins",
                "Content Type: Service",
                "Diet and Nutrition",
                "Elderly",
                "Teenagers and Adolescence",
                "Muscles",
                "Children and Childhood",
                "Age, Chronological"
            ],
            "org_facet": [],
            "per_facet": [],
            "geo_facet": [],
            "media": [
                {
                    "type": "image",
                    "subtype": "photo",
                    "caption": "",
                    "copyright": "Sophia Pappas",
                    "approved_for_syndication": 1,
                    "media-metadata": [
                        {
                            "url": "https://static01.nyt.com/images/2023/11/30/well/30Well-Protein-Age/30Well-Protein-Age-thumbStandard.jpg",
                            "format": "Standard Thumbnail",
                            "height": 75,
                            "width": 75
                        },
                        {
                            "url": "https://static01.nyt.com/images/2023/11/30/well/30Well-Protein-Age/30Well-Protein-Age-mediumThreeByTwo210.jpg",
                            "format": "mediumThreeByTwo210",
                            "height": 140,
                            "width": 210
                        },
                        {
                            "url": "https://static01.nyt.com/images/2023/11/30/well/30Well-Protein-Age/30Well-Protein-Age-mediumThreeByTwo440.jpg",
                            "format": "mediumThreeByTwo440",
                            "height": 293,
                            "width": 440
                        }
                    ]
                }
            ],
            "eta_id": 0
        },
        {
            "uri": "nyt://article/a997a9a7-362e-578d-a558-48e7a09f0f4e",
            "url": "https://www.nytimes.com/2023/11/30/world/middleeast/israeli-hostages-stories.html",
            "id": 100000009201862,
            "asset_id": 100000009201862,
            "source": "New York Times",
            "published_date": "2023-11-30",
            "updated": "2023-12-02 09:07:41",
            "section": "World",
            "subsection": "Middle East",
            "nytdsection": "world",
            "adx_keywords": "Israel-Gaza War (2023- );Kidnapping and Hostages;Terrorism;Hamas;Israel;Gaza Strip",
            "column": null,
            "byline": "By Katherine Rosman, Emma Bubola, Rachel Abrams and Russell Goldman",
            "type": "Article",
            "title": "Hostages Freed From Gaza Recount Violence, Hunger and Fear",
            "abstract": "Hostages who have returned to Israel in the past week have come home malnourished, ill, injured and bearing psychological wounds.",
            "des_facet": [
                "Israel-Gaza War (2023- )",
                "Kidnapping and Hostages",
                "Terrorism"
            ],
            "org_facet": [
                "Hamas"
            ],
            "per_facet": [],
            "geo_facet": [
                "Israel",
                "Gaza Strip"
            ],
            "media": [],
            "eta_id": 0
        },
        {
            "uri": "nyt://article/e15ad576-e5e4-5136-93bc-ba285c6a7eef",
            "url": "https://www.nytimes.com/2023/11/29/us/henry-kissinger-dead.html",
            "id": 100000006697782,
            "asset_id": 100000006697782,
            "source": "New York Times",
            "published_date": "2023-11-29",
            "updated": "2023-12-01 14:51:22",
            "section": "U.S.",
            "subsection": "",
            "nytdsection": "u.s.",
            "adx_keywords": "Deaths (Obituaries);United States International Relations;Vietnam War;Cold War Era;Kissinger, Henry A;Nixon, Richard Milhous;State Department;National Security Council;Harvard University;China;USSR (Former Soviet Union)",
            "column": null,
            "byline": "By David E. Sanger",
            "type": "Article",
            "title": "Henry Kissinger Is Dead at 100; Shaped the Nation’s Cold War History",
            "abstract": "The most powerful secretary of state of the postwar era, he was both celebrated and reviled. His complicated legacy still resonates in relations with China, Russia and the Middle East.",
            "des_facet": [
                "Deaths (Obituaries)",
                "United States International Relations",
                "Vietnam War",
                "Cold War Era"
            ],
            "org_facet": [
                "State Department",
                "National Security Council",
                "Harvard University"
            ],
            "per_facet": [
                "Kissinger, Henry A",
                "Nixon, Richard Milhous"
            ],
            "geo_facet": [
                "China",
                "USSR (Former Soviet Union)"
            ],
            "media": [
                {
                    "type": "image",
                    "subtype": "photo",
                    "caption": "Henry A. Kissinger in 1979. He sought to strike and maintain balances of power in a dangerously precarious world.",
                    "copyright": "Neil Leifer/Sports Illustrated, via Getty Images",
                    "approved_for_syndication": 1,
                    "media-metadata": [
                        {
                            "url": "https://static01.nyt.com/images/2016/04/21/arts/kissinger-obit-16-audio-app/kissinger-obit-16-audio-app-thumbStandard.jpg",
                            "format": "Standard Thumbnail",
                            "height": 75,
                            "width": 75
                        },
                        {
                            "url": "https://static01.nyt.com/images/2016/04/21/arts/kissinger-obit-16-audio-app/kissinger-obit-16-audio-app-mediumThreeByTwo210.jpg",
                            "format": "mediumThreeByTwo210",
                            "height": 140,
                            "width": 210
                        },
                        {
                            "url": "https://static01.nyt.com/images/2016/04/21/arts/kissinger-obit-16-audio-app/kissinger-obit-16-audio-app-mediumThreeByTwo440.jpg",
                            "format": "mediumThreeByTwo440",
                            "height": 293,
                            "width": 440
                        }
                    ]
                }
            ],
            "eta_id": 0
        },
        {
            "uri": "nyt://article/06e97cb4-dd83-5a68-bba1-230ad8ea11cc",
            "url": "https://www.nytimes.com/2023/11/28/world/europe/pope-francis-cardinal-burke-vatican.html",
            "id": 100000009199916,
            "asset_id": 100000009199916,
            "source": "New York Times",
            "published_date": "2023-11-28",
            "updated": "2023-11-30 00:37:10",
            "section": "World",
            "subsection": "Europe",
            "nytdsection": "world",
            "adx_keywords": "Popes;Cardinals (Roman Catholic Prelates);Francis;Burke, Raymond L;Roman Catholic Church;Vatican City",
            "column": null,
            "byline": "By Jason Horowitz and Ruth Graham",
            "type": "Article",
            "title": "Reports Say Pope Francis Is Evicting U.S. Cardinal From His Vatican Home",
            "abstract": "Word of the action against Cardinal Raymond Burke came after the prelate’s increasingly pointed critiques of the reform-minded pope.",
            "des_facet": [
                "Popes",
                "Cardinals (Roman Catholic Prelates)"
            ],
            "org_facet": [
                "Roman Catholic Church"
            ],
            "per_facet": [
                "Francis",
                "Burke, Raymond L"
            ],
            "geo_facet": [
                "Vatican City"
            ],
            "media": [
                {
                    "type": "image",
                    "subtype": "photo",
                    "caption": "Cardinal Raymond Burke has been Pope Francis’ leading critic from the traditionalist wing of the Catholic Church.",
                    "copyright": "Antonio Masiello/Getty Images",
                    "approved_for_syndication": 1,
                    "media-metadata": [
                        {
                            "url": "https://static01.nyt.com/images/2023/11/28/multimedia/28vatican-bishop-vmhw/28vatican-bishop-vmhw-thumbStandard.jpg",
                            "format": "Standard Thumbnail",
                            "height": 75,
                            "width": 75
                        },
                        {
                            "url": "https://static01.nyt.com/images/2023/11/28/multimedia/28vatican-bishop-vmhw/28vatican-bishop-vmhw-mediumThreeByTwo210.jpg",
                            "format": "mediumThreeByTwo210",
                            "height": 140,
                            "width": 210
                        },
                        {
                            "url": "https://static01.nyt.com/images/2023/11/28/multimedia/28vatican-bishop-vmhw/28vatican-bishop-vmhw-mediumThreeByTwo440.jpg",
                            "format": "mediumThreeByTwo440",
                            "height": 293,
                            "width": 440
                        }
                    ]
                }
            ],
            "eta_id": 0
        },
        {
            "uri": "nyt://article/259965a5-1dcd-5fee-9bc5-ba8c5a61c202",
            "url": "https://www.nytimes.com/2023/12/01/movies/best-movies-2023.html",
            "id": 100000009189596,
            "asset_id": 100000009189596,
            "source": "New York Times",
            "published_date": "2023-12-01",
            "updated": "2023-12-02 09:40:05",
            "section": "Movies",
            "subsection": "",
            "nytdsection": "movies",
            "adx_keywords": "Movies;Two Thousand Twenty Three;Documentary Films and Programs",
            "column": null,
            "byline": "By Manohla Dargis and Alissa Wilkinson",
            "type": "Article",
            "title": "Best Movies of 2023",
            "abstract": "It was a terrific year for film, whether art house or mainstream, even if the main subject the movies wrestled with was deeply pessimistic.",
            "des_facet": [
                "Movies",
                "Two Thousand Twenty Three",
                "Documentary Films and Programs"
            ],
            "org_facet": [],
            "per_facet": [],
            "geo_facet": [],
            "media": [
                {
                    "type": "image",
                    "subtype": "photo",
                    "caption": "Lily Gladstone as an Osage bride in “Killers of the Flower Moon,” directed by Martin Scorsese. ",
                    "copyright": "Apple TV+",
                    "approved_for_syndication": 0,
                    "media-metadata": [
                        {
                            "url": "https://static01.nyt.com/images/2023/12/10/multimedia/10BEST-FILM-DARGIS-01-cpkv/10BEST-FILM-DARGIS-01-cpkv-thumbStandard.jpg",
                            "format": "Standard Thumbnail",
                            "height": 75,
                            "width": 75
                        },
                        {
                            "url": "https://static01.nyt.com/images/2023/12/10/multimedia/10BEST-FILM-DARGIS-01-cpkv/10BEST-FILM-DARGIS-01-cpkv-mediumThreeByTwo210.jpg",
                            "format": "mediumThreeByTwo210",
                            "height": 140,
                            "width": 210
                        },
                        {
                            "url": "https://static01.nyt.com/images/2023/12/10/multimedia/10BEST-FILM-DARGIS-01-cpkv/10BEST-FILM-DARGIS-01-cpkv-mediumThreeByTwo440.jpg",
                            "format": "mediumThreeByTwo440",
                            "height": 293,
                            "width": 440
                        }
                    ]
                }
            ],
            "eta_id": 0
        },
        {
            "uri": "nyt://article/b9e87fba-8a4e-584b-93f6-c0f3ffb4fd68",
            "url": "https://www.nytimes.com/2023/11/30/us/politics/desantis-newsom-debate-takeaways.html",
            "id": 100000009204964,
            "asset_id": 100000009204964,
            "source": "New York Times",
            "published_date": "2023-11-30",
            "updated": "2023-12-01 00:21:39",
            "section": "U.S.",
            "subsection": "Politics",
            "nytdsection": "u.s.",
            "adx_keywords": "Debates (Political);Presidential Election of 2024;Conservatism (US Politics);News and News Media;Primaries and Caucuses;DeSantis, Ron;Newsom, Gavin;Hannity, Sean;Trump, Donald J;Fox News Channel;Republican Party;Democratic Party",
            "column": null,
            "byline": "By Jonathan Weisman",
            "type": "Article",
            "title": "5 Takeaways From the DeSantis-Newsom Debate",
            "abstract": "Ron DeSantis showed a feistier side, using a friendly moderator to go on offense. Gavin Newsom defended California and President Biden, and jabbed right back.",
            "des_facet": [
                "Debates (Political)",
                "Presidential Election of 2024",
                "Conservatism (US Politics)",
                "News and News Media",
                "Primaries and Caucuses"
            ],
            "org_facet": [
                "Fox News Channel",
                "Republican Party",
                "Democratic Party"
            ],
            "per_facet": [
                "DeSantis, Ron",
                "Newsom, Gavin",
                "Hannity, Sean",
                "Trump, Donald J"
            ],
            "geo_facet": [],
            "media": [
                {
                    "type": "image",
                    "subtype": "photo",
                    "caption": "Gov. Ron DeSantis of Florida, left, and Gov. Gavin Newsom had feuded openly for months leading up to the debate.",
                    "copyright": "Fox News",
                    "approved_for_syndication": 1,
                    "media-metadata": [
                        {
                            "url": "https://static01.nyt.com/images/2023/11/30/us/30pol-desantis-newsom-takeaways/30pol-desantis-newsom-takeaways-thumbStandard.jpg",
                            "format": "Standard Thumbnail",
                            "height": 75,
                            "width": 75
                        },
                        {
                            "url": "https://static01.nyt.com/images/2023/11/30/us/30pol-desantis-newsom-takeaways/30pol-desantis-newsom-takeaways-mediumThreeByTwo210-v2.jpg",
                            "format": "mediumThreeByTwo210",
                            "height": 140,
                            "width": 210
                        },
                        {
                            "url": "https://static01.nyt.com/images/2023/11/30/us/30pol-desantis-newsom-takeaways/30pol-desantis-newsom-takeaways-mediumThreeByTwo440-v2.jpg",
                            "format": "mediumThreeByTwo440",
                            "height": 293,
                            "width": 440
                        }
                    ]
                }
            ],
            "eta_id": 0
        },
        {
            "uri": "nyt://article/c81242db-3cb8-56a0-915b-2d626ca00a5b",
            "url": "https://www.nytimes.com/2023/11/28/opinion/hepatitis-c-eliminate.html",
            "id": 100000009184504,
            "asset_id": 100000009184504,
            "source": "New York Times",
            "published_date": "2023-11-28",
            "updated": "2023-11-29 12:50:00",
            "section": "Opinion",
            "subsection": "",
            "nytdsection": "opinion",
            "adx_keywords": "Hepatitis;Liver;Drugs (Pharmaceuticals);Welfare (US);United States Politics and Government;Collins, Francis S;Biden, Joseph R Jr;House of Representatives;Senate",
            "column": null,
            "byline": "By Francis Collins",
            "type": "Article",
            "title": "We Are Squandering One of the Most Important Medical Advances of the 21st Century",
            "abstract": "Congress has a chance to eliminate hepatitis C in the United States.",
            "des_facet": [
                "Hepatitis",
                "Liver",
                "Drugs (Pharmaceuticals)",
                "Welfare (US)",
                "United States Politics and Government"
            ],
            "org_facet": [
                "House of Representatives",
                "Senate"
            ],
            "per_facet": [
                "Collins, Francis S",
                "Biden, Joseph R Jr"
            ],
            "geo_facet": [],
            "media": [
                {
                    "type": "image",
                    "subtype": "photo",
                    "caption": "",
                    "copyright": "Todd Heisler/The New York Times",
                    "approved_for_syndication": 1,
                    "media-metadata": [
                        {
                            "url": "https://static01.nyt.com/images/2023/11/30/multimedia/28franciscollins1-wbcl/28franciscollins1-wbcl-thumbStandard.jpg",
                            "format": "Standard Thumbnail",
                            "height": 75,
                            "width": 75
                        },
                        {
                            "url": "https://static01.nyt.com/images/2023/11/30/multimedia/28franciscollins1-wbcl/28franciscollins1-wbcl-mediumThreeByTwo210.jpg",
                            "format": "mediumThreeByTwo210",
                            "height": 140,
                            "width": 210
                        },
                        {
                            "url": "https://static01.nyt.com/images/2023/11/30/multimedia/28franciscollins1-wbcl/28franciscollins1-wbcl-mediumThreeByTwo440.jpg",
                            "format": "mediumThreeByTwo440",
                            "height": 293,
                            "width": 440
                        }
                    ]
                }
            ],
            "eta_id": 0
        },
        {
            "uri": "nyt://article/e2fcb1a6-a510-5d84-9a55-7a3591441241",
            "url": "https://www.nytimes.com/2023/11/28/us/jimmy-carter-health.html",
            "id": 100000009200623,
            "asset_id": 100000009200623,
            "source": "New York Times",
            "published_date": "2023-11-28",
            "updated": "2023-11-29 13:42:52",
            "section": "U.S.",
            "subsection": "",
            "nytdsection": "u.s.",
            "adx_keywords": "United States Politics and Government;Funerals and Memorials;Carter, Jimmy;Carter, Rosalynn",
            "column": null,
            "byline": "By Rick Rojas and Jacey Fortin",
            "type": "Article",
            "title": "Americans Glimpse Jimmy Carter’s Frailty and His Resolve",
            "abstract": "“Come hell or high water, Jimmy Carter was going to use his inner resources to be there,” the presidential historian Douglas Brinkley said of Mr. Carter’s emerging from hospice care for his wife’s memorial service.",
            "des_facet": [
                "United States Politics and Government",
                "Funerals and Memorials"
            ],
            "org_facet": [],
            "per_facet": [
                "Carter, Jimmy",
                "Carter, Rosalynn"
            ],
            "geo_facet": [],
            "media": [
                {
                    "type": "image",
                    "subtype": "photo",
                    "caption": "Former President Jimmy Carter attended a memorial service for his wife, Rosalynn Carter, the former first lady, in Atlanta on Tuesday.",
                    "copyright": "Erin Schaff/The New York Times",
                    "approved_for_syndication": 1,
                    "media-metadata": [
                        {
                            "url": "https://static01.nyt.com/images/2023/11/28/multimedia/28nat-carter-emerges-1b-qhwm/28nat-carter-emerges-1b-qhwm-thumbStandard.jpg",
                            "format": "Standard Thumbnail",
                            "height": 75,
                            "width": 75
                        },
                        {
                            "url": "https://static01.nyt.com/images/2023/11/28/multimedia/28nat-carter-emerges-1b-qhwm/28nat-carter-emerges-1b-qhwm-mediumThreeByTwo210.jpg",
                            "format": "mediumThreeByTwo210",
                            "height": 140,
                            "width": 210
                        },
                        {
                            "url": "https://static01.nyt.com/images/2023/11/28/multimedia/28nat-carter-emerges-1b-qhwm/28nat-carter-emerges-1b-qhwm-mediumThreeByTwo440.jpg",
                            "format": "mediumThreeByTwo440",
                            "height": 293,
                            "width": 440
                        }
                    ]
                }
            ],
            "eta_id": 0
        },
        {
            "uri": "nyt://article/97176b7e-b102-5618-9ad7-81b1256c51e1",
            "url": "https://www.nytimes.com/2023/11/27/opinion/nikki-haley-social-security.html",
            "id": 100000009197431,
            "asset_id": 100000009197431,
            "source": "New York Times",
            "published_date": "2023-11-27",
            "updated": "2023-11-28 14:45:14",
            "section": "Opinion",
            "subsection": "",
            "nytdsection": "opinion",
            "adx_keywords": "Presidential Election of 2024;Social Security (US);Income Inequality;Income Tax;Retirement;Haley, Nikki R;DeSantis, Ron;Republican Party",
            "column": null,
            "byline": "By Paul Krugman",
            "type": "Article",
            "title": "Nikki Haley Is Coming for Your Retirement",
            "abstract": "Wall Street’s new favorite is far from a populist.",
            "des_facet": [
                "Presidential Election of 2024",
                "Social Security (US)",
                "Income Inequality",
                "Income Tax",
                "Retirement"
            ],
            "org_facet": [
                "Republican Party"
            ],
            "per_facet": [
                "Haley, Nikki R",
                "DeSantis, Ron"
            ],
            "geo_facet": [],
            "media": [
                {
                    "type": "image",
                    "subtype": "photo",
                    "caption": "",
                    "copyright": "Brian Snyder/Reuters",
                    "approved_for_syndication": 1,
                    "media-metadata": [
                        {
                            "url": "https://static01.nyt.com/images/2023/11/27/multimedia/27krugman1-fmck/27krugman1-fmck-thumbStandard.jpg",
                            "format": "Standard Thumbnail",
                            "height": 75,
                            "width": 75
                        },
                        {
                            "url": "https://static01.nyt.com/images/2023/11/27/multimedia/27krugman1-fmck/27krugman1-fmck-mediumThreeByTwo210.jpg",
                            "format": "mediumThreeByTwo210",
                            "height": 140,
                            "width": 210
                        },
                        {
                            "url": "https://static01.nyt.com/images/2023/11/27/multimedia/27krugman1-fmck/27krugman1-fmck-mediumThreeByTwo440.jpg",
                            "format": "mediumThreeByTwo440",
                            "height": 293,
                            "width": 440
                        }
                    ]
                }
            ],
            "eta_id": 0
        },
        {
            "uri": "nyt://article/c6e523b6-a055-5e0e-b1c1-51ba0b14cedb",
            "url": "https://www.nytimes.com/2023/11/29/arts/television/best-tv-shows-2023.html",
            "id": 100000009186309,
            "asset_id": 100000009186309,
            "source": "New York Times",
            "published_date": "2023-11-29",
            "updated": "2023-12-01 17:19:36",
            "section": "Arts",
            "subsection": "Television",
            "nytdsection": "arts",
            "adx_keywords": "Television;Two Thousand Twenty Three",
            "column": null,
            "byline": "By James Poniewozik, Mike Hale and Margaret Lyons",
            "type": "Article",
            "title": "Best TV Shows of 2023",
            "abstract": "Series like “The Bear,” “Beef,” “Happy Valley,” “Reservation Dogs” and “Succession” dazzled in a year when much of the TV business was in disarray.",
            "des_facet": [
                "Television",
                "Two Thousand Twenty Three"
            ],
            "org_facet": [],
            "per_facet": [],
            "geo_facet": [],
            "media": [
                {
                    "type": "image",
                    "subtype": "photo",
                    "caption": "“The Bear,” with Jeremy Allen White and Ayo Edebiri, was even better in its second season.",
                    "copyright": "Chuck Hodes/FX",
                    "approved_for_syndication": 1,
                    "media-metadata": [
                        {
                            "url": "https://static01.nyt.com/images/2023/12/10/multimedia/10best-tv-qjtf/10best-tv-qjtf-thumbStandard.jpg",
                            "format": "Standard Thumbnail",
                            "height": 75,
                            "width": 75
                        },
                        {
                            "url": "https://static01.nyt.com/images/2023/12/10/multimedia/10best-tv-qjtf/10best-tv-qjtf-mediumThreeByTwo210.jpg",
                            "format": "mediumThreeByTwo210",
                            "height": 140,
                            "width": 210
                        },
                        {
                            "url": "https://static01.nyt.com/images/2023/12/10/multimedia/10best-tv-qjtf/10best-tv-qjtf-mediumThreeByTwo440.jpg",
                            "format": "mediumThreeByTwo440",
                            "height": 293,
                            "width": 440
                        }
                    ]
                }
            ],
            "eta_id": 0
        },
        {
            "uri": "nyt://article/0afa69f0-090a-5804-88ee-f5d89b30c671",
            "url": "https://www.nytimes.com/2023/12/01/nyregion/santos-expulsion-vote-congress.html",
            "id": 100000009202344,
            "asset_id": 100000009202344,
            "source": "New York Times",
            "published_date": "2023-12-01",
            "updated": "2023-12-02 12:06:53",
            "section": "New York",
            "subsection": "",
            "nytdsection": "new york",
            "adx_keywords": "United States Politics and Government;Campaign Finance;Frauds and Swindling;Ethics and Official Misconduct;Appointments and Executive Changes;Santos, George (1988- );House of Representatives;Republican Party;New York State",
            "column": null,
            "byline": "By Michael Gold and Grace Ashford",
            "type": "Article",
            "title": "George Santos Is Kicked Out of Congress in a Historic Vote",
            "abstract": "Nearly half of the G.O.P. House delegation voted to expel Mr. Santos, a remarkable rebuke of a colleague who had survived two prior expulsion bids.",
            "des_facet": [
                "United States Politics and Government",
                "Campaign Finance",
                "Frauds and Swindling",
                "Ethics and Official Misconduct",
                "Appointments and Executive Changes"
            ],
            "org_facet": [
                "House of Representatives",
                "Republican Party"
            ],
            "per_facet": [
                "Santos, George (1988- )"
            ],
            "geo_facet": [
                "New York State"
            ],
            "media": [
                {
                    "type": "image",
                    "subtype": "photo",
                    "caption": "After his expulsion on Friday, George Santos quickly left the Capitol, telling reporters, “to hell with this place.”",
                    "copyright": "Haiyun Jiang for The New York Times",
                    "approved_for_syndication": 1,
                    "media-metadata": [
                        {
                            "url": "https://static01.nyt.com/images/2023/12/01/multimedia/01santos-expulsion-pinned-top-01-bhlw/01santos-expulsion-pinned-top-01-bhlw-thumbStandard.jpg",
                            "format": "Standard Thumbnail",
                            "height": 75,
                            "width": 75
                        },
                        {
                            "url": "https://static01.nyt.com/images/2023/12/01/multimedia/01santos-expulsion-pinned-top-01-bhlw/01santos-expulsion-pinned-top-01-bhlw-mediumThreeByTwo210.jpg",
                            "format": "mediumThreeByTwo210",
                            "height": 140,
                            "width": 210
                        },
                        {
                            "url": "https://static01.nyt.com/images/2023/12/01/multimedia/01santos-expulsion-pinned-top-01-bhlw/01santos-expulsion-pinned-top-01-bhlw-mediumThreeByTwo440.jpg",
                            "format": "mediumThreeByTwo440",
                            "height": 293,
                            "width": 440
                        }
                    ]
                }
            ],
            "eta_id": 0
        },
        {
            "uri": "nyt://article/b2715464-2b41-523c-9a16-b9774caeebde",
            "url": "https://www.nytimes.com/2023/11/26/us/politics/trump-braun-pardon-investigation-takeaways.html",
            "id": 100000009196446,
            "asset_id": 100000009196446,
            "source": "New York Times",
            "published_date": "2023-11-26",
            "updated": "2023-11-26 19:16:57",
            "section": "U.S.",
            "subsection": "Politics",
            "nytdsection": "u.s.",
            "adx_keywords": "Amnesties, Commutations and Pardons;Presidential Election of 2024;United States Politics and Government;Braun, Jonathan;Kushner, Jared;Kushner, Charles;Dershowitz, Alan M;Trump, Donald J;Justice Department",
            "column": null,
            "byline": "By Michael S. Schmidt, Maggie Haberman, Jonathan Swan and Alan Feuer",
            "type": "Article",
            "title": "3 Takeaways From the Investigation Into Trump’s Pardon of Jonathan Braun",
            "abstract": "Mr. Braun was still under investigation by the Justice Department at the time of his pardon. Here are some key points about the case.",
            "des_facet": [
                "Amnesties, Commutations and Pardons",
                "Presidential Election of 2024",
                "United States Politics and Government"
            ],
            "org_facet": [
                "Justice Department"
            ],
            "per_facet": [
                "Braun, Jonathan",
                "Kushner, Jared",
                "Kushner, Charles",
                "Dershowitz, Alan M",
                "Trump, Donald J"
            ],
            "geo_facet": [],
            "media": [
                {
                    "type": "image",
                    "subtype": "photo",
                    "caption": "Just before leaving office, former President Donald J. Trump commuted the sentence of Jonathan Braun, who had connections to Jared Kushner, Mr. Trump’s son-in-law and senior adviser. ",
                    "copyright": "Sophie Park for The New York Times",
                    "approved_for_syndication": 1,
                    "media-metadata": [
                        {
                            "url": "https://static01.nyt.com/images/2023/11/26/multimedia/26dc-braun-takeaways-qpjh/26dc-braun-takeaways-qpjh-thumbStandard-v2.jpg",
                            "format": "Standard Thumbnail",
                            "height": 75,
                            "width": 75
                        },
                        {
                            "url": "https://static01.nyt.com/images/2023/11/26/multimedia/26dc-braun-takeaways-qpjh/26dc-braun-takeaways-qpjh-mediumThreeByTwo210-v2.jpg",
                            "format": "mediumThreeByTwo210",
                            "height": 140,
                            "width": 210
                        },
                        {
                            "url": "https://static01.nyt.com/images/2023/11/26/multimedia/26dc-braun-takeaways-qpjh/26dc-braun-takeaways-qpjh-mediumThreeByTwo440-v2.jpg",
                            "format": "mediumThreeByTwo440",
                            "height": 293,
                            "width": 440
                        }
                    ]
                }
            ],
            "eta_id": 0
        },
        {
            "uri": "nyt://article/ec1072c6-e325-5b09-aa36-dbb859a604c7",
            "url": "https://www.nytimes.com/2023/11/26/us/politics/trump-pardon-braun.html",
            "id": 100000009182601,
            "asset_id": 100000009182601,
            "source": "New York Times",
            "published_date": "2023-11-26",
            "updated": "2023-11-26 10:03:48",
            "section": "U.S.",
            "subsection": "Politics",
            "nytdsection": "u.s.",
            "adx_keywords": "Amnesties, Commutations and Pardons;Marijuana;Drug Abuse and Traffic;Frauds and Swindling;Payday Loans;Presidential Election of 2024;United States Politics and Government;Braun, Jonathan;Trump, Donald J;Kushner, Jared;Kushner, Charles;Justice Department;Federal Trade Commission",
            "column": null,
            "byline": "By Michael S. Schmidt, Maggie Haberman, Jonathan Swan and Alan Feuer",
            "type": "Article",
            "title": "A Troubling Trump Pardon and a Link to the Kushners",
            "abstract": "A commutation for a drug smuggler named Jonathan Braun had broader implications than previously known. It puts new focus on how Donald Trump would use his clemency powers in a second term.",
            "des_facet": [
                "Amnesties, Commutations and Pardons",
                "Marijuana",
                "Drug Abuse and Traffic",
                "Frauds and Swindling",
                "Payday Loans",
                "Presidential Election of 2024",
                "United States Politics and Government"
            ],
            "org_facet": [
                "Justice Department",
                "Federal Trade Commission"
            ],
            "per_facet": [
                "Braun, Jonathan",
                "Trump, Donald J",
                "Kushner, Jared",
                "Kushner, Charles"
            ],
            "geo_facet": [],
            "media": [
                {
                    "type": "image",
                    "subtype": "photo",
                    "caption": "In April 2022, Jonathan Braun, left, and his wife, Miriam, visited a Trump resort in Florida. Mr. Braun said they ran into the former president by coincidence.",
                    "copyright": "",
                    "approved_for_syndication": 0,
                    "media-metadata": [
                        {
                            "url": "https://static01.nyt.com/images/2023/11/26/multimedia/26dc-braun-print-1/00dc-braun-01-hpkw-thumbStandard.jpg",
                            "format": "Standard Thumbnail",
                            "height": 75,
                            "width": 75
                        },
                        {
                            "url": "https://static01.nyt.com/images/2023/11/26/multimedia/26dc-braun-print-1/00dc-braun-01-hpkw-mediumThreeByTwo210.jpg",
                            "format": "mediumThreeByTwo210",
                            "height": 140,
                            "width": 210
                        },
                        {
                            "url": "https://static01.nyt.com/images/2023/11/26/multimedia/26dc-braun-print-1/00dc-braun-01-hpkw-mediumThreeByTwo440.jpg",
                            "format": "mediumThreeByTwo440",
                            "height": 293,
                            "width": 440
                        }
                    ]
                }
            ],
            "eta_id": 0
        },
        {
            "uri": "nyt://article/1f3e57b5-35f4-5733-9e61-5ea8582dffad",
            "url": "https://www.nytimes.com/2023/11/25/magazine/progressive-insurance-flo-stephanie-courtney.html",
            "id": 100000009185569,
            "asset_id": 100000009185569,
            "source": "New York Times",
            "published_date": "2023-11-25",
            "updated": "2023-11-28 11:03:34",
            "section": "Magazine",
            "subsection": "",
            "nytdsection": "magazine",
            "adx_keywords": "Actors and Actresses;Comedy and Humor;Television;Advertising and Marketing;Insurance;Content Type: Personal Profile;internal-sub-only;internal-great-read;Courtney, Stephanie (Actor);Progressive Casualty Insurance Co;Los Angeles (Calif)",
            "column": null,
            "byline": "By Caity Weaver",
            "type": "Article",
            "title": "Everybody Knows Flo From Progressive. Who Is Stephanie Courtney?",
            "abstract": "A polo shirt, a white apron and a retro hairdo changed an actor’s life forever.",
            "des_facet": [
                "Actors and Actresses",
                "Comedy and Humor",
                "Television",
                "Advertising and Marketing",
                "Insurance",
                "Content Type: Personal Profile",
                "internal-sub-only",
                "internal-great-read"
            ],
            "org_facet": [
                "Progressive Casualty Insurance Co"
            ],
            "per_facet": [
                "Courtney, Stephanie (Actor)"
            ],
            "geo_facet": [
                "Los Angeles (Calif)"
            ],
            "media": [
                {
                    "type": "image",
                    "subtype": "photo",
                    "caption": "Stephanie Courtney has played Flo for over fifteen years.",
                    "copyright": "Sinna Nasseri for The New York Times",
                    "approved_for_syndication": 1,
                    "media-metadata": [
                        {
                            "url": "https://static01.nyt.com/images/2023/11/26/magazine/26mag-flo/26mag-flo-thumbStandard.jpg",
                            "format": "Standard Thumbnail",
                            "height": 75,
                            "width": 75
                        },
                        {
                            "url": "https://static01.nyt.com/images/2023/11/26/magazine/26mag-flo/26mag-flo-mediumThreeByTwo210.jpg",
                            "format": "mediumThreeByTwo210",
                            "height": 140,
                            "width": 210
                        },
                        {
                            "url": "https://static01.nyt.com/images/2023/11/26/magazine/26mag-flo/26mag-flo-mediumThreeByTwo440.jpg",
                            "format": "mediumThreeByTwo440",
                            "height": 293,
                            "width": 440
                        }
                    ]
                }
            ],
            "eta_id": 0
        },
        {
            "uri": "nyt://article/d7f7afcb-60d8-512f-b300-1ccab735fef8",
            "url": "https://www.nytimes.com/2023/11/28/us/politics/rosalynn-carter-memorial-services.html",
            "id": 100000009198935,
            "asset_id": 100000009198935,
            "source": "New York Times",
            "published_date": "2023-11-28",
            "updated": "2023-11-29 13:47:41",
            "section": "U.S.",
            "subsection": "Politics",
            "nytdsection": "u.s.",
            "adx_keywords": "First Ladies (US);Funerals and Memorials;United States Politics and Government;Content Type: Personal Profile;Carter, Jimmy;Carter, Rosalynn;Atlanta (Ga);Plains (Ga)",
            "column": null,
            "byline": "By Peter Baker",
            "type": "Article",
            "title": "Memorial Celebrates Rosalynn Carter’s Life, a ‘Public Love Story’",
            "abstract": "Former President Jimmy Carter emerged from hospice care to join a cast of political heavyweights paying tribute to Mrs. Carter, who died at 96 last week at her home in Plains, Ga.",
            "des_facet": [
                "First Ladies (US)",
                "Funerals and Memorials",
                "United States Politics and Government",
                "Content Type: Personal Profile"
            ],
            "org_facet": [],
            "per_facet": [
                "Carter, Jimmy",
                "Carter, Rosalynn"
            ],
            "geo_facet": [
                "Atlanta (Ga)",
                "Plains (Ga)"
            ],
            "media": [],
            "eta_id": 0
        },
        {
            "uri": "nyt://article/a8a92131-c9e1-57ee-9b22-140f3e01e195",
            "url": "https://www.nytimes.com/2023/12/02/business/air-traffic-controllers-safety.html",
            "id": 100000009178887,
            "asset_id": 100000009178887,
            "source": "New York Times",
            "published_date": "2023-12-02",
            "updated": "2023-12-02 23:06:45",
            "section": "Business",
            "subsection": "",
            "nytdsection": "business",
            "adx_keywords": "Airlines and Airplanes;Aviation Accidents, Safety and Disasters;Air Traffic Control;Workplace Environment;Working Hours;Fatigue;vis-photo;Federal Aviation Administration;San Diego International Airport;Jacksonville (Fla);New York Metropolitan Area",
            "column": null,
            "byline": "By Emily Steel and Sydney Ember",
            "type": "Article",
            "title": "Drunk and Asleep on the Job: Air Traffic Controllers Pushed to the Brink",
            "abstract": "A nationwide shortage of controllers has resulted in an exhausted and demoralized work force that is increasingly prone to making dangerous mistakes.",
            "des_facet": [
                "Airlines and Airplanes",
                "Aviation Accidents, Safety and Disasters",
                "Air Traffic Control",
                "Workplace Environment",
                "Working Hours",
                "Fatigue",
                "vis-photo"
            ],
            "org_facet": [
                "Federal Aviation Administration",
                "San Diego International Airport"
            ],
            "per_facet": [],
            "geo_facet": [
                "Jacksonville (Fla)",
                "New York Metropolitan Area"
            ],
            "media": [
                {
                    "type": "image",
                    "subtype": "photo",
                    "caption": "",
                    "copyright": "John Francis Peters for The New York Times",
                    "approved_for_syndication": 1,
                    "media-metadata": [
                        {
                            "url": "https://static01.nyt.com/images/2023/12/02/multimedia/02air-safety-PROMO-zmbq/02air-safety-PROMO-zmbq-thumbStandard.jpg",
                            "format": "Standard Thumbnail",
                            "height": 75,
                            "width": 75
                        },
                        {
                            "url": "https://static01.nyt.com/images/2023/12/02/multimedia/02air-safety-PROMO-zmbq/02air-safety-PROMO-zmbq-mediumThreeByTwo210.jpg",
                            "format": "mediumThreeByTwo210",
                            "height": 140,
                            "width": 210
                        },
                        {
                            "url": "https://static01.nyt.com/images/2023/12/02/multimedia/02air-safety-PROMO-zmbq/02air-safety-PROMO-zmbq-mediumThreeByTwo440.jpg",
                            "format": "mediumThreeByTwo440",
                            "height": 293,
                            "width": 440
                        }
                    ]
                }
            ],
            "eta_id": 0
        },
        {
            "uri": "nyt://article/32834da5-1700-5fa7-b866-98223a2161d0",
            "url": "https://www.nytimes.com/2023/11/29/nyregion/sikh-assassination-plot-charges-india.html",
            "id": 100000009201482,
            "asset_id": 100000009201482,
            "source": "New York Times",
            "published_date": "2023-11-29",
            "updated": "2023-12-01 17:28:37",
            "section": "New York",
            "subsection": "",
            "nytdsection": "new york",
            "adx_keywords": "Politics and Government;Assassinations and Attempted Assassinations;Sikhs and Sikhism;Secession and Independence Movements;Indian-Americans;United States International Relations;audio-neutral-informative;Pannun, Gurpatwant Singh;Gupta, Nikhil;Nijjar, Hardeep Singh (1977-2023);Justice Department;India;New York City",
            "column": null,
            "byline": "By Jesse McKinley, Julian E. Barnes and Ian Austen",
            "type": "Article",
            "title": "U.S. Says Indian Official Directed Assassination Plot in New York",
            "abstract": "A Manhattan indictment says the agent orchestrated an unsuccessful plot against a Sikh separatist, a plan linked to a killing in Canada.",
            "des_facet": [
                "Politics and Government",
                "Assassinations and Attempted Assassinations",
                "Sikhs and Sikhism",
                "Secession and Independence Movements",
                "Indian-Americans",
                "United States International Relations",
                "audio-neutral-informative"
            ],
            "org_facet": [
                "Justice Department"
            ],
            "per_facet": [
                "Pannun, Gurpatwant Singh",
                "Gupta, Nikhil",
                "Nijjar, Hardeep Singh (1977-2023)"
            ],
            "geo_facet": [
                "India",
                "New York City"
            ],
            "media": [
                {
                    "type": "image",
                    "subtype": "photo",
                    "caption": "Sikh separatists have been pressing for a state of their own that would be called Khalistan.",
                    "copyright": "Jackie Dives for The New York Times",
                    "approved_for_syndication": 1,
                    "media-metadata": [
                        {
                            "url": "https://static01.nyt.com/images/2023/12/28/multimedia/28india-plot-qzbv/28india-plot-qzbv-thumbStandard.jpg",
                            "format": "Standard Thumbnail",
                            "height": 75,
                            "width": 75
                        },
                        {
                            "url": "https://static01.nyt.com/images/2023/12/28/multimedia/28india-plot-qzbv/28india-plot-qzbv-mediumThreeByTwo210.jpg",
                            "format": "mediumThreeByTwo210",
                            "height": 140,
                            "width": 210
                        },
                        {
                            "url": "https://static01.nyt.com/images/2023/12/28/multimedia/28india-plot-qzbv/28india-plot-qzbv-mediumThreeByTwo440.jpg",
                            "format": "mediumThreeByTwo440",
                            "height": 293,
                            "width": 440
                        }
                    ]
                }
            ],
            "eta_id": 0
        },
        {
            "uri": "nyt://interactive/225b74e5-b9e2-5dd5-b971-df1c91f469bb",
            "url": "https://www.nytimes.com/interactive/2023/12/01/briefing/news-quiz-nikki-haley-rosalynn-carter-mark-cuban.html",
            "id": 100000009204353,
            "asset_id": 100000009204353,
            "source": "New York Times",
            "published_date": "2023-12-01",
            "updated": "2023-12-01 05:03:31",
            "section": "Briefing",
            "subsection": "",
            "nytdsection": "briefing",
            "adx_keywords": "Content Type: Quiz",
            "column": null,
            "byline": "",
            "type": "Interactive",
            "title": "The New York Times News Quiz, Dec. 1, 2023",
            "abstract": "Did you follow the news this week? Take our quiz to see how well you stack up with other Times readers.",
            "des_facet": [
                "Content Type: Quiz"
            ],
            "org_facet": [],
            "per_facet": [],
            "geo_facet": [],
            "media": [
                {
                    "type": "image",
                    "subtype": "",
                    "caption": "",
                    "copyright": "Yousef Masoud for The New York Times",
                    "approved_for_syndication": 1,
                    "media-metadata": [
                        {
                            "url": "https://static01.nyt.com/images/2023/11/30/multimedia/dec1-news-quiz-hstages-lqzc/dec1-news-quiz-hstages-lqzc-thumbStandard.jpg",
                            "format": "Standard Thumbnail",
                            "height": 75,
                            "width": 75
                        },
                        {
                            "url": "https://static01.nyt.com/images/2023/11/30/multimedia/dec1-news-quiz-hstages-lqzc/dec1-news-quiz-hstages-lqzc-mediumThreeByTwo210.jpg",
                            "format": "mediumThreeByTwo210",
                            "height": 140,
                            "width": 210
                        },
                        {
                            "url": "https://static01.nyt.com/images/2023/11/30/multimedia/dec1-news-quiz-hstages-lqzc/dec1-news-quiz-hstages-lqzc-mediumThreeByTwo440.jpg",
                            "format": "mediumThreeByTwo440",
                            "height": 293,
                            "width": 440
                        }
                    ]
                }
            ],
            "eta_id": 0
        },
        {
            "uri": "nyt://article/0e8b2730-ad88-52bb-b654-f3f7ecf306cc",
            "url": "https://www.nytimes.com/2023/11/30/opinion/henry-kissinger-the-hypocrite.html",
            "id": 100000008802370,
            "asset_id": 100000008802370,
            "source": "New York Times",
            "published_date": "2023-11-30",
            "updated": "2023-12-01 03:36:37",
            "section": "Opinion",
            "subsection": "",
            "nytdsection": "opinion",
            "adx_keywords": "United States Politics and Government;United States International Relations;Cold War Era;Vietnam War;Human Rights and Human Rights Violations;Kissinger, Henry A;Nixon, Richard Milhous;Ford, Gerald Rudolph Jr;Laos;Chile",
            "column": null,
            "byline": "By Ben Rhodes",
            "type": "Article",
            "title": "Henry Kissinger, the Hypocrite",
            "abstract": "He was as much a creation of the American national security state as he was its author.",
            "des_facet": [
                "United States Politics and Government",
                "United States International Relations",
                "Cold War Era",
                "Vietnam War",
                "Human Rights and Human Rights Violations"
            ],
            "org_facet": [],
            "per_facet": [
                "Kissinger, Henry A",
                "Nixon, Richard Milhous",
                "Ford, Gerald Rudolph Jr"
            ],
            "geo_facet": [
                "Laos",
                "Chile"
            ],
            "media": [
                {
                    "type": "image",
                    "subtype": "photo",
                    "caption": "",
                    "copyright": "Michael Avedon/August",
                    "approved_for_syndication": 0,
                    "media-metadata": [
                        {
                            "url": "https://static01.nyt.com/images/2023/12/01/multimedia/29kissinger-htqz/29kissinger-htqz-thumbStandard.jpg",
                            "format": "Standard Thumbnail",
                            "height": 75,
                            "width": 75
                        },
                        {
                            "url": "https://static01.nyt.com/images/2023/12/01/multimedia/29kissinger-htqz/29kissinger-htqz-mediumThreeByTwo210.jpg",
                            "format": "mediumThreeByTwo210",
                            "height": 140,
                            "width": 210
                        },
                        {
                            "url": "https://static01.nyt.com/images/2023/12/01/multimedia/29kissinger-htqz/29kissinger-htqz-mediumThreeByTwo440.jpg",
                            "format": "mediumThreeByTwo440",
                            "height": 293,
                            "width": 440
                        }
                    ]
                }
            ],
            "eta_id": 0
        },
        {
            "uri": "nyt://article/9d9c4191-7877-5cc8-8a65-1eef3ab460db",
            "url": "https://www.nytimes.com/2023/11/28/us/politics/koch-network-nikki-haley-endorsement-trump.html",
            "id": 100000009199323,
            "asset_id": 100000009199323,
            "source": "New York Times",
            "published_date": "2023-11-28",
            "updated": "2023-11-29 12:40:27",
            "section": "U.S.",
            "subsection": "Politics",
            "nytdsection": "u.s.",
            "adx_keywords": "Presidential Election of 2024;Primaries and Caucuses;Endorsements;Campaign Finance;Political Action Committees;United States Politics and Government;Haley, Nikki R;Koch, Charles G;Koch, David H;DeSantis, Ron;Trump, Donald J;Republican Party;Americans for Prosperity",
            "column": null,
            "byline": "By Maggie Haberman, Shane Goldmacher and Jonathan Swan",
            "type": "Article",
            "title": "Koch Network Endorses Nikki Haley in Bid to Push G.O.P. Past Trump",
            "abstract": "The support will give Ms. Haley more organizational strength in the field as she battles Gov. Ron DeSantis of Florida for the No. 2 spot in the Republican presidential race.",
            "des_facet": [
                "Presidential Election of 2024",
                "Primaries and Caucuses",
                "Endorsements",
                "Campaign Finance",
                "Political Action Committees",
                "United States Politics and Government"
            ],
            "org_facet": [
                "Republican Party",
                "Americans for Prosperity"
            ],
            "per_facet": [
                "Haley, Nikki R",
                "Koch, Charles G",
                "Koch, David H",
                "DeSantis, Ron",
                "Trump, Donald J"
            ],
            "geo_facet": [],
            "media": [
                {
                    "type": "image",
                    "subtype": "photo",
                    "caption": "Nikki Haley, a former United Nations ambassador and governor of South Carolina, has been climbing in polls of the Republican presidential race, though she still trails far behind former President Donald J. Trump.",
                    "copyright": "Jordan Gale for The New York Times",
                    "approved_for_syndication": 1,
                    "media-metadata": [
                        {
                            "url": "https://static01.nyt.com/images/2023/11/28/multimedia/28haley-ptlj/28haley-ptlj-thumbStandard.jpg",
                            "format": "Standard Thumbnail",
                            "height": 75,
                            "width": 75
                        },
                        {
                            "url": "https://static01.nyt.com/images/2023/11/28/multimedia/28haley-ptlj/28haley-ptlj-mediumThreeByTwo210.jpg",
                            "format": "mediumThreeByTwo210",
                            "height": 140,
                            "width": 210
                        },
                        {
                            "url": "https://static01.nyt.com/images/2023/11/28/multimedia/28haley-ptlj/28haley-ptlj-mediumThreeByTwo440.jpg",
                            "format": "mediumThreeByTwo440",
                            "height": 293,
                            "width": 440
                        }
                    ]
                }
            ],
            "eta_id": 0
        }
    ]
}""";
