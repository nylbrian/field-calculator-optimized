<?php

class CountriesDAO {
  const MAIN_TABLE = 'countries';

  private $regionDAO;

  public function __construct() {
    $this->regionDAO = new RegionsDAO();
  }

  public function add($countryName) {
    $result = DB::querySlave('SELECT id from countries where name = "%s"',
      array($countryName));
    $country = $result->fetch();

    if (count($country) > 0) {
      return $country[0]['id'];
    }

    $result = DB::queryMaster('
      INSERT INTO countries(name, other, createdAt, updatedAt)
      VALUES("%s", %d, NOW(), NOW())',
      array($countryName, 1));

    return $result->insertId();
  }

  public function getAll($asArray = false) {
    $result = DB::querySlave('SELECT * FROM ' . self::MAIN_TABLE . ' WHERE deleted = 0 ORDER BY other ASC, name ASC');

    if ($result->numRows() <= 0) {
      return;
    }

    $countries = $result->fetch();

    if ($asArray) {
      return $countries;
    }

    $countryList = array();

    foreach ($countries as &$country) {
      $country['regions'] = $this->regionDAO->getAllByCountry($country['id']);
      $countryList[$country['id']] = $country;
    }

    return $countryList;
  }

  public function countryReader() {
    $countries = json_decode('{"BD": "Bangladesh", "BE": "Belgium", "BF": "Burkina Faso", "BG": "Bulgaria", "BA": "Bosnia and Herzegovina", "BB": "Barbados", "WF": "Wallis and Futuna", "BL": "Saint Barthelemy", "BM": "Bermuda", "BN": "Brunei", "BO": "Bolivia", "BH": "Bahrain", "BI": "Burundi", "BJ": "Benin", "BT": "Bhutan", "JM": "Jamaica", "BV": "Bouvet Island", "BW": "Botswana", "WS": "Samoa", "BQ": "Bonaire, Saint Eustatius and Saba ", "BR": "Brazil", "BS": "Bahamas", "JE": "Jersey", "BY": "Belarus", "BZ": "Belize", "RU": "Russia", "RW": "Rwanda", "RS": "Serbia", "TL": "East Timor", "RE": "Reunion", "TM": "Turkmenistan", "TJ": "Tajikistan", "RO": "Romania", "TK": "Tokelau", "GW": "Guinea-Bissau", "GU": "Guam", "GT": "Guatemala", "GS": "South Georgia and the South Sandwich Islands", "GR": "Greece", "GQ": "Equatorial Guinea", "GP": "Guadeloupe", "JP": "Japan", "GY": "Guyana", "GG": "Guernsey", "GF": "French Guiana", "GE": "Georgia", "GD": "Grenada", "GB": "United Kingdom", "GA": "Gabon", "SV": "El Salvador", "GN": "Guinea", "GM": "Gambia", "GL": "Greenland", "GI": "Gibraltar", "GH": "Ghana", "OM": "Oman", "TN": "Tunisia", "JO": "Jordan", "HR": "Croatia", "HT": "Haiti", "HU": "Hungary", "HK": "Hong Kong", "HN": "Honduras", "HM": "Heard Island and McDonald Islands", "VE": "Venezuela", "PR": "Puerto Rico", "PS": "Palestinian Territory", "PW": "Palau", "PT": "Portugal", "SJ": "Svalbard and Jan Mayen", "PY": "Paraguay", "IQ": "Iraq", "PA": "Panama", "PF": "French Polynesia", "PG": "Papua New Guinea", "PE": "Peru", "PK": "Pakistan", "PH": "Philippines", "PN": "Pitcairn", "PL": "Poland", "PM": "Saint Pierre and Miquelon", "ZM": "Zambia", "EH": "Western Sahara", "EE": "Estonia", "EG": "Egypt", "ZA": "South Africa", "EC": "Ecuador", "IT": "Italy", "VN": "Vietnam", "SB": "Solomon Islands", "ET": "Ethiopia", "SO": "Somalia", "ZW": "Zimbabwe", "SA": "Saudi Arabia", "ES": "Spain", "ER": "Eritrea", "ME": "Montenegro", "MD": "Moldova", "MG": "Madagascar", "MF": "Saint Martin", "MA": "Morocco", "MC": "Monaco", "UZ": "Uzbekistan", "MM": "Myanmar", "ML": "Mali", "MO": "Macao", "MN": "Mongolia", "MH": "Marshall Islands", "MK": "Macedonia", "MU": "Mauritius", "MT": "Malta", "MW": "Malawi", "MV": "Maldives", "MQ": "Martinique", "MP": "Northern Mariana Islands", "MS": "Montserrat", "MR": "Mauritania", "IM": "Isle of Man", "UG": "Uganda", "TZ": "Tanzania", "MY": "Malaysia", "MX": "Mexico", "IL": "Israel", "FR": "France", "IO": "British Indian Ocean Territory", "SH": "Saint Helena", "FI": "Finland", "FJ": "Fiji", "FK": "Falkland Islands", "FM": "Micronesia", "FO": "Faroe Islands", "NI": "Nicaragua", "NL": "Netherlands", "NO": "Norway", "NA": "Namibia", "VU": "Vanuatu", "NC": "New Caledonia", "NE": "Niger", "NF": "Norfolk Island", "NG": "Nigeria", "NZ": "New Zealand", "NP": "Nepal", "NR": "Nauru", "NU": "Niue", "CK": "Cook Islands", "XK": "Kosovo", "CI": "Ivory Coast", "CH": "Switzerland", "CO": "Colombia", "CN": "China", "CM": "Cameroon", "CL": "Chile", "CC": "Cocos Islands", "CA": "Canada", "CG": "Republic of the Congo", "CF": "Central African Republic", "CD": "Democratic Republic of the Congo", "CZ": "Czech Republic", "CY": "Cyprus", "CX": "Christmas Island", "CR": "Costa Rica", "CW": "Curacao", "CV": "Cape Verde", "CU": "Cuba", "SZ": "Swaziland", "SY": "Syria", "SX": "Sint Maarten", "KG": "Kyrgyzstan", "KE": "Kenya", "SS": "South Sudan", "SR": "Suriname", "KI": "Kiribati", "KH": "Cambodia", "KN": "Saint Kitts and Nevis", "KM": "Comoros", "ST": "Sao Tome and Principe", "SK": "Slovakia", "KR": "South Korea", "SI": "Slovenia", "KP": "North Korea", "KW": "Kuwait", "SN": "Senegal", "SM": "San Marino", "SL": "Sierra Leone", "SC": "Seychelles", "KZ": "Kazakhstan", "KY": "Cayman Islands", "SG": "Singapore", "SE": "Sweden", "SD": "Sudan", "DO": "Dominican Republic", "DM": "Dominica", "DJ": "Djibouti", "DK": "Denmark", "VG": "British Virgin Islands", "DE": "Germany", "YE": "Yemen", "DZ": "Algeria", "US": "United States", "UY": "Uruguay", "YT": "Mayotte", "UM": "United States Minor Outlying Islands", "LB": "Lebanon", "LC": "Saint Lucia", "LA": "Laos", "TV": "Tuvalu", "TW": "Taiwan", "TT": "Trinidad and Tobago", "TR": "Turkey", "LK": "Sri Lanka", "LI": "Liechtenstein", "LV": "Latvia", "TO": "Tonga", "LT": "Lithuania", "LU": "Luxembourg", "LR": "Liberia", "LS": "Lesotho", "TH": "Thailand", "TF": "French Southern Territories", "TG": "Togo", "TD": "Chad", "TC": "Turks and Caicos Islands", "LY": "Libya", "VA": "Vatican", "VC": "Saint Vincent and the Grenadines", "AE": "United Arab Emirates", "AD": "Andorra", "AG": "Antigua and Barbuda", "AF": "Afghanistan", "AI": "Anguilla", "VI": "U.S. Virgin Islands", "IS": "Iceland", "IR": "Iran", "AM": "Armenia", "AL": "Albania", "AO": "Angola", "AQ": "Antarctica", "AS": "American Samoa", "AR": "Argentina", "AU": "Australia", "AT": "Austria", "AW": "Aruba", "IN": "India", "AX": "Aland Islands", "AZ": "Azerbaijan", "IE": "Ireland", "ID": "Indonesia", "UA": "Ukraine", "QA": "Qatar", "MZ": "Mozambique"}', true);
    $countryCurrency = json_decode('{"BD": "BDT", "BE": "EUR", "BF": "XOF", "BG": "BGN", "BA": "BAM", "BB": "BBD", "WF": "XPF", "BL": "EUR", "BM": "BMD", "BN": "BND", "BO": "BOB", "BH": "BHD", "BI": "BIF", "BJ": "XOF", "BT": "BTN", "JM": "JMD", "BV": "NOK", "BW": "BWP", "WS": "WST", "BQ": "USD", "BR": "BRL", "BS": "BSD", "JE": "GBP", "BY": "BYR", "BZ": "BZD", "RU": "RUB", "RW": "RWF", "RS": "RSD", "TL": "USD", "RE": "EUR", "TM": "TMT", "TJ": "TJS", "RO": "RON", "TK": "NZD", "GW": "XOF", "GU": "USD", "GT": "GTQ", "GS": "GBP", "GR": "EUR", "GQ": "XAF", "GP": "EUR", "JP": "JPY", "GY": "GYD", "GG": "GBP", "GF": "EUR", "GE": "GEL", "GD": "XCD", "GB": "GBP", "GA": "XAF", "SV": "USD", "GN": "GNF", "GM": "GMD", "GL": "DKK", "GI": "GIP", "GH": "GHS", "OM": "OMR", "TN": "TND", "JO": "JOD", "HR": "HRK", "HT": "HTG", "HU": "HUF", "HK": "HKD", "HN": "HNL", "HM": "AUD", "VE": "VEF", "PR": "USD", "PS": "ILS", "PW": "USD", "PT": "EUR", "SJ": "NOK", "PY": "PYG", "IQ": "IQD", "PA": "PAB", "PF": "XPF", "PG": "PGK", "PE": "PEN", "PK": "PKR", "PH": "PHP", "PN": "NZD", "PL": "PLN", "PM": "EUR", "ZM": "ZMK", "EH": "MAD", "EE": "EUR", "EG": "EGP", "ZA": "ZAR", "EC": "USD", "IT": "EUR", "VN": "VND", "SB": "SBD", "ET": "ETB", "SO": "SOS", "ZW": "ZWL", "SA": "SAR", "ES": "EUR", "ER": "ERN", "ME": "EUR", "MD": "MDL", "MG": "MGA", "MF": "EUR", "MA": "MAD", "MC": "EUR", "UZ": "UZS", "MM": "MMK", "ML": "XOF", "MO": "MOP", "MN": "MNT", "MH": "USD", "MK": "MKD", "MU": "MUR", "MT": "EUR", "MW": "MWK", "MV": "MVR", "MQ": "EUR", "MP": "USD", "MS": "XCD", "MR": "MRO", "IM": "GBP", "UG": "UGX", "TZ": "TZS", "MY": "MYR", "MX": "MXN", "IL": "ILS", "FR": "EUR", "IO": "USD", "SH": "SHP", "FI": "EUR", "FJ": "FJD", "FK": "FKP", "FM": "USD", "FO": "DKK", "NI": "NIO", "NL": "EUR", "NO": "NOK", "NA": "NAD", "VU": "VUV", "NC": "XPF", "NE": "XOF", "NF": "AUD", "NG": "NGN", "NZ": "NZD", "NP": "NPR", "NR": "AUD", "NU": "NZD", "CK": "NZD", "XK": "EUR", "CI": "XOF", "CH": "CHF", "CO": "COP", "CN": "CNY", "CM": "XAF", "CL": "CLP", "CC": "AUD", "CA": "CAD", "CG": "XAF", "CF": "XAF", "CD": "CDF", "CZ": "CZK", "CY": "EUR", "CX": "AUD", "CR": "CRC", "CW": "ANG", "CV": "CVE", "CU": "CUP", "SZ": "SZL", "SY": "SYP", "SX": "ANG", "KG": "KGS", "KE": "KES", "SS": "SSP", "SR": "SRD", "KI": "AUD", "KH": "KHR", "KN": "XCD", "KM": "KMF", "ST": "STD", "SK": "EUR", "KR": "KRW", "SI": "EUR", "KP": "KPW", "KW": "KWD", "SN": "XOF", "SM": "EUR", "SL": "SLL", "SC": "SCR", "KZ": "KZT", "KY": "KYD", "SG": "SGD", "SE": "SEK", "SD": "SDG", "DO": "DOP", "DM": "XCD", "DJ": "DJF", "DK": "DKK", "VG": "USD", "DE": "EUR", "YE": "YER", "DZ": "DZD", "US": "USD", "UY": "UYU", "YT": "EUR", "UM": "USD", "LB": "LBP", "LC": "XCD", "LA": "LAK", "TV": "AUD", "TW": "TWD", "TT": "TTD", "TR": "TRY", "LK": "LKR", "LI": "CHF", "LV": "EUR", "TO": "TOP", "LT": "LTL", "LU": "EUR", "LR": "LRD", "LS": "LSL", "TH": "THB", "TF": "EUR", "TG": "XOF", "TD": "XAF", "TC": "USD", "LY": "LYD", "VA": "EUR", "VC": "XCD", "AE": "AED", "AD": "EUR", "AG": "XCD", "AF": "AFN", "AI": "XCD", "VI": "USD", "IS": "ISK", "IR": "IRR", "AM": "AMD", "AL": "ALL", "AO": "AOA", "AQ": "", "AS": "USD", "AR": "ARS", "AU": "AUD", "AT": "EUR", "AW": "AWG", "IN": "INR", "AX": "EUR", "AZ": "AZN", "IE": "EUR", "ID": "IDR", "UA": "UAH", "QA": "QAR", "MZ": "MZN"}', true);

    /*foreach ($countries as $key => $country) {
      $currency = DB::querySlave('SELECT id from currencies WHERE code = "%s"', array($countryCurrency[$key]));
      $currency_result = $currency->fetch();
      $currency_result = $currency_result[0];
      $cur = $currency_result['id'];

      if (!$cur) {
        continue;
      }

      $result = DB::querySlave('SELECT * from countries where name = "%s"', array($country));

      DB::startTransaction();
      if ($result->numRows() > 0) {
        $result = $result->fetch();
        $result = $result[0];
        DB::queryMaster('UPDATE countries set iso_3166_2 = "%s", currency_id = %d WHERE id = %d', array($key, $cur, $result['id']));
      } else {
        DB::queryMaster('
          INSERT INTO countries(
            name, iso_3166_2, currency_id, rcm, other, createdAt, updatedAt
          ) VALUES(
            "%s", "%s", %d, "nm", 1, NOW(), NOW()
          )
        ', array(
          $country, $key, $cur
        ));
      }
      DB::commit();
    }*/

  }

