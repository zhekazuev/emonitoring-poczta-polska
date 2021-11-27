Redisign for emonitoring.poczta-polska.pl
# Emonitoring Poczta Polska

## About

Redisign for poczta-polska.pl and emonitoring.poczta-polska.pl

Curent Stack on emonitoring.poczta-polska.pl:
- Bootstrap
- PHP/WordPress
- MySQL
- Google Font API

How it works:
Request
```bash
curl --location --request POST 'https://uss.poczta-polska.pl/uss/v1.0/tracking/checkmailex' \
--header 'API_KEY:  Bi...6' \
--header 'POST:  /uss/v1.0/tracking/checkmailex HTTP/1.1' \
--header 'Content-Type:  application/json; charset=utf-8' \
--header 'Origin:  https://emonitoring.poczta-polska.pl' \
--header 'Referer:  https://emonitoring.poczta-polska.pl/' \
--header 'Content-Length:  67' \
--header 'Host:  uss.poczta-polska.pl' \
--header 'Accept-Language:  en-gb' \
--header 'Cookie: TS0...=' \
--data-raw '{"language":"PL","number":"CP...PL","addPostOfficeInfo":true}'
```
Response
```json
{
    "mailInfo": {
        "number": "CP...PL",
        "dispatchDate": "2021-11-04T00:00:00",
        "dispatchCountryCode": "PL",
        "dispatchCountryName": "Polska",
        "dispatchPostOffice": {
            "code": "...",
            "name": "UP ...",
            "description": {
                "longitude": 0.0,
                "latitude": 0.0,
                "openingHours": {
                    "businessDays": [
                        {
                            "from": "08:00:00",
                            "to": "20:00:59"
                        }
                    ]
                },
                "city": "Warszawa",
                "houseNumber": "1",
                "zipCode": "00-000",
                "street": "ul. Test"
            }
        },
        "recipientCountryCode": "BY",
        "recipientCountryName": "Białoruś",
        "typeOfMailCode": "P",
        "typeOfMailName": "Paczka pocztowa ekonomiczna",
        "weight": 2.01,
        "finished": true,
        "events": [
            {
                "code": "P_NAD",
                "name": "Nadanie",
                "time": "2021-11-04T19:05:00",
                "postOffice": {
                    "code": "...",
                    "name": "UP ...",
                    "description": {
                        "longitude": 0.0,
                        "latitude": 0.0,
                        "openingHours": {
                            "businessDays": [
                                {
                                    "from": "08:00:00",
                                    "to": "20:00:59"
                                }
                            ]
                        },
                        "city": "Warszawa",
                        "houseNumber": "1",
                        "zipCode": "00-000",
                        "street": "ul. Test"
                    }
                },
                "finished": false,
                "canceled": false
            },
            {
                "code": "P_WZL",
                "name": "Wysłanie przesyłki",
                "time": "2021-11-04T20:05:00",
                "postOffice": {
                    "code": "...",
                    "name": "UP ...",
                    "description": {
                        "longitude": 0.0,
                        "latitude": 0.0,
                        "openingHours": {
                            "businessDays": [
                                {
                                    "from": "08:00:00",
                                    "to": "20:00:59"
                                }
                            ]
                        },
                        "city": "Warszawa",
                        "houseNumber": "1",
                        "zipCode": "00-000",
                        "street": "ul. Test"
                    }
                },
                "finished": false,
                "canceled": false
            },
            {
                "code": "P_PZL",
                "name": "Nadejście",
                "time": "2021-11-04T22:07:00",
                "postOffice": {
                    "name": "Terminal Przeładunkowy"
                },
                "finished": false,
                "canceled": false
            },
            {
                "code": "P_WYPL",
                "name": "Wysłano z Polski",
                "time": "2021-11-08T14:18:00",
                "postOffice": {
                    "code": "...",
                    "name": "WER Warszawa",
                    "description": {
                        "longitude": 21.001944,
                        "latitude": 52.160055,
                        "openingHours": {},
                        "city": "Warszawa",
                        "houseNumber": "8",
                        "zipCode": "00-900",
                        "street": "ul. Łączyny"
                    }
                },
                "finished": false,
                "canceled": false
            },
            {
                "code": "P_WZL",
                "name": "Wysłanie przesyłki",
                "time": "2021-11-11T10:19:00",
                "postOffice": {
                    "name": "Terminal Przeładunkowy"
                },
                "finished": false,
                "canceled": false
            },
            {
                "code": "P_WEOC",
                "name": "Przyjęto w kraju przeznaczenia",
                "time": "2021-11-13T13:27:00",
                "postOffice": {
                    "name": "MINSK ...",
                    "description": {
                        "longitude": 0.0,
                        "latitude": 0.0,
                        "openingHours": {}
                    }
                },
                "finished": false,
                "canceled": false
            },
            {
                "code": "P_ZPUCPP",
                "name": "Etap przed zgłoszeniem celnym",
                "time": "2021-11-13T13:33:00",
                "postOffice": {
                    "name": "MINSK ...",
                    "description": {
                        "longitude": 0.0,
                        "latitude": 0.0,
                        "openingHours": {}
                    }
                },
                "finished": false,
                "canceled": false
            },
            {
                "code": "P_WZL",
                "name": "Wysłanie przesyłki",
                "time": "2021-11-14T14:54:00",
                "postOffice": {
                    "name": "MINSK ...",
                    "description": {
                        "longitude": 0.0,
                        "latitude": 0.0,
                        "openingHours": {}
                    }
                },
                "finished": false,
                "canceled": false
            },
            {
                "code": "P_RUD",
                "name": "Zarejestrowano",
                "time": "2021-11-14T17:45:00",
                "postOffice": {
                    "name": "International Postal System"
                },
                "finished": false,
                "canceled": false
            },
            {
                "code": "P_NDPJ",
                "name": "Próba doręczenia",
                "time": "2021-11-14T20:13:00",
                "cause": {
                    "code": "P_ND_Z",
                    "name": "Adresat nieobecny / zamknięta siedziba adresata"
                },
                "postOffice": {
                    "name": "International Postal System"
                },
                "finished": false,
                "canceled": false
            },
            {
                "code": "P_D",
                "name": "Doręczono",
                "time": "2021-11-16T18:17:00",
                "postOffice": {
                    "name": "International Postal System"
                },
                "finished": true,
                "canceled": false
            }
        ]
    },
    "number": "CP263297245PL",
    "mailStatus": 0
}
```

