module Timezones
  extend ActiveSupport::Concern
  included do
    TIMEZONES = [
      ['Midway Island (-11:00)', 'Midway Island'],
      ['American Samoa (-11:00)', 'American Samoa'],
      ['Hawaii (-10:00)', 'Hawaii'],
      ['Alaska (-08:00)', 'Alaska'],
      ['Tijuana (-07:00)', 'Tijuana'],
      ['Pacific Time (US & Canada) (-07:00)', 'Pacific Time (US & Canada)'],
      ['Mazatlan (-07:00)', 'Mazatlan'],
      ['Arizona (-07:00)', 'Arizona'],
      ['Mountain Time (US & Canada) (-06:00)', 'Mountain Time (US & Canada)'],
      ['Saskatchewan (-06:00)', 'Saskatchewan'],
      ['Monterrey (-06:00)', 'Monterrey'],
      ['Mexico City (-06:00)', 'Mexico City'],
      ['Guadalajara (-06:00)', 'Guadalajara'],
      ['Chihuahua (-06:00)', 'Chihuahua'],
      ['Central America (-06:00)', 'Central America'],
      ['Central Time (US & Canada) (-05:00)', 'Central Time (US & Canada)'],
      ['Quito (-05:00)', 'Quito'],
      ['Lima (-05:00)', 'Lima'],
      ['Bogota (-05:00)', 'Bogota'],
      ['Indiana (East) (-04:00)', 'Indiana (East)'],
      ['Eastern Time (US & Canada) (-04:00)', 'Eastern Time (US & Canada)'],
      ['Puerto Rico (-04:00)', 'Puerto Rico'],
      ['La Paz (-04:00)', 'La Paz'],
      ['Georgetown (-04:00)', 'Georgetown'],
      ['Caracas (-04:00)', 'Caracas'],
      ['Santiago (-03:00)', 'Santiago'],
      ['Atlantic Time (Canada) (-03:00)', 'Atlantic Time (Canada)'],
      ['Montevideo (-03:00)', 'Montevideo'],
      ['Buenos Aires (-03:00)', 'Buenos Aires'],
      ['Brasilia (-03:00)', 'Brasilia'],
      ['Mid-Atlantic (-02:00)', 'Mid-Atlantic'],
      ['Greenland (-02:00)', 'Greenland'],
      ['Cape Verde Is. (-01:00)', 'Cape Verde Is.'],
      ['Azores (-01:00)', 'Azores'],
      ['UTC (+00:00)', 'UTC'],
      ['Edinburgh (+00:00)', 'Edinburgh'],
      ['Lisbon (+00:00)', 'Lisbon'],
      ['London (+00:00)', 'London'],
      ['Monrovia (+00:00)', 'Monrovia'],
      ['Casablanca (+01:00)', 'Casablanca'],
      ['Dublin (+01:00)', 'Dublin'],
      ['Amsterdam (+01:00)', 'Amsterdam'],
      ['Belgrade (+01:00)', 'Belgrade'],
      ['Berlin (+01:00)', 'Berlin'],
      ['Bern (+01:00)', 'Bern'],
      ['Bratislava (+01:00)', 'Bratislava'],
      ['Brussels (+01:00)', 'Brussels'],
      ['Budapest (+01:00)', 'Budapest'],
      ['Copenhagen (+01:00)', 'Copenhagen'],
      ['Ljubljana (+01:00)', 'Ljubljana'],
      ['Madrid (+01:00)', 'Madrid'],
      ['Paris (+01:00)', 'Paris'],
      ['Prague (+01:00)', 'Prague'],
      ['Rome (+01:00)', 'Rome'],
      ['Sarajevo (+01:00)', 'Sarajevo'],
      ['Skopje (+01:00)', 'Skopje'],
      ['Stockholm (+01:00)', 'Stockholm'],
      ['Vienna (+01:00)', 'Vienna'],
      ['Warsaw (+01:00)', 'Warsaw'],
      ['West Central Africa (+01:00)', 'West Central Africa'],
      ['Zagreb (+01:00)', 'Zagreb'],
      ['Zurich (+01:00)', 'Zurich'],
      ['Athens (+02:00)', 'Athens'],
      ['Bucharest (+02:00)', 'Bucharest'],
      ['Cairo (+02:00)', 'Cairo'],
      ['Harare (+02:00)', 'Harare'],
      ['Helsinki (+02:00)', 'Helsinki'],
      ['Jerusalem (+02:00)', 'Jerusalem'],
      ['Kaliningrad (+02:00)', 'Kaliningrad'],
      ['Kyiv (+02:00)', 'Kyiv'],
      ['Pretoria (+02:00)', 'Pretoria'],
      ['Riga (+02:00)', 'Riga'],
      ['Sofia (+02:00)', 'Sofia'],
      ['Tallinn (+02:00)', 'Tallinn'],
      ['Vilnius (+02:00)', 'Vilnius'],
      ['Baghdad (+03:00)', 'Baghdad'],
      ['Istanbul (+03:00)', 'Istanbul'],
      ['Kuwait (+03:00)', 'Kuwait'],
      ['Minsk (+03:00)', 'Minsk'],
      ['Moscow (+03:00)', 'Moscow'],
      ['Nairobi (+03:00)', 'Nairobi'],
      ['Riyadh (+03:00)', 'Riyadh'],
      ['St. Petersburg (+03:00)', 'St. Petersburg'],
      ['Volgograd (+03:00)', 'Volgograd'],
      ['Abu Dhabi (+04:00)', 'Abu Dhabi'],
      ['Baku (+04:00)', 'Baku'],
      ['Muscat (+04:00)', 'Muscat'],
      ['Samara (+04:00)', 'Samara'],
      ['Tbilisi (+04:00)', 'Tbilisi'],
      ['Yerevan (+04:00)', 'Yerevan'],
      ['Ekaterinburg (+05:00)', 'Ekaterinburg'],
      ['Islamabad (+05:00)', 'Islamabad'],
      ['Karachi (+05:00)', 'Karachi'],
      ['Tashkent (+05:00)', 'Tashkent'],
      ['Almaty (+05:00)', 'Almaty'],
      ['Astana (+06:00)', 'Astana'],
      ['Dhaka (+06:00)', 'Dhaka'],
      ['Urumqi (+06:00)', 'Urumqi'],
      ['Bangkok (+07:00)', 'Bangkok'],
      ['Hanoi (+07:00)', 'Hanoi'],
      ['Jakarta (+07:00)', 'Jakarta'],
      ['Krasnoyarsk (+07:00)', 'Krasnoyarsk'],
      ['Novosibirsk (+07:00)', 'Novosibirsk'],
      ['Beijing (+08:00)', 'Beijing'],
      ['Chongqing (+08:00)', 'Chongqing'],
      ['Hong Kong (+08:00)', 'Hong Kong'],
      ['Irkutsk (+08:00)', 'Irkutsk'],
      ['Kuala Lumpur (+08:00)', 'Kuala Lumpur'],
      ['Perth (+08:00)', 'Perth'],
      ['Singapore (+08:00)', 'Singapore'],
      ['Taipei (+08:00)', 'Taipei'],
      ['Ulaanbaatar (+08:00)', 'Ulaanbaatar'],
      ['Osaka (+09:00)', 'Osaka'],
      ['Sapporo (+09:00)', 'Sapporo'],
      ['Seoul (+09:00)', 'Seoul'],
      ['Tokyo (+09:00)', 'Tokyo'],
      ['Yakutsk (+09:00)', 'Yakutsk'],
      ['Brisbane (+10:00)', 'Brisbane'],
      ['Guam (+10:00)', 'Guam'],
      ['Port Moresby (+10:00)', 'Port Moresby'],
      ['Vladivostok (+10:00)', 'Vladivostok'],
      ['Canberra (+11:00)', 'Canberra'],
      ['Hobart (+11:00)', 'Hobart'],
      ['Melbourne (+11:00)', 'Melbourne'],
      ['Sydney (+11:00)', 'Sydney'],
      ['Magadan (+11:00)', 'Magadan'],
      ['New Caledonia (+11:00)', 'New Caledonia'],
      ['Solomon Is. (+11:00)', 'Solomon Is.'],
      ['Srednekolymsk (+11:00)', 'Srednekolymsk'],
      ['Fiji (+12:00)', 'Fiji'],
      ['Kamchatka (+12:00)', 'Kamchatka'],
      ['Marshall Is. (+12:00)', 'Marshall Is.'],
      ['Auckland (+13:00)', 'Auckland'],
      ['Wellington (+13:00)', 'Wellington'],
      ['Samoa (+13:00)', 'Samoa'],
      ['Tokelau Is. (+13:00)', 'Tokelau Is.']
    ]

    GROUPED_TIMEZONES = [
      { hours: 13.0, zones: ['American Samoa', 'Midway Island'] },
      { hours: 14.0, zones: ['Hawaii'] },
      { hours: 16.0, zones: ['Alaska'] },
      { hours: 17.0, zones: ['Tijuana', 'Pacific Time (US & Canada)', 'Mazatlan', 'Arizona'] },
      { hours: 18.0,
        zones: ['Mountain Time (US & Canada)', 'Saskatchewan', 'Monterrey', 'Mexico City', 'Guadalajara', 'Chihuahua',
                'Central America'] },
      { hours: 19.0, zones: ['Central Time (US & Canada)', 'Quito', 'Lima', 'Bogota'] },
      { hours: 20.0,
        zones: ['Indiana (East)', 'Eastern Time (US & Canada)', 'Puerto Rico', 'La Paz', 'Georgetown', 'Caracas'] },
      { hours: 21.0, zones: ['Santiago', 'Atlantic Time (Canada)', 'Montevideo', 'Buenos Aires', 'Brasilia'] },
      { hours: 22.0, zones: %w[Mid-Atlantic Greenland] },
      { hours: 23.0, zones: ['Cape Verde Is.', 'Azores'] },
      { hours: 0.0,  zones: %w[UTC Edinburgh Lisbon London Monrovia Casablanca Dublin] },
      { hours: 1.0,
        zones: ['Amsterdam', 'Belgrade', 'Berlin', 'Bern', 'Bratislava', 'Brussels', 'Budapest', 'Copenhagen', 'Ljubljana',
                'Madrid', 'Paris', 'Prague', 'Rome', 'Sarajevo', 'Skopje', 'Stockholm', 'Vienna', 'West Central Africa', 'Zagreb', 'Zurich'] },
      { hours: 2.0,
        zones: %w[Athens Bucharest Cairo Harare Helsinki Jerusalem Kaliningrad Kyiv Pretoria Riga
                  Sofia Tallinn Vilnius] },
      { hours: 3.0,
        zones: ['Baghdad', 'Istanbul', 'Kuwait', 'Minsk', 'Moscow', 'Nairobi', 'Riyadh', 'St. Petersburg',
                'Volgograd'] },
      { hours: 4.0,  zones: ['Abu Dhabi', 'Baku', 'Muscat', 'Samara', 'Tbilisi', 'Yerevan'] },
      { hours: 5.0,  zones: %w[Ekaterinburg Islamabad Karachi Tashkent Almaty] },
      { hours: 6.0,  zones: %w[Astana Dhaka Urumqi] },
      { hours: 7.0,  zones: %w[Bangkok Hanoi Jakarta Krasnoyarsk Novosibirsk] },
      { hours: 8.0,
        zones: ['Beijing', 'Chongqing', 'Hong Kong', 'Irkutsk', 'Kuala Lumpur', 'Perth', 'Singapore', 'Taipei',
                'Ulaanbaata'] },
      { hours: 9.0,  zones: %w[Osaka Sapporo Seoul Tokyo Yakutsk] },
      { hours: 10.0, zones: ['Brisbane', 'Guam', 'Port Moresby', 'Vladivostok'] },
      { hours: 11.0,
        zones: ['Canberra', 'Hobart', 'Melbourne', 'Sydney', 'Magadan', 'New Caledoni', 'Solomon Is.',
                'Srednekolymsk'] },
      { hours: 12.0, zones: ['Fiji', 'Kamchatka', 'Marshall Is.'] },
      { hours: 13.0, zones: ['Auckland', 'Wellington', 'Samoa', 'Tokelau Is.'] }
    ]
  end