  public function getCurrencies() {
    $currencies = json_decode('{
      "USD": {
          "symbol": "$",
          "name": "US Dollar",
          "symbol_native": "$",
          "decimal_digits": 2,
          "rounding": 0,
          "code": "USD",
          "name_plural": "US dollars"
      },
      "CAD": {
          "symbol": "CA$",
          "name": "Canadian Dollar",
          "symbol_native": "$",
          "decimal_digits": 2,
          "rounding": 0,
          "code": "CAD",
          "name_plural": "Canadian dollars"
      },
      "EUR": {
          "symbol": "€",
          "name": "Euro",
          "symbol_native": "€",
          "decimal_digits": 2,
          "rounding": 0,
          "code": "EUR",
          "name_plural": "euros"
      },
      "AED": {
          "symbol": "AED",
          "name": "United Arab Emirates Dirham",
          "symbol_native": "د.إ.‏",
          "decimal_digits": 2,
          "rounding": 0,
          "code": "AED",
          "name_plural": "UAE dirhams"
      },
      "AFN": {
          "symbol": "Af",
          "name": "Afghan Afghani",
          "symbol_native": "؋",
          "decimal_digits": 0,
          "rounding": 0,
          "code": "AFN",
          "name_plural": "Afghan Afghanis"
      },
      "ALL": {
          "symbol": "ALL",
          "name": "Albanian Lek",
          "symbol_native": "Lek",
          "decimal_digits": 0,
          "rounding": 0,
          "code": "ALL",
          "name_plural": "Albanian lekë"
      },
      "AMD": {
          "symbol": "AMD",
          "name": "Armenian Dram",
          "symbol_native": "դր.",
          "decimal_digits": 0,
          "rounding": 0,
          "code": "AMD",
          "name_plural": "Armenian drams"
      },
      "ARS": {
          "symbol": "AR$",
          "name": "Argentine Peso",
          "symbol_native": "$",
          "decimal_digits": 2,
          "rounding": 0,
          "code": "ARS",
          "name_plural": "Argentine pesos"
      },
      "AUD": {
          "symbol": "AU$",
          "name": "Australian Dollar",
          "symbol_native": "$",
          "decimal_digits": 2,
          "rounding": 0,
          "code": "AUD",
          "name_plural": "Australian dollars"
      },
      "AZN": {
          "symbol": "man.",
          "name": "Azerbaijani Manat",
          "symbol_native": "ман.",
          "decimal_digits": 2,
          "rounding": 0,
          "code": "AZN",
          "name_plural": "Azerbaijani manats"
      },
      "BAM": {
          "symbol": "KM",
          "name": "Bosnia-Herzegovina Convertible Mark",
          "symbol_native": "KM",
          "decimal_digits": 2,
          "rounding": 0,
          "code": "BAM",
          "name_plural": "Bosnia-Herzegovina convertible marks"
      },
      "BDT": {
          "symbol": "Tk",
          "name": "Bangladeshi Taka",
          "symbol_native": "৳",
          "decimal_digits": 2,
          "rounding": 0,
          "code": "BDT",
          "name_plural": "Bangladeshi takas"
      },
      "BGN": {
          "symbol": "BGN",
          "name": "Bulgarian Lev",
          "symbol_native": "лв.",
          "decimal_digits": 2,
          "rounding": 0,
          "code": "BGN",
          "name_plural": "Bulgarian leva"
      },
      "BHD": {
          "symbol": "BD",
          "name": "Bahraini Dinar",
          "symbol_native": "د.ب.‏",
          "decimal_digits": 3,
          "rounding": 0,
          "code": "BHD",
          "name_plural": "Bahraini dinars"
      },
      "BIF": {
          "symbol": "FBu",
          "name": "Burundian Franc",
          "symbol_native": "FBu",
          "decimal_digits": 0,
          "rounding": 0,
          "code": "BIF",
          "name_plural": "Burundian francs"
      },
      "BND": {
          "symbol": "BN$",
          "name": "Brunei Dollar",
          "symbol_native": "$",
          "decimal_digits": 2,
          "rounding": 0,
          "code": "BND",
          "name_plural": "Brunei dollars"
      },
      "BOB": {
          "symbol": "Bs",
          "name": "Bolivian Boliviano",
          "symbol_native": "Bs",
          "decimal_digits": 2,
          "rounding": 0,
          "code": "BOB",
          "name_plural": "Bolivian bolivianos"
      },
      "BRL": {
          "symbol": "R$",
          "name": "Brazilian Real",
          "symbol_native": "R$",
          "decimal_digits": 2,
          "rounding": 0,
          "code": "BRL",
          "name_plural": "Brazilian reals"
      },
      "BWP": {
          "symbol": "BWP",
          "name": "Botswanan Pula",
          "symbol_native": "P",
          "decimal_digits": 2,
          "rounding": 0,
          "code": "BWP",
          "name_plural": "Botswanan pulas"
      },
      "BYR": {
          "symbol": "BYR",
          "name": "Belarusian Ruble",
          "symbol_native": "BYR",
          "decimal_digits": 0,
          "rounding": 0,
          "code": "BYR",
          "name_plural": "Belarusian rubles"
      },
      "BZD": {
          "symbol": "BZ$",
          "name": "Belize Dollar",
          "symbol_native": "$",
          "decimal_digits": 2,
          "rounding": 0,
          "code": "BZD",
          "name_plural": "Belize dollars"
      },
      "CDF": {
          "symbol": "CDF",
          "name": "Congolese Franc",
          "symbol_native": "FrCD",
          "decimal_digits": 2,
          "rounding": 0,
          "code": "CDF",
          "name_plural": "Congolese francs"
      },
      "CHF": {
          "symbol": "CHF",
          "name": "Swiss Franc",
          "symbol_native": "CHF",
          "decimal_digits": 2,
          "rounding": 0.05,
          "code": "CHF",
          "name_plural": "Swiss francs"
      },
      "CLP": {
          "symbol": "CL$",
          "name": "Chilean Peso",
          "symbol_native": "$",
          "decimal_digits": 0,
          "rounding": 0,
          "code": "CLP",
          "name_plural": "Chilean pesos"
      },
      "CNY": {
          "symbol": "CN¥",
          "name": "Chinese Yuan",
          "symbol_native": "CN¥",
          "decimal_digits": 2,
          "rounding": 0,
          "code": "CNY",
          "name_plural": "Chinese yuan"
      },
      "COP": {
          "symbol": "CO$",
          "name": "Colombian Peso",
          "symbol_native": "$",
          "decimal_digits": 0,
          "rounding": 0,
          "code": "COP",
          "name_plural": "Colombian pesos"
      },
      "CRC": {
          "symbol": "₡",
          "name": "Costa Rican Colón",
          "symbol_native": "₡",
          "decimal_digits": 0,
          "rounding": 0,
          "code": "CRC",
          "name_plural": "Costa Rican colóns"
      },
      "CVE": {
          "symbol": "CV$",
          "name": "Cape Verdean Escudo",
          "symbol_native": "CV$",
          "decimal_digits": 2,
          "rounding": 0,
          "code": "CVE",
          "name_plural": "Cape Verdean escudos"
      },
      "CZK": {
          "symbol": "Kč",
          "name": "Czech Republic Koruna",
          "symbol_native": "Kč",
          "decimal_digits": 2,
          "rounding": 0,
          "code": "CZK",
          "name_plural": "Czech Republic korunas"
      },
      "DJF": {
          "symbol": "Fdj",
          "name": "Djiboutian Franc",
          "symbol_native": "Fdj",
          "decimal_digits": 0,
          "rounding": 0,
          "code": "DJF",
          "name_plural": "Djiboutian francs"
      },
      "DKK": {
          "symbol": "Dkr",
          "name": "Danish Krone",
          "symbol_native": "kr",
          "decimal_digits": 2,
          "rounding": 0,
          "code": "DKK",
          "name_plural": "Danish kroner"
      },
      "DOP": {
          "symbol": "RD$",
          "name": "Dominican Peso",
          "symbol_native": "RD$",
          "decimal_digits": 2,
          "rounding": 0,
          "code": "DOP",
          "name_plural": "Dominican pesos"
      },
      "DZD": {
          "symbol": "DA",
          "name": "Algerian Dinar",
          "symbol_native": "د.ج.‏",
          "decimal_digits": 2,
          "rounding": 0,
          "code": "DZD",
          "name_plural": "Algerian dinars"
      },
      "EEK": {
          "symbol": "Ekr",
          "name": "Estonian Kroon",
          "symbol_native": "kr",
          "decimal_digits": 2,
          "rounding": 0,
          "code": "EEK",
          "name_plural": "Estonian kroons"
      },
      "EGP": {
          "symbol": "EGP",
          "name": "Egyptian Pound",
          "symbol_native": "ج.م.‏",
          "decimal_digits": 2,
          "rounding": 0,
          "code": "EGP",
          "name_plural": "Egyptian pounds"
      },
      "ERN": {
          "symbol": "Nfk",
          "name": "Eritrean Nakfa",
          "symbol_native": "Nfk",
          "decimal_digits": 2,
          "rounding": 0,
          "code": "ERN",
          "name_plural": "Eritrean nakfas"
      },
      "ETB": {
          "symbol": "Br",
          "name": "Ethiopian Birr",
          "symbol_native": "Br",
          "decimal_digits": 2,
          "rounding": 0,
          "code": "ETB",
          "name_plural": "Ethiopian birrs"
      },
      "GBP": {
          "symbol": "£",
          "name": "British Pound Sterling",
          "symbol_native": "£",
          "decimal_digits": 2,
          "rounding": 0,
          "code": "GBP",
          "name_plural": "British pounds sterling"
      },
      "GEL": {
          "symbol": "GEL",
          "name": "Georgian Lari",
          "symbol_native": "GEL",
          "decimal_digits": 2,
          "rounding": 0,
          "code": "GEL",
          "name_plural": "Georgian laris"
      },
      "GHS": {
          "symbol": "GH₵",
          "name": "Ghanaian Cedi",
          "symbol_native": "GH₵",
          "decimal_digits": 2,
          "rounding": 0,
          "code": "GHS",
          "name_plural": "Ghanaian cedis"
      },
      "GNF": {
          "symbol": "FG",
          "name": "Guinean Franc",
          "symbol_native": "FG",
          "decimal_digits": 0,
          "rounding": 0,
          "code": "GNF",
          "name_plural": "Guinean francs"
      },
      "GTQ": {
          "symbol": "GTQ",
          "name": "Guatemalan Quetzal",
          "symbol_native": "Q",
          "decimal_digits": 2,
          "rounding": 0,
          "code": "GTQ",
          "name_plural": "Guatemalan quetzals"
      },
      "HKD": {
          "symbol": "HK$",
          "name": "Hong Kong Dollar",
          "symbol_native": "$",
          "decimal_digits": 2,
          "rounding": 0,
          "code": "HKD",
          "name_plural": "Hong Kong dollars"
      },
      "HNL": {
          "symbol": "HNL",
          "name": "Honduran Lempira",
          "symbol_native": "L",
          "decimal_digits": 2,
          "rounding": 0,
          "code": "HNL",
          "name_plural": "Honduran lempiras"
      },
      "HRK": {
          "symbol": "kn",
          "name": "Croatian Kuna",
          "symbol_native": "kn",
          "decimal_digits": 2,
          "rounding": 0,
          "code": "HRK",
          "name_plural": "Croatian kunas"
      },
      "HUF": {
          "symbol": "Ft",
          "name": "Hungarian Forint",
          "symbol_native": "Ft",
          "decimal_digits": 0,
          "rounding": 0,
          "code": "HUF",
          "name_plural": "Hungarian forints"
      },
      "IDR": {
          "symbol": "Rp",
          "name": "Indonesian Rupiah",
          "symbol_native": "Rp",
          "decimal_digits": 0,
          "rounding": 0,
          "code": "IDR",
          "name_plural": "Indonesian rupiahs"
      },
      "ILS": {
          "symbol": "₪",
          "name": "Israeli New Sheqel",
          "symbol_native": "₪",
          "decimal_digits": 2,
          "rounding": 0,
          "code": "ILS",
          "name_plural": "Israeli new sheqels"
      },
      "INR": {
          "symbol": "Rs",
          "name": "Indian Rupee",
          "symbol_native": "টকা",
          "decimal_digits": 2,
          "rounding": 0,
          "code": "INR",
          "name_plural": "Indian rupees"
      },
      "IQD": {
          "symbol": "IQD",
          "name": "Iraqi Dinar",
          "symbol_native": "د.ع.‏",
          "decimal_digits": 0,
          "rounding": 0,
          "code": "IQD",
          "name_plural": "Iraqi dinars"
      },
      "IRR": {
          "symbol": "IRR",
          "name": "Iranian Rial",
          "symbol_native": "﷼",
          "decimal_digits": 0,
          "rounding": 0,
          "code": "IRR",
          "name_plural": "Iranian rials"
      },
      "ISK": {
          "symbol": "Ikr",
          "name": "Icelandic Króna",
          "symbol_native": "kr",
          "decimal_digits": 0,
          "rounding": 0,
          "code": "ISK",
          "name_plural": "Icelandic krónur"
      },
      "JMD": {
          "symbol": "J$",
          "name": "Jamaican Dollar",
          "symbol_native": "$",
          "decimal_digits": 2,
          "rounding": 0,
          "code": "JMD",
          "name_plural": "Jamaican dollars"
      },
      "JOD": {
          "symbol": "JD",
          "name": "Jordanian Dinar",
          "symbol_native": "د.أ.‏",
          "decimal_digits": 3,
          "rounding": 0,
          "code": "JOD",
          "name_plural": "Jordanian dinars"
      },
      "JPY": {
          "symbol": "¥",
          "name": "Japanese Yen",
          "symbol_native": "￥",
          "decimal_digits": 0,
          "rounding": 0,
          "code": "JPY",
          "name_plural": "Japanese yen"
      },
      "KES": {
          "symbol": "Ksh",
          "name": "Kenyan Shilling",
          "symbol_native": "Ksh",
          "decimal_digits": 2,
          "rounding": 0,
          "code": "KES",
          "name_plural": "Kenyan shillings"
      },
      "KHR": {
          "symbol": "KHR",
          "name": "Cambodian Riel",
          "symbol_native": "៛",
          "decimal_digits": 2,
          "rounding": 0,
          "code": "KHR",
          "name_plural": "Cambodian riels"
      },
      "KMF": {
          "symbol": "CF",
          "name": "Comorian Franc",
          "symbol_native": "FC",
          "decimal_digits": 0,
          "rounding": 0,
          "code": "KMF",
          "name_plural": "Comorian francs"
      },
      "KRW": {
          "symbol": "₩",
          "name": "South Korean Won",
          "symbol_native": "₩",
          "decimal_digits": 0,
          "rounding": 0,
          "code": "KRW",
          "name_plural": "South Korean won"
      },
      "KWD": {
          "symbol": "KD",
          "name": "Kuwaiti Dinar",
          "symbol_native": "د.ك.‏",
          "decimal_digits": 3,
          "rounding": 0,
          "code": "KWD",
          "name_plural": "Kuwaiti dinars"
      },
      "KZT": {
          "symbol": "KZT",
          "name": "Kazakhstani Tenge",
          "symbol_native": "тңг.",
          "decimal_digits": 2,
          "rounding": 0,
          "code": "KZT",
          "name_plural": "Kazakhstani tenges"
      },
      "LBP": {
          "symbol": "LB£",
          "name": "Lebanese Pound",
          "symbol_native": "ل.ل.‏",
          "decimal_digits": 0,
          "rounding": 0,
          "code": "LBP",
          "name_plural": "Lebanese pounds"
      },
      "LKR": {
          "symbol": "SLRs",
          "name": "Sri Lankan Rupee",
          "symbol_native": "SL Re",
          "decimal_digits": 2,
          "rounding": 0,
          "code": "LKR",
          "name_plural": "Sri Lankan rupees"
      },
      "LTL": {
          "symbol": "Lt",
          "name": "Lithuanian Litas",
          "symbol_native": "Lt",
          "decimal_digits": 2,
          "rounding": 0,
          "code": "LTL",
          "name_plural": "Lithuanian litai"
      },
      "LVL": {
          "symbol": "Ls",
          "name": "Latvian Lats",
          "symbol_native": "Ls",
          "decimal_digits": 2,
          "rounding": 0,
          "code": "LVL",
          "name_plural": "Latvian lati"
      },
      "LYD": {
          "symbol": "LD",
          "name": "Libyan Dinar",
          "symbol_native": "د.ل.‏",
          "decimal_digits": 3,
          "rounding": 0,
          "code": "LYD",
          "name_plural": "Libyan dinars"
      },
      "MAD": {
          "symbol": "MAD",
          "name": "Moroccan Dirham",
          "symbol_native": "د.م.‏",
          "decimal_digits": 2,
          "rounding": 0,
          "code": "MAD",
          "name_plural": "Moroccan dirhams"
      },
      "MDL": {
          "symbol": "MDL",
          "name": "Moldovan Leu",
          "symbol_native": "MDL",
          "decimal_digits": 2,
          "rounding": 0,
          "code": "MDL",
          "name_plural": "Moldovan lei"
      },
      "MGA": {
          "symbol": "MGA",
          "name": "Malagasy Ariary",
          "symbol_native": "MGA",
          "decimal_digits": 0,
          "rounding": 0,
          "code": "MGA",
          "name_plural": "Malagasy Ariaries"
      },
      "MKD": {
          "symbol": "MKD",
          "name": "Macedonian Denar",
          "symbol_native": "MKD",
          "decimal_digits": 2,
          "rounding": 0,
          "code": "MKD",
          "name_plural": "Macedonian denari"
      },
      "MMK": {
          "symbol": "MMK",
          "name": "Myanma Kyat",
          "symbol_native": "K",
          "decimal_digits": 0,
          "rounding": 0,
          "code": "MMK",
          "name_plural": "Myanma kyats"
      },
      "MOP": {
          "symbol": "MOP$",
          "name": "Macanese Pataca",
          "symbol_native": "MOP$",
          "decimal_digits": 2,
          "rounding": 0,
          "code": "MOP",
          "name_plural": "Macanese patacas"
      },
      "MUR": {
          "symbol": "MURs",
          "name": "Mauritian Rupee",
          "symbol_native": "MURs",
          "decimal_digits": 0,
          "rounding": 0,
          "code": "MUR",
          "name_plural": "Mauritian rupees"
      },
      "MXN": {
          "symbol": "MX$",
          "name": "Mexican Peso",
          "symbol_native": "$",
          "decimal_digits": 2,
          "rounding": 0,
          "code": "MXN",
          "name_plural": "Mexican pesos"
      },
      "MYR": {
          "symbol": "RM",
          "name": "Malaysian Ringgit",
          "symbol_native": "RM",
          "decimal_digits": 2,
          "rounding": 0,
          "code": "MYR",
          "name_plural": "Malaysian ringgits"
      },
      "MZN": {
          "symbol": "MTn",
          "name": "Mozambican Metical",
          "symbol_native": "MTn",
          "decimal_digits": 2,
          "rounding": 0,
          "code": "MZN",
          "name_plural": "Mozambican meticals"
      },
      "NAD": {
          "symbol": "N$",
          "name": "Namibian Dollar",
          "symbol_native": "N$",
          "decimal_digits": 2,
          "rounding": 0,
          "code": "NAD",
          "name_plural": "Namibian dollars"
      },
      "NGN": {
          "symbol": "₦",
          "name": "Nigerian Naira",
          "symbol_native": "₦",
          "decimal_digits": 2,
          "rounding": 0,
          "code": "NGN",
          "name_plural": "Nigerian nairas"
      },
      "NIO": {
          "symbol": "C$",
          "name": "Nicaraguan Córdoba",
          "symbol_native": "C$",
          "decimal_digits": 2,
          "rounding": 0,
          "code": "NIO",
          "name_plural": "Nicaraguan córdobas"
      },
      "NOK": {
          "symbol": "Nkr",
          "name": "Norwegian Krone",
          "symbol_native": "kr",
          "decimal_digits": 2,
          "rounding": 0,
          "code": "NOK",
          "name_plural": "Norwegian kroner"
      },
      "NPR": {
          "symbol": "NPRs",
          "name": "Nepalese Rupee",
          "symbol_native": "नेरू",
          "decimal_digits": 2,
          "rounding": 0,
          "code": "NPR",
          "name_plural": "Nepalese rupees"
      },
      "NZD": {
          "symbol": "NZ$",
          "name": "New Zealand Dollar",
          "symbol_native": "$",
          "decimal_digits": 2,
          "rounding": 0,
          "code": "NZD",
          "name_plural": "New Zealand dollars"
      },
      "OMR": {
          "symbol": "OMR",
          "name": "Omani Rial",
          "symbol_native": "ر.ع.‏",
          "decimal_digits": 3,
          "rounding": 0,
          "code": "OMR",
          "name_plural": "Omani rials"
      },
      "PAB": {
          "symbol": "B/.",
          "name": "Panamanian Balboa",
          "symbol_native": "B/.",
          "decimal_digits": 2,
          "rounding": 0,
          "code": "PAB",
          "name_plural": "Panamanian balboas"
      },
      "PEN": {
          "symbol": "S/.",
          "name": "Peruvian Nuevo Sol",
          "symbol_native": "S/.",
          "decimal_digits": 2,
          "rounding": 0,
          "code": "PEN",
          "name_plural": "Peruvian nuevos soles"
      },
      "PHP": {
          "symbol": "₱",
          "name": "Philippine Peso",
          "symbol_native": "₱",
          "decimal_digits": 2,
          "rounding": 0,
          "code": "PHP",
          "name_plural": "Philippine pesos"
      },
      "PKR": {
          "symbol": "PKRs",
          "name": "Pakistani Rupee",
          "symbol_native": "₨",
          "decimal_digits": 0,
          "rounding": 0,
          "code": "PKR",
          "name_plural": "Pakistani rupees"
      },
      "PLN": {
          "symbol": "zł",
          "name": "Polish Zloty",
          "symbol_native": "zł",
          "decimal_digits": 2,
          "rounding": 0,
          "code": "PLN",
          "name_plural": "Polish zlotys"
      },
      "PYG": {
          "symbol": "₲",
          "name": "Paraguayan Guarani",
          "symbol_native": "₲",
          "decimal_digits": 0,
          "rounding": 0,
          "code": "PYG",
          "name_plural": "Paraguayan guaranis"
      },
      "QAR": {
          "symbol": "QR",
          "name": "Qatari Rial",
          "symbol_native": "ر.ق.‏",
          "decimal_digits": 2,
          "rounding": 0,
          "code": "QAR",
          "name_plural": "Qatari rials"
      },
      "RON": {
          "symbol": "RON",
          "name": "Romanian Leu",
          "symbol_native": "RON",
          "decimal_digits": 2,
          "rounding": 0,
          "code": "RON",
          "name_plural": "Romanian lei"
      },
      "RSD": {
          "symbol": "din.",
          "name": "Serbian Dinar",
          "symbol_native": "дин.",
          "decimal_digits": 0,
          "rounding": 0,
          "code": "RSD",
          "name_plural": "Serbian dinars"
      },
      "RUB": {
          "symbol": "RUB",
          "name": "Russian Ruble",
          "symbol_native": "руб.",
          "decimal_digits": 2,
          "rounding": 0,
          "code": "RUB",
          "name_plural": "Russian rubles"
      },
      "RWF": {
          "symbol": "RWF",
          "name": "Rwandan Franc",
          "symbol_native": "FR",
          "decimal_digits": 0,
          "rounding": 0,
          "code": "RWF",
          "name_plural": "Rwandan francs"
      },
      "SAR": {
          "symbol": "SR",
          "name": "Saudi Riyal",
          "symbol_native": "ر.س.‏",
          "decimal_digits": 2,
          "rounding": 0,
          "code": "SAR",
          "name_plural": "Saudi riyals"
      },
      "SDG": {
          "symbol": "SDG",
          "name": "Sudanese Pound",
          "symbol_native": "SDG",
          "decimal_digits": 2,
          "rounding": 0,
          "code": "SDG",
          "name_plural": "Sudanese pounds"
      },
      "SEK": {
          "symbol": "Skr",
          "name": "Swedish Krona",
          "symbol_native": "kr",
          "decimal_digits": 2,
          "rounding": 0,
          "code": "SEK",
          "name_plural": "Swedish kronor"
      },
      "SGD": {
          "symbol": "S$",
          "name": "Singapore Dollar",
          "symbol_native": "$",
          "decimal_digits": 2,
          "rounding": 0,
          "code": "SGD",
          "name_plural": "Singapore dollars"
      },
      "SOS": {
          "symbol": "Ssh",
          "name": "Somali Shilling",
          "symbol_native": "Ssh",
          "decimal_digits": 0,
          "rounding": 0,
          "code": "SOS",
          "name_plural": "Somali shillings"
      },
      "SYP": {
          "symbol": "SY£",
          "name": "Syrian Pound",
          "symbol_native": "ل.س.‏",
          "decimal_digits": 0,
          "rounding": 0,
          "code": "SYP",
          "name_plural": "Syrian pounds"
      },
      "THB": {
          "symbol": "฿",
          "name": "Thai Baht",
          "symbol_native": "฿",
          "decimal_digits": 2,
          "rounding": 0,
          "code": "THB",
          "name_plural": "Thai baht"
      },
      "TND": {
          "symbol": "DT",
          "name": "Tunisian Dinar",
          "symbol_native": "د.ت.‏",
          "decimal_digits": 3,
          "rounding": 0,
          "code": "TND",
          "name_plural": "Tunisian dinars"
      },
      "TOP": {
          "symbol": "T$",
          "name": "Tongan Paʻanga",
          "symbol_native": "T$",
          "decimal_digits": 2,
          "rounding": 0,
          "code": "TOP",
          "name_plural": "Tongan paʻanga"
      },
      "TRY": {
          "symbol": "TL",
          "name": "Turkish Lira",
          "symbol_native": "TL",
          "decimal_digits": 2,
          "rounding": 0,
          "code": "TRY",
          "name_plural": "Turkish Lira"
      },
      "TTD": {
          "symbol": "TT$",
          "name": "Trinidad and Tobago Dollar",
          "symbol_native": "$",
          "decimal_digits": 2,
          "rounding": 0,
          "code": "TTD",
          "name_plural": "Trinidad and Tobago dollars"
      },
      "TWD": {
          "symbol": "NT$",
          "name": "New Taiwan Dollar",
          "symbol_native": "NT$",
          "decimal_digits": 2,
          "rounding": 0,
          "code": "TWD",
          "name_plural": "New Taiwan dollars"
      },
      "TZS": {
          "symbol": "TSh",
          "name": "Tanzanian Shilling",
          "symbol_native": "TSh",
          "decimal_digits": 0,
          "rounding": 0,
          "code": "TZS",
          "name_plural": "Tanzanian shillings"
      },
      "UAH": {
          "symbol": "₴",
          "name": "Ukrainian Hryvnia",
          "symbol_native": "₴",
          "decimal_digits": 2,
          "rounding": 0,
          "code": "UAH",
          "name_plural": "Ukrainian hryvnias"
      },
      "UGX": {
          "symbol": "USh",
          "name": "Ugandan Shilling",
          "symbol_native": "USh",
          "decimal_digits": 0,
          "rounding": 0,
          "code": "UGX",
          "name_plural": "Ugandan shillings"
      },
      "UYU": {
          "symbol": "$U",
          "name": "Uruguayan Peso",
          "symbol_native": "$",
          "decimal_digits": 2,
          "rounding": 0,
          "code": "UYU",
          "name_plural": "Uruguayan pesos"
      },
      "UZS": {
          "symbol": "UZS",
          "name": "Uzbekistan Som",
          "symbol_native": "UZS",
          "decimal_digits": 0,
          "rounding": 0,
          "code": "UZS",
          "name_plural": "Uzbekistan som"
      },
      "VEF": {
          "symbol": "Bs.F.",
          "name": "Venezuelan Bolívar",
          "symbol_native": "Bs.F.",
          "decimal_digits": 2,
          "rounding": 0,
          "code": "VEF",
          "name_plural": "Venezuelan bolívars"
      },
      "VND": {
          "symbol": "₫",
          "name": "Vietnamese Dong",
          "symbol_native": "₫",
          "decimal_digits": 0,
          "rounding": 0,
          "code": "VND",
          "name_plural": "Vietnamese dong"
      },
      "XAF": {
          "symbol": "FCFA",
          "name": "CFA Franc BEAC",
          "symbol_native": "FCFA",
          "decimal_digits": 0,
          "rounding": 0,
          "code": "XAF",
          "name_plural": "CFA francs BEAC"
      },
      "XOF": {
          "symbol": "CFA",
          "name": "CFA Franc BCEAO",
          "symbol_native": "CFA",
          "decimal_digits": 0,
          "rounding": 0,
          "code": "XOF",
          "name_plural": "CFA francs BCEAO"
      },
      "YER": {
          "symbol": "YR",
          "name": "Yemeni Rial",
          "symbol_native": "ر.ي.‏",
          "decimal_digits": 0,
          "rounding": 0,
          "code": "YER",
          "name_plural": "Yemeni rials"
      },
      "ZAR": {
          "symbol": "R",
          "name": "South African Rand",
          "symbol_native": "R",
          "decimal_digits": 2,
          "rounding": 0,
          "code": "ZAR",
          "name_plural": "South African rand"
      },
      "ZMK": {
          "symbol": "ZK",
          "name": "Zambian Kwacha",
          "symbol_native": "ZK",
          "decimal_digits": 0,
          "rounding": 0,
          "code": "ZMK",
          "name_plural": "Zambian kwachas"
      }
  }', true);

    /*foreach ($currencies as $key => $currency) {
      DB::startTransaction();
      echo '<pre>' . print_r($currency, true) . '</pre>';
      DB::queryMaster('
        INSERT INTO currencies(
          name, code, symbol,
          symbol_native, decimal_digits, rounding,
          name_plural, exchange_rate, updatedExchangeRate)
        VALUES(
          "%s", "%s", "%s",
          "%s", %d, %d,
          "%s", 1, NOW()
        )', array(
          $currency['name'],
          $currency['code'],
          $currency['symbol'],
          $currency['symbol_native'],
          $currency['decimal_digits'],
          $currency['rounding'],
          $currency['name_plural']
        ));
      DB::commit();
    }*/

    return DB::querySlave('SELECT * from currencies')->fetch();
  }

  public function updateExchangeRate() {
    $rates = file_get_contents("http://www.apilayer.net/api/live?access_key=c120dd1fb0401491ab24b6a44bf135dd");

    if (!$rates) {
      return false;
    }

    $ratesArr = json_decode($rates, true);

    if (!$ratesArr) {
      return false;
    }

    $ratesList = $ratesArr['quotes'];

    if (!is_array($ratesList)) {
      return false;
    }

    foreach ($ratesList as $key => $rate) {
      DB::startTransaction();
      DB::queryMaster('UPDATE currencies SET exchange_rate = "%s", updatedExchangeRate = NOW() WHERE code = "%s"', array(
        $rate,
        str_replace('USD', '', $key)
      ));
      DB::commit();
    }

    echo '<pre>' . print_r($ratesList , true) . '</pre>';
  }
}