## References 

There are the recommendations for tracking parcels.
For example, make a list of movements in the form of a timeline, and not a list, as is done by Fedex.
- [16 советов](https://vc.ru/design/74245-sdelat-otslezhivanie-posylok-ponyatnym-dlya-polzovatelya-16-sovetov-po-razrabotke-dizayna-stranic-i-uvedomleniy)
- [Gilt](https://help.gilt.com/hc/en-us/articles/360005927933-Tracking-Your-Order)
- [Fedex](https://www.fedex.com/en-us/home.html)

There are recommendations for site structure and button placement are described here - cool modern design code.
- [EMS – Russian Post](https://www.pochta.ru/emspost/)
- [Russian Post](https://www.pochta.ru/tracking)
- [Belarussian Post](https://belpost.by/Otsleditotpravleniye)

Here are examples: the current normal design code poczta-polskа.pl, color scheme (white, red, yellow-gold - the national colors of Poland).
- [e-Doręczenie](https://edoreczenia.poczta-polska.pl)
- [Odbiorwpunkcie](https://odbiorwpunkcie.poczta-polska.pl/en/)

And also state sites with a similar color scheme, but a more pleasant design code - blue was also used to highlight the important, the amount of red was reduced to make clearer accents and yellow was added in small quantities.
- [Uzyskaj adres do e-Doręczeń u publicznego dostawcy usługi](https://www.gov.pl/web/gov/uzyskaj-adres-do-e-doreczen-u-publicznego-dostawcy-uslugi-e-doreczen)
- [e-Doręczenia dla przedsiębiorców](https://www.biznes.gov.pl/pl/portal/03176)