end

# ['Midway Island (-11:00)' ,'Midway Island'],                               -11                                               Midway Island                          03/17/2024 13:00:01
# ['American Samoa (-11:00)' ,'American Samoa'],                             -11                                               American Samoa                         03/17/2024 13:00:01
# ['Hawaii (-10:00)' ,'Hawaii'],                                             -10                                               Hawaii                                 03/17/2024 14:00:01
# ['Alaska (-08:00)' ,'Alaska'],                                             -8                                                Alaska                                 03/17/2024 16:00:01
# ['Tijuana (-07:00)' ,'Tijuana'],                                           -7                                                Tijuana                                03/17/2024 17:00:01
# ['Pacific Time (US & Canada) (-07:00)' ,'Pacific Time (US & Canada)'],     -7                                                Pacific Time (US & Canada)             03/17/2024 17:00:01
# ['Mazatlan (-07:00)' ,'Mazatlan'],                                         -7                                                Mazatlan                               03/17/2024 17:00:01
# ['Arizona (-07:00)' ,'Arizona'],                                           -7                                                Arizona                                03/17/2024 17:00:01
# ['Mountain Time (US & Canada) (-06:00)' ,'Mountain Time (US & Canada)'],   -6                                                Mountain Time (US & Canada)            03/17/2024 18:00:01
# ['Saskatchewan (-06:00)' ,'Saskatchewan'],                                 -6                                                Saskatchewan                           03/17/2024 18:00:01
# ['Monterrey (-06:00)' ,'Monterrey'],                                       -6                                                Monterrey                              03/17/2024 18:00:01
# ['Mexico City (-06:00)' ,'Mexico City'],                                   -6                                                Mexico City                            03/17/2024 18:00:01
# ['Guadalajara (-06:00)' ,'Guadalajara'],                                   -6                                                Guadalajara                            03/17/2024 18:00:01
# ['Chihuahua (-06:00)' ,'Chihuahua'],                                       -6                                                Chihuahua                              03/17/2024 18:00:01
# ['Central America (-06:00)' ,'Central America'],                           -6                                                Central America                        03/17/2024 18:00:01
# ['Central Time (US & Canada) (-05:00)' ,'Central Time (US & Canada)'],     -5                                                Central Time (US & Canada)             03/17/2024 19:00:01
# ['Quito (-05:00)' ,'Quito'],                                               -5                                                Quito                                  03/17/2024 19:00:01
# ['Lima (-05:00)' ,'Lima'],                                                 -5                                                Lima                                   03/17/2024 19:00:01
# ['Bogota (-05:00)' ,'Bogota'],                                             -5                                                Bogota                                 03/17/2024 19:00:01
# ['Indiana (East) (-04:00)' ,'Indiana (East)'],                             -4                                                Indiana (East)                         03/17/2024 20:00:01
# ['Eastern Time (US & Canada) (-04:00)' ,'Eastern Time (US & Canada)'],     -4                                                Eastern Time (US & Canada)             03/17/2024 20:00:01
# ['Puerto Rico (-04:00)' ,'Puerto Rico'],                                   -4                                                Puerto Rico                            03/17/2024 20:00:01
# ['La Paz (-04:00)' ,'La Paz'],                                             -4                                                La Paz                                 03/17/2024 20:00:01
# ['Georgetown (-04:00)' ,'Georgetown'],                                     -4                                                Georgetown                             03/17/2024 20:00:01
# ['Caracas (-04:00)' ,'Caracas'],                                           -4                                                Caracas                                03/17/2024 20:00:01
# ['Santiago (-03:00)' ,'Santiago'],                                         -3                                                Santiago                               03/17/2024 21:00:01
# ['Atlantic Time (Canada) (-03:00)' ,'Atlantic Time (Canada)'],             -3                                                Atlantic Time (Canada)                 03/17/2024 21:00:01
# ['Montevideo (-03:00)' ,'Montevideo'],                                     -3                                                Montevideo                             03/17/2024 21:00:01
# ['Buenos Aires (-03:00)' ,'Buenos Aires'],                                 -3                                                Buenos Aires                           03/17/2024 21:00:01
# ['Brasilia (-03:00)' ,'Brasilia'],                                         -3                                                Brasilia                               03/17/2024 21:00:01
# ['Mid-Atlantic (-02:00)' ,'Mid-Atlantic'],                                 -2                                                Mid-Atlantic                           03/17/2024 22:00:01
# ['Greenland (-02:00)' ,'Greenland'],                                       -2                                                Greenland                              03/17/2024 22:00:01
# ['Cape Verde Is. (-01:00)' ,'Cape Verde Is.'],                             -1                                                Cape Verde Is.                         03/17/2024 23:00:01
# ['Azores (-01:00)' ,'Azores'],                                             -1                                                Azores                                 03/17/2024 23:00:01
# ['UTC (+00:00)' ,'UTC'],                                                   -24                                                UTC                                    03/18/2024 00:00:01
# ['Edinburgh (+00:00)' ,'Edinburgh'],                                       -24                                                Edinburgh                              03/18/2024 00:00:01
# ['Lisbon (+00:00)' ,'Lisbon'],                                             -24                                                Lisbon                                 03/18/2024 00:00:01
# ['London (+00:00)' ,'London'],                                             -24                                                London                                 03/18/2024 00:00:01
# ['Monrovia (+00:00)' ,'Monrovia'],                                         -24                                                Monrovia                               03/18/2024 00:00:01
# ['Casablanca (+01:00)' ,'Casablanca'],                                     -24                                                Casablanca                             03/18/2024 00:00:01
# ['Dublin (+01:00)' ,'Dublin'],                                             -24                                                Dublin                                 03/18/2024 00:00:01
# ['Amsterdam (+01:00)' ,'Amsterdam'],                                       -23                                                Amsterdam                              03/18/2024 01:00:01
# ['Belgrade (+01:00)' ,'Belgrade'],                                         -23                                                Belgrade                               03/18/2024 01:00:01
# ['Berlin (+01:00)' ,'Berlin'],                                             -23                                                Berlin                                 03/18/2024 01:00:01
# ['Bern (+01:00)' ,'Bern'],                                                 -23                                                Bern                                   03/18/2024 01:00:01
# ['Bratislava (+01:00)' ,'Bratislava'],                                     -23                                                Bratislava                             03/18/2024 01:00:01
# ['Brussels (+01:00)' ,'Brussels'],                                         -23                                                Brussels                               03/18/2024 01:00:01
# ['Budapest (+01:00)' ,'Budapest'],                                         -23                                                Budapest                               03/18/2024 01:00:01
# ['Copenhagen (+01:00)' ,'Copenhagen'],                                     -23                                                Copenhagen                             03/18/2024 01:00:01
# ['Ljubljana (+01:00)' ,'Ljubljana'],                                       -23                                                Ljubljana                              03/18/2024 01:00:01
# ['Madrid (+01:00)' ,'Madrid'],                                             -23                                                Madrid                                 03/18/2024 01:00:01
# ['Paris (+01:00)' ,'Paris'],                                               -23                                                Paris                                  03/18/2024 01:00:01
# ['Prague (+01:00)' ,'Prague'],                                             -23                                                Prague                                 03/18/2024 01:00:01
# ['Rome (+01:00)' ,'Rome'],                                                 -23                                                Rome                                   03/18/2024 01:00:01
# ['Sarajevo (+01:00)' ,'Sarajevo'],                                         -23                                                Sarajevo                               03/18/2024 01:00:01
# ['Skopje (+01:00)' ,'Skopje'],                                             -23                                                Skopje                                 03/18/2024 01:00:01
# ['Stockholm (+01:00)' ,'Stockholm'],                                       -23                                                Stockholm                              03/18/2024 01:00:01
# ['Vienna (+01:00)' ,'Vienna'],                                             -23                                                Vienna                                 03/18/2024 01:00:01
# ['Warsaw (+01:00)' ,'Warsaw'],                                             -23                                                Warsaw                                 03/18/2024 01:00:01
# ['West Central Africa (+01:00)' ,'West Central Africa'],                   -23                                                West Central Africa                    03/18/2024 01:00:01
# ['Zagreb (+01:00)' ,'Zagreb'],                                             -23                                                Zagreb                                 03/18/2024 01:00:01
# ['Zurich (+01:00)' ,'Zurich'],                                             -23                                                Zurich                                 03/18/2024 01:00:01
# ['Athens (+02:00)' ,'Athens'],                                             -22                                                Athens                                 03/18/2024 02:00:01
# ['Bucharest (+02:00)' ,'Bucharest'],                                       -22                                                Bucharest                              03/18/2024 02:00:01
# ['Cairo (+02:00)' ,'Cairo'],                                               -22                                                Cairo                                  03/18/2024 02:00:01
# ['Harare (+02:00)' ,'Harare'],                                             -22                                                Harare                                 03/18/2024 02:00:01
# ['Helsinki (+02:00)' ,'Helsinki'],                                         -22                                                Helsinki                               03/18/2024 02:00:01
# ['Jerusalem (+02:00)' ,'Jerusalem'],                                       -22                                                Jerusalem                              03/18/2024 02:00:01
# ['Kaliningrad (+02:00)' ,'Kaliningrad'],                                   -22                                                Kaliningrad                            03/18/2024 02:00:01
# ['Kyiv (+02:00)' ,'Kyiv'],                                                 -22                                                Kyiv                                   03/18/2024 02:00:01
# ['Pretoria (+02:00)' ,'Pretoria'],                                         -22                                                Pretoria                               03/18/2024 02:00:01
# ['Riga (+02:00)' ,'Riga'],                                                 -22                                                Riga                                   03/18/2024 02:00:01
# ['Sofia (+02:00)' ,'Sofia'],                                               -22                                                Sofia                                  03/18/2024 02:00:01
# ['Tallinn (+02:00)' ,'Tallinn'],                                           -22                                                Tallinn                                03/18/2024 02:00:01
# ['Vilnius (+02:00)' ,'Vilnius'],                                           -22                                                Vilnius                                03/18/2024 02:00:01
# ['Baghdad (+03:00)' ,'Baghdad'],                                           -21                                                Baghdad                                03/18/2024 03:00:01
# ['Istanbul (+03:00)' ,'Istanbul'],                                         -21                                                Istanbul                               03/18/2024 03:00:01
# ['Kuwait (+03:00)' ,'Kuwait'],                                             -21                                                Kuwait                                 03/18/2024 03:00:01
# ['Minsk (+03:00)' ,'Minsk'],                                               -21                                                Minsk                                  03/18/2024 03:00:01
# ['Moscow (+03:00)' ,'Moscow'],                                             -21                                                Moscow                                 03/18/2024 03:00:01
# ['Nairobi (+03:00)' ,'Nairobi'],                                           -21                                                Nairobi                                03/18/2024 03:00:01
# ['Riyadh (+03:00)' ,'Riyadh'],                                             -21                                                Riyadh                                 03/18/2024 03:00:01
# ['St. Petersburg (+03:00)' ,'St. Petersburg'],                             -21                                                St. Petersburg                         03/18/2024 03:00:01
# ['Volgograd (+03:00)' ,'Volgograd'],                                       -21                                                Volgograd                              03/18/2024 03:00:01
# ['Abu Dhabi (+04:00)' ,'Abu Dhabi'],                                       -20                                                Abu Dhabi                              03/18/2024 04:00:01
# ['Baku (+04:00)' ,'Baku'],                                                 -20                                                Baku                                   03/18/2024 04:00:01
# ['Muscat (+04:00)' ,'Muscat'],                                             -20                                                Muscat                                 03/18/2024 04:00:01
# ['Samara (+04:00)' ,'Samara'],                                             -20                                                Samara                                 03/18/2024 04:00:01
# ['Tbilisi (+04:00)' ,'Tbilisi'],                                           -20                                                Tbilisi                                03/18/2024 04:00:01
# ['Yerevan (+04:00)' ,'Yerevan'],                                           -20                                                Yerevan                                03/18/2024 04:00:01
# ['Ekaterinburg (+05:00)' ,'Ekaterinburg'],                                 -19                                                Ekaterinburg                           03/18/2024 05:00:01
# ['Islamabad (+05:00)' ,'Islamabad'],                                       -19                                                Islamabad                              03/18/2024 05:00:01
# ['Karachi (+05:00)' ,'Karachi'],                                           -19                                                Karachi                                03/18/2024 05:00:01
# ['Tashkent (+05:00)' ,'Tashkent'],                                         -19                                                Tashkent                               03/18/2024 05:00:01
# ['Almaty (+05:00)' ,'Almaty'],                                             -19                                                Almaty                                 03/18/2024 05:00:01
# ['Astana (+06:00)' ,'Astana'],                                             -18                                                Astana                                 03/18/2024 06:00:01
# ['Dhaka (+06:00)' ,'Dhaka'],                                               -18                                                Dhaka                                  03/18/2024 06:00:01
# ['Urumqi (+06:00)' ,'Urumqi'],                                             -18                                                Urumqi                                 03/18/2024 06:00:01
# ['Bangkok (+07:00)' ,'Bangkok'],                                           -17                                                Bangkok                                03/18/2024 07:00:01
# ['Hanoi (+07:00)' ,'Hanoi'],                                               -17                                                Hanoi                                  03/18/2024 07:00:01
# ['Jakarta (+07:00)' ,'Jakarta'],                                           -17                                                Jakarta                                03/18/2024 07:00:01
# ['Krasnoyarsk (+07:00)' ,'Krasnoyarsk'],                                   -17                                                Krasnoyarsk                            03/18/2024 07:00:01
# ['Novosibirsk (+07:00)' ,'Novosibirsk'],                                   -17                                                Novosibirsk                            03/18/2024 07:00:01
# ['Beijing (+08:00)' ,'Beijing'],                                           -16                                                Beijing                                03/18/2024 08:00:01
# ['Chongqing (+08:00)' ,'Chongqing'],                                       -16                                                Chongqing                              03/18/2024 08:00:01
# ['Hong Kong (+08:00)' ,'Hong Kong'],                                       -16                                                Hong Kong                              03/18/2024 08:00:01
# ['Irkutsk (+08:00)' ,'Irkutsk'],                                           -16                                                Irkutsk                                03/18/2024 08:00:01
# ['Kuala Lumpur (+08:00)' ,'Kuala Lumpur'],                                 -16                                                Kuala Lumpur                           03/18/2024 08:00:01
# ['Perth (+08:00)' ,'Perth'],                                               -16                                                Perth                                  03/18/2024 08:00:01
# ['Singapore (+08:00)' ,'Singapore'],                                       -16                                                Singapore                              03/18/2024 08:00:01
# ['Taipei (+08:00)' ,'Taipei'],                                             -16                                                Taipei                                 03/18/2024 08:00:01
# ['Ulaanbaatar (+08:00)' ,'Ulaanbaatar'],                                   -16                                                Ulaanbaatar                            03/18/2024 08:00:01
# ['Osaka (+09:00)' ,'Osaka'],                                               -15                                                Osaka                                  03/18/2024 09:00:01
# ['Sapporo (+09:00)' ,'Sapporo'],                                           -15                                                Sapporo                                03/18/2024 09:00:01
# ['Seoul (+09:00)' ,'Seoul'],                                               -15                                                Seoul                                  03/18/2024 09:00:01
# ['Tokyo (+09:00)' ,'Tokyo'],                                               -15                                                Tokyo                                  03/18/2024 09:00:01
# ['Yakutsk (+09:00)' ,'Yakutsk'],                                           -15                                                Yakutsk                                03/18/2024 09:00:01
# ['Brisbane (+10:00)' ,'Brisbane'],                                         -14                                                Brisbane                               03/18/2024 10:00:01
# ['Guam (+10:00)' ,'Guam'],                                                 -14                                                Guam                                   03/18/2024 10:00:01
# ['Port Moresby (+10:00)' ,'Port Moresby'],                                 -14                                                Port Moresby                           03/18/2024 10:00:01
# ['Vladivostok (+10:00)' ,'Vladivostok'],                                   -14                                                Vladivostok                            03/18/2024 10:00:01
# ['Canberra (+11:00)' ,'Canberra'],                                         -13                                                Canberra                               03/18/2024 11:00:01
# ['Hobart (+11:00)' ,'Hobart'],                                             -13                                                Hobart                                 03/18/2024 11:00:01
# ['Melbourne (+11:00)' ,'Melbourne'],                                       -13                                                Melbourne                              03/18/2024 11:00:01
# ['Sydney (+11:00)' ,'Sydney'],                                             -13                                                Sydney                                 03/18/2024 11:00:01
# ['Magadan (+11:00)' ,'Magadan'],                                           -13                                                Magadan                                03/18/2024 11:00:01
# ['New Caledonia (+11:00)' ,'New Caledonia'],                               -13                                                New Caledonia                          03/18/2024 11:00:01
# ['Solomon Is. (+11:00)' ,'Solomon Is.'],                                   -13                                                Solomon Is.                            03/18/2024 11:00:01
# ['Srednekolymsk (+11:00)' ,'Srednekolymsk'],                               -13                                                Srednekolymsk                          03/18/2024 11:00:01
# ['Fiji (+12:00)' ,'Fiji'],                                                 -12                                                Fiji                                   03/18/2024 12:00:01
# ['Kamchatka (+12:00)' ,'Kamchatka'],                                       -12                                                Kamchatka                              03/18/2024 12:00:01
# ['Marshall Is. (+12:00)' ,'Marshall Is.'],                                 -12                                                Marshall Is.                           03/18/2024 12:00:01
# ['Auckland (+13:00)' ,'Auckland'],                                         -11                                                Auckland                               03/18/2024 13:00:01
# ['Wellington (+13:00)' ,'Wellington'],                                     -11                                                Wellington                             03/18/2024 13:00:01
# ['Samoa (+13:00)' ,'Samoa'],                                               -11                                                Samoa                                  03/18/2024 13:00:01
# ['Tokelau Is. (+13:00)' ,'Tokelau Is.']                                    -11                                                Tokelau Is.                            03/18/2024 13:00:01
