use scott;
/*
JOINS
INNER JOIN: COMMON DATA|MATCHING DATA| 
OUTER JOIN : implement inner join and Fetch unmatched rows|Rows that do not satisfies the condition
RIGHT OUTER JOIN
LEFT OUTER JOIN
FULL OUTER JOIN --> Not supported in mysql
CROSS JOIN

SELF JOIN
*/
select ename,dname from emp e inner join dept d on (e.deptno=d.deptno);
select ename,dname from emp e right outer join dept d on (e.deptno=d.deptno);
select ename,dname from emp e right outer join dept d on (e.deptno=d.deptno) where ename is null;
select ename,dname from dept d left outer join emp e on (e.deptno=d.deptno) where ename is null;
# Cross Join:
select ename,dname from emp cross join dept;

# Self Join
Create table customers(cust_id int,name char(12),city char(22));
insert into customers values(101,'king','boston');
insert into customers values(102,'ben','seattle');
insert into customers values(103,'alex','boston');
insert into customers values(102,'ben','seattle');
select * from customers;
select c1.name ,c1.city from customers c1 join customers c2 on 
(c1.city=c2.city) and c1.cust_id<>c2.cust_id;
select * from emp;
select e1.ename from emp e1 join emp e2 on (s1.sal=3000) and e1.empno<>e2.empno;

# Join Multiple table at A Time
select ci.name as city_name,co.name country_name,language
from country co join countrylanguage cl on (co.code=cl.countrycode)
join city ci on (ci.countrycode=cl.countrycode) where co.name='india';

-- mysql> use world;
-- Database changed
-- mysql> show table;
-- ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near '' at line 1
-- mysql> show tables;
-- +-----------------+
| Tables_in_world |
+-----------------+
| city            |
| country         |
| countrylanguage |
+-----------------+
3 rows in set (0.00 sec)

mysql> desc country;
+----------------+---------------------------------------------------------------------------------------+------+-----+---------+-------+
| Field          | Type                                                                                  | Null | Key | Default | Extra |
+----------------+---------------------------------------------------------------------------------------+------+-----+---------+-------+
| Code           | char(3)                                                                               | NO   | PRI |         |       |
| Name           | char(52)                                                                              | NO   |     |         |       |
| Continent      | enum('Asia','Europe','North America','Africa','Oceania','Antarctica','South America') | NO   |     | Asia    |       |
| Region         | char(26)                                                                              | NO   |     |         |       |
| SurfaceArea    | float(10,2)                                                                           | NO   |     | 0.00    |       |
| IndepYear      | smallint                                                                              | YES  |     | NULL    |       |
| Population     | int                                                                                   | NO   |     | 0       |       |
| LifeExpectancy | float(3,1)                                                                            | YES  |     | NULL    |       |
| GNP            | float(10,2)                                                                           | YES  |     | NULL    |       |
| GNPOld         | float(10,2)                                                                           | YES  |     | NULL    |       |
| LocalName      | char(45)                                                                              | NO   |     |         |       |
| GovernmentForm | char(45)                                                                              | NO   |     |         |       |
| HeadOfState    | char(60)                                                                              | YES  |     | NULL    |       |
| Capital        | int                                                                                   | YES  |     | NULL    |       |
| Code2          | char(2)                                                                               | NO   |     |         |       |
+----------------+---------------------------------------------------------------------------------------+------+-----+---------+-------+
15 rows in set (0.01 sec)

mysql> desc countrylanguage;
+-------------+---------------+------+-----+---------+-------+
| Field       | Type          | Null | Key | Default | Extra |
+-------------+---------------+------+-----+---------+-------+
| CountryCode | char(3)       | NO   | PRI |         |       |
| Language    | char(30)      | NO   | PRI |         |       |
| IsOfficial  | enum('T','F') | NO   |     | F       |       |
| Percentage  | float(4,1)    | NO   |     | 0.0     |       |
+-------------+---------------+------+-----+---------+-------+
4 rows in set (0.00 sec)

mysql> select name,language from country join countrylanguage on (code=countrycode);
+---------------------------------------+---------------------------+
| name                                  | language                  |
+---------------------------------------+---------------------------+
| Aruba                                 | Dutch                     |
| Aruba                                 | English                   |
| Aruba                                 | Papiamento                |
| Aruba                                 | Spanish                   |
| Afghanistan                           | Balochi                   |
| Afghanistan                           | Dari                      |
| Afghanistan                           | Pashto                    |
| Afghanistan                           | Turkmenian                |
| Afghanistan                           | Uzbek                     |
| Angola                                | Ambo                      |
| Angola                                | Chokwe                    |
| Angola                                | Kongo                     |
| Angola                                | Luchazi                   |
| Angola                                | Luimbe-nganguela          |
| Angola                                | Luvale                    |
| Angola                                | Mbundu                    |
| Angola                                | Nyaneka-nkhumbi           |
| Angola                                | Ovimbundu                 |
| Anguilla                              | English                   |
| Albania                               | Albaniana                 |
| Albania                               | Greek                     |
| Albania                               | Macedonian                |
| Andorra                               | Catalan                   |
| Andorra                               | French                    |
| Andorra                               | Portuguese                |
| Andorra                               | Spanish                   |
| Netherlands Antilles                  | Dutch                     |
| Netherlands Antilles                  | English                   |
| Netherlands Antilles                  | Papiamento                |
| United Arab Emirates                  | Arabic                    |
| United Arab Emirates                  | Hindi                     |
| Argentina                             | Indian Languages          |
| Argentina                             | Italian                   |
| Argentina                             | Spanish                   |
| Armenia                               | Armenian                  |
| Armenia                               | Azerbaijani               |
| American Samoa                        | English                   |
| American Samoa                        | Samoan                    |
| American Samoa                        | Tongan                    |
| Antigua and Barbuda                   | Creole English            |
| Antigua and Barbuda                   | English                   |
| Australia                             | Arabic                    |
| Australia                             | Canton Chinese            |
| Australia                             | English                   |
| Australia                             | German                    |
| Australia                             | Greek                     |
| Australia                             | Italian                   |
| Australia                             | Serbo-Croatian            |
| Australia                             | Vietnamese                |
| Austria                               | Czech                     |
| Austria                               | German                    |
| Austria                               | Hungarian                 |
| Austria                               | Polish                    |
| Austria                               | Romanian                  |
| Austria                               | Serbo-Croatian            |
| Austria                               | Slovene                   |
| Austria                               | Turkish                   |
| Azerbaijan                            | Armenian                  |
| Azerbaijan                            | Azerbaijani               |
| Azerbaijan                            | Lezgian                   |
| Azerbaijan                            | Russian                   |
| Burundi                               | French                    |
| Burundi                               | Kirundi                   |
| Burundi                               | Swahili                   |
| Belgium                               | Arabic                    |
| Belgium                               | Dutch                     |
| Belgium                               | French                    |
| Belgium                               | German                    |
| Belgium                               | Italian                   |
| Belgium                               | Turkish                   |
| Benin                                 | Adja                      |
| Benin                                 | Aizo                      |
| Benin                                 | Bariba                    |
| Benin                                 | Fon                       |
| Benin                                 | Ful                       |
| Benin                                 | Joruba                    |
| Benin                                 | Somba                     |
| Burkina Faso                          | Busansi                   |
| Burkina Faso                          | Dagara                    |
| Burkina Faso                          | Dyula                     |
| Burkina Faso                          | Ful                       |
| Burkina Faso                          | Gurma                     |
| Burkina Faso                          | Mossi                     |
| Bangladesh                            | Bengali                   |
| Bangladesh                            | Chakma                    |
| Bangladesh                            | Garo                      |
| Bangladesh                            | Khasi                     |
| Bangladesh                            | Marma                     |
| Bangladesh                            | Santhali                  |
| Bangladesh                            | Tripuri                   |
| Bulgaria                              | Bulgariana                |
| Bulgaria                              | Macedonian                |
| Bulgaria                              | Romani                    |
| Bulgaria                              | Turkish                   |
| Bahrain                               | Arabic                    |
| Bahrain                               | English                   |
| Bahamas                               | Creole English            |
| Bahamas                               | Creole French             |
| Bosnia and Herzegovina                | Serbo-Croatian            |
| Belarus                               | Belorussian               |
| Belarus                               | Polish                    |
| Belarus                               | Russian                   |
| Belarus                               | Ukrainian                 |
| Belize                                | English                   |
| Belize                                | Garifuna                  |
| Belize                                | Maya Languages            |
| Belize                                | Spanish                   |
| Bermuda                               | English                   |
| Bolivia                               | Aimarï¿½                  |
| Bolivia                               | Guaranï¿½                 |
| Bolivia                               | Ketï¿½ua                  |
| Bolivia                               | Spanish                   |
| Brazil                                | German                    |
| Brazil                                | Indian Languages          |
| Brazil                                | Italian                   |
| Brazil                                | Japanese                  |
| Brazil                                | Portuguese                |
| Barbados                              | Bajan                     |
| Barbados                              | English                   |
| Brunei                                | Chinese                   |
| Brunei                                | English                   |
| Brunei                                | Malay                     |
| Brunei                                | Malay-English             |
| Bhutan                                | Asami                     |
| Bhutan                                | Dzongkha                  |
| Bhutan                                | Nepali                    |
| Botswana                              | Khoekhoe                  |
| Botswana                              | Ndebele                   |
| Botswana                              | San                       |
| Botswana                              | Shona                     |
| Botswana                              | Tswana                    |
| Central African Republic              | Banda                     |
| Central African Republic              | Gbaya                     |
| Central African Republic              | Mandjia                   |
| Central African Republic              | Mbum                      |
| Central African Republic              | Ngbaka                    |
| Central African Republic              | Sara                      |
| Canada                                | Chinese                   |
| Canada                                | Dutch                     |
| Canada                                | English                   |
| Canada                                | Eskimo Languages          |
| Canada                                | French                    |
| Canada                                | German                    |
| Canada                                | Italian                   |
| Canada                                | Polish                    |
| Canada                                | Portuguese                |
| Canada                                | Punjabi                   |
| Canada                                | Spanish                   |
| Canada                                | Ukrainian                 |
| Cocos (Keeling) Islands               | English                   |
| Cocos (Keeling) Islands               | Malay                     |
| Switzerland                           | French                    |
| Switzerland                           | German                    |
| Switzerland                           | Italian                   |
| Switzerland                           | Romansh                   |
| Chile                                 | Aimarï¿½                  |
| Chile                                 | Araucan                   |
| Chile                                 | Rapa nui                  |
| Chile                                 | Spanish                   |
| China                                 | Chinese                   |
| China                                 | Dong                      |
| China                                 | Hui                       |
| China                                 | Mantï¿½u                  |
| China                                 | Miao                      |
| China                                 | Mongolian                 |
| China                                 | Puyi                      |
| China                                 | Tibetan                   |
| China                                 | Tujia                     |
| China                                 | Uighur                    |
| China                                 | Yi                        |
| China                                 | Zhuang                    |
| Cï¿½te dï¿½Ivoire                     | Akan                      |
| Cï¿½te dï¿½Ivoire                     | Gur                       |
| Cï¿½te dï¿½Ivoire                     | Kru                       |
| Cï¿½te dï¿½Ivoire                     | Malinke                   |
| Cï¿½te dï¿½Ivoire                     | [South]Mande              |
| Cameroon                              | Bamileke-bamum            |
| Cameroon                              | Duala                     |
| Cameroon                              | Fang                      |
| Cameroon                              | Ful                       |
| Cameroon                              | Maka                      |
| Cameroon                              | Mandara                   |
| Cameroon                              | Masana                    |
| Cameroon                              | Tikar                     |
| Congo, The Democratic Republic of the | Boa                       |
| Congo, The Democratic Republic of the | Chokwe                    |
| Congo, The Democratic Republic of the | Kongo                     |
| Congo, The Democratic Republic of the | Luba                      |
| Congo, The Democratic Republic of the | Mongo                     |
| Congo, The Democratic Republic of the | Ngala and Bangi           |
| Congo, The Democratic Republic of the | Rundi                     |
| Congo, The Democratic Republic of the | Rwanda                    |
| Congo, The Democratic Republic of the | Teke                      |
| Congo, The Democratic Republic of the | Zande                     |
| Congo                                 | Kongo                     |
| Congo                                 | Mbete                     |
| Congo                                 | Mboshi                    |
| Congo                                 | Punu                      |
| Congo                                 | Sango                     |
| Congo                                 | Teke                      |
| Cook Islands                          | English                   |
| Cook Islands                          | Maori                     |
| Colombia                              | Arawakan                  |
| Colombia                              | Caribbean                 |
| Colombia                              | Chibcha                   |
| Colombia                              | Creole English            |
| Colombia                              | Spanish                   |
| Comoros                               | Comorian                  |
| Comoros                               | Comorian-Arabic           |
| Comoros                               | Comorian-French           |
| Comoros                               | Comorian-madagassi        |
| Comoros                               | Comorian-Swahili          |
| Cape Verde                            | Crioulo                   |
| Cape Verde                            | Portuguese                |
| Costa Rica                            | Chibcha                   |
| Costa Rica                            | Chinese                   |
| Costa Rica                            | Creole English            |
| Costa Rica                            | Spanish                   |
| Cuba                                  | Spanish                   |
| Christmas Island                      | Chinese                   |
| Christmas Island                      | English                   |
| Cayman Islands                        | English                   |
| Cyprus                                | Greek                     |
| Cyprus                                | Turkish                   |
| Czech Republic                        | Czech                     |
| Czech Republic                        | German                    |
| Czech Republic                        | Hungarian                 |
| Czech Republic                        | Moravian                  |
| Czech Republic                        | Polish                    |
| Czech Republic                        | Romani                    |
| Czech Republic                        | Silesiana                 |
| Czech Republic                        | Slovak                    |
| Germany                               | German                    |
| Germany                               | Greek                     |
| Germany                               | Italian                   |
| Germany                               | Polish                    |
| Germany                               | Southern Slavic Languages |
| Germany                               | Turkish                   |
| Djibouti                              | Afar                      |
| Djibouti                              | Arabic                    |
| Djibouti                              | Somali                    |
| Dominica                              | Creole English            |
| Dominica                              | Creole French             |
| Denmark                               | Arabic                    |
| Denmark                               | Danish                    |
| Denmark                               | English                   |
| Denmark                               | German                    |
| Denmark                               | Norwegian                 |
| Denmark                               | Swedish                   |
| Denmark                               | Turkish                   |
| Dominican Republic                    | Creole French             |
| Dominican Republic                    | Spanish                   |
| Algeria                               | Arabic                    |
| Algeria                               | Berberi                   |
| Ecuador                               | Ketï¿½ua                  |
| Ecuador                               | Spanish                   |
| Egypt                                 | Arabic                    |
| Egypt                                 | Sinaberberi               |
| Eritrea                               | Afar                      |
| Eritrea                               | Bilin                     |
| Eritrea                               | Hadareb                   |
| Eritrea                               | Saho                      |
| Eritrea                               | Tigre                     |
| Eritrea                               | Tigrinja                  |
| Western Sahara                        | Arabic                    |
| Spain                                 | Basque                    |
| Spain                                 | Catalan                   |
| Spain                                 | Galecian                  |
| Spain                                 | Spanish                   |
| Estonia                               | Belorussian               |
| Estonia                               | Estonian                  |
| Estonia                               | Finnish                   |
| Estonia                               | Russian                   |
| Estonia                               | Ukrainian                 |
| Ethiopia                              | Amhara                    |
| Ethiopia                              | Gurage                    |
| Ethiopia                              | Oromo                     |
| Ethiopia                              | Sidamo                    |
| Ethiopia                              | Somali                    |
| Ethiopia                              | Tigrinja                  |
| Ethiopia                              | Walaita                   |
| Finland                               | Estonian                  |
| Finland                               | Finnish                   |
| Finland                               | Russian                   |
| Finland                               | Saame                     |
| Finland                               | Swedish                   |
| Fiji Islands                          | Fijian                    |
| Fiji Islands                          | Hindi                     |
| Falkland Islands                      | English                   |
| France                                | Arabic                    |
| France                                | French                    |
| France                                | Italian                   |
| France                                | Portuguese                |
| France                                | Spanish                   |
| France                                | Turkish                   |
| Faroe Islands                         | Danish                    |
| Faroe Islands                         | Faroese                   |
| Micronesia, Federated States of       | Kosrean                   |
| Micronesia, Federated States of       | Mortlock                  |
| Micronesia, Federated States of       | Pohnpei                   |
| Micronesia, Federated States of       | Trukese                   |
| Micronesia, Federated States of       | Wolea                     |
| Micronesia, Federated States of       | Yap                       |
| Gabon                                 | Fang                      |
| Gabon                                 | Mbete                     |
| Gabon                                 | Mpongwe                   |
| Gabon                                 | Punu-sira-nzebi           |
| United Kingdom                        | English                   |
| United Kingdom                        | Gaeli                     |
| United Kingdom                        | Kymri                     |
| Georgia                               | Abhyasi                   |
| Georgia                               | Armenian                  |
| Georgia                               | Azerbaijani               |
| Georgia                               | Georgiana                 |
| Georgia                               | Osseetti                  |
| Georgia                               | Russian                   |
| Ghana                                 | Akan                      |
| Ghana                                 | Ewe                       |
| Ghana                                 | Ga-adangme                |
| Ghana                                 | Gurma                     |
| Ghana                                 | Joruba                    |
| Ghana                                 | Mossi                     |
| Gibraltar                             | Arabic                    |
| Gibraltar                             | English                   |
| Guinea                                | Ful                       |
| Guinea                                | Kissi                     |
| Guinea                                | Kpelle                    |
| Guinea                                | Loma                      |
| Guinea                                | Malinke                   |
| Guinea                                | Susu                      |
| Guinea                                | Yalunka                   |
| Guadeloupe                            | Creole French             |
| Guadeloupe                            | French                    |
| Gambia                                | Diola                     |
| Gambia                                | Ful                       |
| Gambia                                | Malinke                   |
| Gambia                                | Soninke                   |
| Gambia                                | Wolof                     |
| Guinea-Bissau                         | Balante                   |
| Guinea-Bissau                         | Crioulo                   |
| Guinea-Bissau                         | Ful                       |
| Guinea-Bissau                         | Malinke                   |
| Guinea-Bissau                         | Mandyako                  |
| Guinea-Bissau                         | Portuguese                |
| Equatorial Guinea                     | Bubi                      |
| Equatorial Guinea                     | Fang                      |
| Greece                                | Greek                     |
| Greece                                | Turkish                   |
| Grenada                               | Creole English            |
| Greenland                             | Danish                    |
| Greenland                             | Greenlandic               |
| Guatemala                             | Cakchiquel                |
| Guatemala                             | Kekchï¿½                  |
| Guatemala                             | Mam                       |
| Guatemala                             | Quichï¿½                  |
| Guatemala                             | Spanish                   |
| French Guiana                         | Creole French             |
| French Guiana                         | Indian Languages          |
| Guam                                  | Chamorro                  |
| Guam                                  | English                   |
| Guam                                  | Japanese                  |
| Guam                                  | Korean                    |
| Guam                                  | Philippene Languages      |
| Guyana                                | Arawakan                  |
| Guyana                                | Caribbean                 |
| Guyana                                | Creole English            |
| Hong Kong                             | Canton Chinese            |
| Hong Kong                             | Chiu chau                 |
| Hong Kong                             | English                   |
| Hong Kong                             | Fukien                    |
| Hong Kong                             | Hakka                     |
| Honduras                              | Creole English            |
| Honduras                              | Garifuna                  |
| Honduras                              | Miskito                   |
| Honduras                              | Spanish                   |
| Croatia                               | Serbo-Croatian            |
| Croatia                               | Slovene                   |
| Haiti                                 | French                    |
| Haiti                                 | Haiti Creole              |
| Hungary                               | German                    |
| Hungary                               | Hungarian                 |
| Hungary                               | Romani                    |
| Hungary                               | Romanian                  |
| Hungary                               | Serbo-Croatian            |
| Hungary                               | Slovak                    |
| Indonesia                             | Bali                      |
| Indonesia                             | Banja                     |
| Indonesia                             | Batakki                   |
| Indonesia                             | Bugi                      |
| Indonesia                             | Javanese                  |
| Indonesia                             | Madura                    |
| Indonesia                             | Malay                     |
| Indonesia                             | Minangkabau               |
| Indonesia                             | Sunda                     |
| India                                 | Asami                     |
| India                                 | Bengali                   |
| India                                 | Gujarati                  |
| India                                 | Hindi                     |
| India                                 | Kannada                   |
| India                                 | Malajalam                 |
| India                                 | Marathi                   |
| India                                 | Orija                     |
| India                                 | Punjabi                   |
| India                                 | Tamil                     |
| India                                 | Telugu                    |
| India                                 | Urdu                      |
| Ireland                               | English                   |
| Ireland                               | Irish                     |
| Iran                                  | Arabic                    |
| Iran                                  | Azerbaijani               |
| Iran                                  | Bakhtyari                 |
| Iran                                  | Balochi                   |
| Iran                                  | Gilaki                    |
| Iran                                  | Kurdish                   |
| Iran                                  | Luri                      |
| Iran                                  | Mazandarani               |
| Iran                                  | Persian                   |
| Iran                                  | Turkmenian                |
| Iraq                                  | Arabic                    |
| Iraq                                  | Assyrian                  |
| Iraq                                  | Azerbaijani               |
| Iraq                                  | Kurdish                   |
| Iraq                                  | Persian                   |
| Iceland                               | English                   |
| Iceland                               | Icelandic                 |
| Israel                                | Arabic                    |
| Israel                                | Hebrew                    |
| Israel                                | Russian                   |
| Italy                                 | Albaniana                 |
| Italy                                 | French                    |
| Italy                                 | Friuli                    |
| Italy                                 | German                    |
| Italy                                 | Italian                   |
| Italy                                 | Romani                    |
| Italy                                 | Sardinian                 |
| Italy                                 | Slovene                   |
| Jamaica                               | Creole English            |
| Jamaica                               | Hindi                     |
| Jordan                                | Arabic                    |
| Jordan                                | Armenian                  |
| Jordan                                | Circassian                |
| Japan                                 | Ainu                      |
| Japan                                 | Chinese                   |
| Japan                                 | English                   |
| Japan                                 | Japanese                  |
| Japan                                 | Korean                    |
| Japan                                 | Philippene Languages      |
| Kazakstan                             | German                    |
| Kazakstan                             | Kazakh                    |
| Kazakstan                             | Russian                   |
| Kazakstan                             | Tatar                     |
| Kazakstan                             | Ukrainian                 |
| Kazakstan                             | Uzbek                     |
| Kenya                                 | Gusii                     |
| Kenya                                 | Kalenjin                  |
| Kenya                                 | Kamba                     |
| Kenya                                 | Kikuyu                    |
| Kenya                                 | Luhya                     |
| Kenya                                 | Luo                       |
| Kenya                                 | Masai                     |
| Kenya                                 | Meru                      |
| Kenya                                 | Nyika                     |
| Kenya                                 | Turkana                   |
| Kyrgyzstan                            | Kazakh                    |
| Kyrgyzstan                            | Kirgiz                    |
| Kyrgyzstan                            | Russian                   |
| Kyrgyzstan                            | Tadzhik                   |
| Kyrgyzstan                            | Tatar                     |
| Kyrgyzstan                            | Ukrainian                 |
| Kyrgyzstan                            | Uzbek                     |
| Cambodia                              | Chinese                   |
| Cambodia                              | Khmer                     |
| Cambodia                              | Tï¿½am                    |
| Cambodia                              | Vietnamese                |
| Kiribati                              | Kiribati                  |
| Kiribati                              | Tuvalu                    |
| Saint Kitts and Nevis                 | Creole English            |
| Saint Kitts and Nevis                 | English                   |
| South Korea                           | Chinese                   |
| South Korea                           | Korean                    |
| Kuwait                                | Arabic                    |
| Kuwait                                | English                   |
| Laos                                  | Lao                       |
| Laos                                  | Lao-Soung                 |
| Laos                                  | Mon-khmer                 |
| Laos                                  | Thai                      |
| Lebanon                               | Arabic                    |
| Lebanon                               | Armenian                  |
| Lebanon                               | French                    |
| Liberia                               | Bassa                     |
| Liberia                               | Gio                       |
| Liberia                               | Grebo                     |
| Liberia                               | Kpelle                    |
| Liberia                               | Kru                       |
| Liberia                               | Loma                      |
| Liberia                               | Malinke                   |
| Liberia                               | Mano                      |
| Libyan Arab Jamahiriya                | Arabic                    |
| Libyan Arab Jamahiriya                | Berberi                   |
| Saint Lucia                           | Creole French             |
| Saint Lucia                           | English                   |
| Liechtenstein                         | German                    |
| Liechtenstein                         | Italian                   |
| Liechtenstein                         | Turkish                   |
| Sri Lanka                             | Mixed Languages           |
| Sri Lanka                             | Singali                   |
| Sri Lanka                             | Tamil                     |
| Lesotho                               | English                   |
| Lesotho                               | Sotho                     |
| Lesotho                               | Zulu                      |
| Lithuania                             | Belorussian               |
| Lithuania                             | Lithuanian                |
| Lithuania                             | Polish                    |
| Lithuania                             | Russian                   |
| Lithuania                             | Ukrainian                 |
| Luxembourg                            | French                    |
| Luxembourg                            | German                    |
| Luxembourg                            | Italian                   |
| Luxembourg                            | Luxembourgish             |
| Luxembourg                            | Portuguese                |
| Latvia                                | Belorussian               |
| Latvia                                | Latvian                   |
| Latvia                                | Lithuanian                |
| Latvia                                | Polish                    |
| Latvia                                | Russian                   |
| Latvia                                | Ukrainian                 |
| Macao                                 | Canton Chinese            |
| Macao                                 | English                   |
| Macao                                 | Mandarin Chinese          |
| Macao                                 | Portuguese                |
| Morocco                               | Arabic                    |
| Morocco                               | Berberi                   |
| Monaco                                | English                   |
| Monaco                                | French                    |
| Monaco                                | Italian                   |
| Monaco                                | Monegasque                |
| Moldova                               | Bulgariana                |
| Moldova                               | Gagauzi                   |
| Moldova                               | Romanian                  |
| Moldova                               | Russian                   |
| Moldova                               | Ukrainian                 |
| Madagascar                            | French                    |
| Madagascar                            | Malagasy                  |
| Maldives                              | Dhivehi                   |
| Maldives                              | English                   |
| Mexico                                | Mixtec                    |
| Mexico                                | Nï¿½huatl                 |
| Mexico                                | Otomï¿½                   |
| Mexico                                | Spanish                   |
| Mexico                                | Yucatec                   |
| Mexico                                | Zapotec                   |
| Marshall Islands                      | English                   |
| Marshall Islands                      | Marshallese               |
| Macedonia                             | Albaniana                 |
| Macedonia                             | Macedonian                |
| Macedonia                             | Romani                    |
| Macedonia                             | Serbo-Croatian            |
| Macedonia                             | Turkish                   |
| Mali                                  | Bambara                   |
| Mali                                  | Ful                       |
| Mali                                  | Senufo and Minianka       |
| Mali                                  | Songhai                   |
| Mali                                  | Soninke                   |
| Mali                                  | Tamashek                  |
| Malta                                 | English                   |
| Malta                                 | Maltese                   |
| Myanmar                               | Burmese                   |
| Myanmar                               | Chin                      |
| Myanmar                               | Kachin                    |
| Myanmar                               | Karen                     |
| Myanmar                               | Kayah                     |
| Myanmar                               | Mon                       |
| Myanmar                               | Rakhine                   |
| Myanmar                               | Shan                      |
| Mongolia                              | Bajad                     |
| Mongolia                              | Buryat                    |
| Mongolia                              | Dariganga                 |
| Mongolia                              | Dorbet                    |
| Mongolia                              | Kazakh                    |
| Mongolia                              | Mongolian                 |
| Northern Mariana Islands              | Carolinian                |
| Northern Mariana Islands              | Chamorro                  |
| Northern Mariana Islands              | Chinese                   |
| Northern Mariana Islands              | English                   |
| Northern Mariana Islands              | Korean                    |
| Northern Mariana Islands              | Philippene Languages      |
| Mozambique                            | Chuabo                    |
| Mozambique                            | Lomwe                     |
| Mozambique                            | Makua                     |
| Mozambique                            | Marendje                  |
| Mozambique                            | Nyanja                    |
| Mozambique                            | Ronga                     |
| Mozambique                            | Sena                      |
| Mozambique                            | Shona                     |
| Mozambique                            | Tsonga                    |
| Mozambique                            | Tswa                      |
| Mauritania                            | Ful                       |
| Mauritania                            | Hassaniya                 |
| Mauritania                            | Soninke                   |
| Mauritania                            | Tukulor                   |
| Mauritania                            | Wolof                     |
| Mauritania                            | Zenaga                    |
| Montserrat                            | English                   |
| Martinique                            | Creole French             |
| Martinique                            | French                    |
| Mauritius                             | Bhojpuri                  |
| Mauritius                             | Creole French             |
| Mauritius                             | French                    |
| Mauritius                             | Hindi                     |
| Mauritius                             | Marathi                   |
| Mauritius                             | Tamil                     |
| Malawi                                | Chichewa                  |
| Malawi                                | Lomwe                     |
| Malawi                                | Ngoni                     |
| Malawi                                | Yao                       |
| Malaysia                              | Chinese                   |
| Malaysia                              | Dusun                     |
| Malaysia                              | English                   |
| Malaysia                              | Iban                      |
| Malaysia                              | Malay                     |
| Malaysia                              | Tamil                     |
| Mayotte                               | French                    |
| Mayotte                               | Mahorï¿½                  |
| Mayotte                               | Malagasy                  |
| Namibia                               | Afrikaans                 |
| Namibia                               | Caprivi                   |
| Namibia                               | German                    |
| Namibia                               | Herero                    |
| Namibia                               | Kavango                   |
| Namibia                               | Nama                      |
| Namibia                               | Ovambo                    |
| Namibia                               | San                       |
| New Caledonia                         | French                    |
| New Caledonia                         | Malenasian Languages      |
| New Caledonia                         | Polynesian Languages      |
| Niger                                 | Ful                       |
| Niger                                 | Hausa                     |
| Niger                                 | Kanuri                    |
| Niger                                 | Songhai-zerma             |
| Niger                                 | Tamashek                  |
| Norfolk Island                        | English                   |
| Nigeria                               | Bura                      |
| Nigeria                               | Edo                       |
| Nigeria                               | Ful                       |
| Nigeria                               | Hausa                     |
| Nigeria                               | Ibibio                    |
| Nigeria                               | Ibo                       |
| Nigeria                               | Ijo                       |
| Nigeria                               | Joruba                    |
| Nigeria                               | Kanuri                    |
| Nigeria                               | Tiv                       |
| Nicaragua                             | Creole English            |
| Nicaragua                             | Miskito                   |
| Nicaragua                             | Spanish                   |
| Nicaragua                             | Sumo                      |
| Niue                                  | English                   |
| Niue                                  | Niue                      |
| Netherlands                           | Arabic                    |
| Netherlands                           | Dutch                     |
| Netherlands                           | Fries                     |
| Netherlands                           | Turkish                   |
| Norway                                | Danish                    |
| Norway                                | English                   |
| Norway                                | Norwegian                 |
| Norway                                | Saame                     |
| Norway                                | Swedish                   |
| Nepal                                 | Bhojpuri                  |
| Nepal                                 | Hindi                     |
| Nepal                                 | Maithili                  |
| Nepal                                 | Nepali                    |
| Nepal                                 | Newari                    |
| Nepal                                 | Tamang                    |
| Nepal                                 | Tharu                     |
| Nauru                                 | Chinese                   |
| Nauru                                 | English                   |
| Nauru                                 | Kiribati                  |
| Nauru                                 | Nauru                     |
| Nauru                                 | Tuvalu                    |
| New Zealand                           | English                   |
| New Zealand                           | Maori                     |
| Oman                                  | Arabic                    |
| Oman                                  | Balochi                   |
| Pakistan                              | Balochi                   |
| Pakistan                              | Brahui                    |
| Pakistan                              | Hindko                    |
| Pakistan                              | Pashto                    |
| Pakistan                              | Punjabi                   |
| Pakistan                              | Saraiki                   |
| Pakistan                              | Sindhi                    |
| Pakistan                              | Urdu                      |
| Panama                                | Arabic                    |
| Panama                                | Creole English            |
| Panama                                | Cuna                      |
| Panama                                | Embera                    |
| Panama                                | Guaymï¿½                  |
| Panama                                | Spanish                   |
| Pitcairn                              | Pitcairnese               |
| Peru                                  | Aimarï¿½                  |
| Peru                                  | Ketï¿½ua                  |
| Peru                                  | Spanish                   |
| Philippines                           | Bicol                     |
| Philippines                           | Cebuano                   |
| Philippines                           | Hiligaynon                |
| Philippines                           | Ilocano                   |
| Philippines                           | Maguindanao               |
| Philippines                           | Maranao                   |
| Philippines                           | Pampango                  |
| Philippines                           | Pangasinan                |
| Philippines                           | Pilipino                  |
| Philippines                           | Waray-waray               |
| Palau                                 | Chinese                   |
| Palau                                 | English                   |
| Palau                                 | Palau                     |
| Palau                                 | Philippene Languages      |
| Papua New Guinea                      | Malenasian Languages      |
| Papua New Guinea                      | Papuan Languages          |
| Poland                                | Belorussian               |
| Poland                                | German                    |
| Poland                                | Polish                    |
| Poland                                | Ukrainian                 |
| Puerto Rico                           | English                   |
| Puerto Rico                           | Spanish                   |
| North Korea                           | Chinese                   |
| North Korea                           | Korean                    |
| Portugal                              | Portuguese                |
| Paraguay                              | German                    |
| Paraguay                              | Guaranï¿½                 |
| Paraguay                              | Portuguese                |
| Paraguay                              | Spanish                   |
| Palestine                             | Arabic                    |
| Palestine                             | Hebrew                    |
| French Polynesia                      | Chinese                   |
| French Polynesia                      | French                    |
| French Polynesia                      | Tahitian                  |
| Qatar                                 | Arabic                    |
| Qatar                                 | Urdu                      |
| Rï¿½union                             | Chinese                   |
| Rï¿½union                             | Comorian                  |
| Rï¿½union                             | Creole French             |
| Rï¿½union                             | Malagasy                  |
| Rï¿½union                             | Tamil                     |
| Romania                               | German                    |
| Romania                               | Hungarian                 |
| Romania                               | Romani                    |
| Romania                               | Romanian                  |
| Romania                               | Serbo-Croatian            |
| Romania                               | Ukrainian                 |
| Russian Federation                    | Avarian                   |
| Russian Federation                    | Bashkir                   |
| Russian Federation                    | Belorussian               |
| Russian Federation                    | Chechen                   |
| Russian Federation                    | Chuvash                   |
| Russian Federation                    | Kazakh                    |
| Russian Federation                    | Mari                      |
| Russian Federation                    | Mordva                    |
| Russian Federation                    | Russian                   |
| Russian Federation                    | Tatar                     |
| Russian Federation                    | Udmur                     |
| Russian Federation                    | Ukrainian                 |
| Rwanda                                | French                    |
| Rwanda                                | Rwanda                    |
| Saudi Arabia                          | Arabic                    |
| Sudan                                 | Arabic                    |
| Sudan                                 | Bari                      |
| Sudan                                 | Beja                      |
| Sudan                                 | Chilluk                   |
| Sudan                                 | Dinka                     |
| Sudan                                 | Fur                       |
| Sudan                                 | Lotuko                    |
| Sudan                                 | Nubian Languages          |
| Sudan                                 | Nuer                      |
| Sudan                                 | Zande                     |
| Senegal                               | Diola                     |
| Senegal                               | Ful                       |
| Senegal                               | Malinke                   |
| Senegal                               | Serer                     |
| Senegal                               | Soninke                   |
| Senegal                               | Wolof                     |
| Singapore                             | Chinese                   |
| Singapore                             | Malay                     |
| Singapore                             | Tamil                     |
| Saint Helena                          | English                   |
| Svalbard and Jan Mayen                | Norwegian                 |
| Svalbard and Jan Mayen                | Russian                   |
| Solomon Islands                       | Malenasian Languages      |
| Solomon Islands                       | Papuan Languages          |
| Solomon Islands                       | Polynesian Languages      |
| Sierra Leone                          | Bullom-sherbro            |
| Sierra Leone                          | Ful                       |
| Sierra Leone                          | Kono-vai                  |
| Sierra Leone                          | Kuranko                   |
| Sierra Leone                          | Limba                     |
| Sierra Leone                          | Mende                     |
| Sierra Leone                          | Temne                     |
| Sierra Leone                          | Yalunka                   |
| El Salvador                           | Nahua                     |
| El Salvador                           | Spanish                   |
| San Marino                            | Italian                   |
| Somalia                               | Arabic                    |
| Somalia                               | Somali                    |
| Saint Pierre and Miquelon             | French                    |
| Sao Tome and Principe                 | Crioulo                   |
| Sao Tome and Principe                 | French                    |
| Suriname                              | Hindi                     |
| Suriname                              | Sranantonga               |
| Slovakia                              | Czech and Moravian        |
| Slovakia                              | Hungarian                 |
| Slovakia                              | Romani                    |
| Slovakia                              | Slovak                    |
| Slovakia                              | Ukrainian and Russian     |
| Slovenia                              | Hungarian                 |
| Slovenia                              | Serbo-Croatian            |
| Slovenia                              | Slovene                   |
| Sweden                                | Arabic                    |
| Sweden                                | Finnish                   |
| Sweden                                | Norwegian                 |
| Sweden                                | Southern Slavic Languages |
| Sweden                                | Spanish                   |
| Sweden                                | Swedish                   |
| Swaziland                             | Swazi                     |
| Swaziland                             | Zulu                      |
| Seychelles                            | English                   |
| Seychelles                            | French                    |
| Seychelles                            | Seselwa                   |
| Syria                                 | Arabic                    |
| Syria                                 | Kurdish                   |
| Turks and Caicos Islands              | English                   |
| Chad                                  | Arabic                    |
| Chad                                  | Gorane                    |
| Chad                                  | Hadjarai                  |
| Chad                                  | Kanem-bornu               |
| Chad                                  | Mayo-kebbi                |
| Chad                                  | Ouaddai                   |
| Chad                                  | Sara                      |
| Chad                                  | Tandjile                  |
| Togo                                  | Ane                       |
| Togo                                  | Ewe                       |
| Togo                                  | Gurma                     |
| Togo                                  | Kabyï¿½                   |
| Togo                                  | Kotokoli                  |
| Togo                                  | Moba                      |
| Togo                                  | Naudemba                  |
| Togo                                  | Watyi                     |
| Thailand                              | Chinese                   |
| Thailand                              | Khmer                     |
| Thailand                              | Kuy                       |
| Thailand                              | Lao                       |
| Thailand                              | Malay                     |
| Thailand                              | Thai                      |
| Tajikistan                            | Russian                   |
| Tajikistan                            | Tadzhik                   |
| Tajikistan                            | Uzbek                     |
| Tokelau                               | English                   |
| Tokelau                               | Tokelau                   |
| Turkmenistan                          | Kazakh                    |
| Turkmenistan                          | Russian                   |
| Turkmenistan                          | Turkmenian                |
| Turkmenistan                          | Uzbek                     |
| East Timor                            | Portuguese                |
| East Timor                            | Sunda                     |
| Tonga                                 | English                   |
| Tonga                                 | Tongan                    |
| Trinidad and Tobago                   | Creole English            |
| Trinidad and Tobago                   | English                   |
| Trinidad and Tobago                   | Hindi                     |
| Tunisia                               | Arabic                    |
| Tunisia                               | Arabic-French             |
| Tunisia                               | Arabic-French-English     |
| Turkey                                | Arabic                    |
| Turkey                                | Kurdish                   |
| Turkey                                | Turkish                   |
| Tuvalu                                | English                   |
| Tuvalu                                | Kiribati                  |
| Tuvalu                                | Tuvalu                    |
| Taiwan                                | Ami                       |
| Taiwan                                | Atayal                    |
| Taiwan                                | Hakka                     |
| Taiwan                                | Mandarin Chinese          |
| Taiwan                                | Min                       |
| Taiwan                                | Paiwan                    |
| Tanzania                              | Chaga and Pare            |
| Tanzania                              | Gogo                      |
| Tanzania                              | Ha                        |
| Tanzania                              | Haya                      |
| Tanzania                              | Hehet                     |
| Tanzania                              | Luguru                    |
| Tanzania                              | Makonde                   |
| Tanzania                              | Nyakusa                   |
| Tanzania                              | Nyamwesi                  |
| Tanzania                              | Shambala                  |
| Tanzania                              | Swahili                   |
| Uganda                                | Acholi                    |
| Uganda                                | Ganda                     |
| Uganda                                | Gisu                      |
| Uganda                                | Kiga                      |
| Uganda                                | Lango                     |
| Uganda                                | Lugbara                   |
| Uganda                                | Nkole                     |
| Uganda                                | Rwanda                    |
| Uganda                                | Soga                      |
| Uganda                                | Teso                      |
| Ukraine                               | Belorussian               |
| Ukraine                               | Bulgariana                |
| Ukraine                               | Hungarian                 |
| Ukraine                               | Polish                    |
| Ukraine                               | Romanian                  |
| Ukraine                               | Russian                   |
| Ukraine                               | Ukrainian                 |
| United States Minor Outlying Islands  | English                   |
| Uruguay                               | Spanish                   |
| United States                         | Chinese                   |
| United States                         | English                   |
| United States                         | French                    |
| United States                         | German                    |
| United States                         | Italian                   |
| United States                         | Japanese                  |
| United States                         | Korean                    |
| United States                         | Polish                    |
| United States                         | Portuguese                |
| United States                         | Spanish                   |
| United States                         | Tagalog                   |
| United States                         | Vietnamese                |
| Uzbekistan                            | Karakalpak                |
| Uzbekistan                            | Kazakh                    |
| Uzbekistan                            | Russian                   |
| Uzbekistan                            | Tadzhik                   |
| Uzbekistan                            | Tatar                     |
| Uzbekistan                            | Uzbek                     |
| Holy See (Vatican City State)         | Italian                   |
| Saint Vincent and the Grenadines      | Creole English            |
| Saint Vincent and the Grenadines      | English                   |
| Venezuela                             | Goajiro                   |
| Venezuela                             | Spanish                   |
| Venezuela                             | Warrau                    |
| Virgin Islands, British               | English                   |
| Virgin Islands, U.S.                  | English                   |
| Virgin Islands, U.S.                  | French                    |
| Virgin Islands, U.S.                  | Spanish                   |
| Vietnam                               | Chinese                   |
| Vietnam                               | Khmer                     |
| Vietnam                               | Man                       |
| Vietnam                               | Miao                      |
| Vietnam                               | Muong                     |
| Vietnam                               | Nung                      |
| Vietnam                               | Thai                      |
| Vietnam                               | Tho                       |
| Vietnam                               | Vietnamese                |
| Vanuatu                               | Bislama                   |
| Vanuatu                               | English                   |
| Vanuatu                               | French                    |
| Wallis and Futuna                     | Futuna                    |
| Wallis and Futuna                     | Wallis                    |
| Samoa                                 | English                   |
| Samoa                                 | Samoan                    |
| Samoa                                 | Samoan-English            |
| Yemen                                 | Arabic                    |
| Yemen                                 | Soqutri                   |
| Yugoslavia                            | Albaniana                 |
| Yugoslavia                            | Hungarian                 |
| Yugoslavia                            | Macedonian                |
| Yugoslavia                            | Romani                    |
| Yugoslavia                            | Serbo-Croatian            |
| Yugoslavia                            | Slovak                    |
| South Africa                          | Afrikaans                 |
| South Africa                          | English                   |
| South Africa                          | Ndebele                   |
| South Africa                          | Northsotho                |
| South Africa                          | Southsotho                |
| South Africa                          | Swazi                     |
| South Africa                          | Tsonga                    |
| South Africa                          | Tswana                    |
| South Africa                          | Venda                     |
| South Africa                          | Xhosa                     |
| South Africa                          | Zulu                      |
| Zambia                                | Bemba                     |
| Zambia                                | Chewa                     |
| Zambia                                | Lozi                      |
| Zambia                                | Nsenga                    |
| Zambia                                | Nyanja                    |
| Zambia                                | Tongan                    |
| Zimbabwe                              | English                   |
| Zimbabwe                              | Ndebele                   |
| Zimbabwe                              | Nyanja                    |
| Zimbabwe                              | Shona                     |
+---------------------------------------+---------------------------+
984 rows in set (0.01 sec)

mysql> select name,language from country join countrylanguage on (code=countrycode) where name ='india';
+-------+-----------+
| name  | language  |
+-------+-----------+
| India | Asami     |
| India | Bengali   |
| India | Gujarati  |
| India | Hindi     |
| India | Kannada   |
| India | Malajalam |
| India | Marathi   |
| India | Orija     |
| India | Punjabi   |
| India | Tamil     |
| India | Telugu    |
| India | Urdu      |
+-------+-----------+
12 rows in set (0.00 sec)

mysql> show tables;
+-----------------+
| Tables_in_world |
+-----------------+
| city            |
| country         |
| countrylanguage |
+-----------------+
3 rows in set (0.00 sec)

mysql> desc country;
+----------------+---------------------------------------------------------------------------------------+------+-----+---------+-------+
| Field          | Type                                                                                  | Null | Key | Default | Extra |
+----------------+---------------------------------------------------------------------------------------+------+-----+---------+-------+
| Code           | char(3)                                                                               | NO   | PRI |         |       |
| Name           | char(52)                                                                              | NO   |     |         |       |
| Continent      | enum('Asia','Europe','North America','Africa','Oceania','Antarctica','South America') | NO   |     | Asia    |       |
| Region         | char(26)                                                                              | NO   |     |         |       |
| SurfaceArea    | float(10,2)                                                                           | NO   |     | 0.00    |       |
| IndepYear      | smallint                                                                              | YES  |     | NULL    |       |
| Population     | int                                                                                   | NO   |     | 0       |       |
| LifeExpectancy | float(3,1)                                                                            | YES  |     | NULL    |       |
| GNP            | float(10,2)                                                                           | YES  |     | NULL    |       |
| GNPOld         | float(10,2)                                                                           | YES  |     | NULL    |       |
| LocalName      | char(45)                                                                              | NO   |     |         |       |
| GovernmentForm | char(45)                                                                              | NO   |     |         |       |
| HeadOfState    | char(60)                                                                              | YES  |     | NULL    |       |
| Capital        | int                                                                                   | YES  |     | NULL    |       |
| Code2          | char(2)                                                                               | NO   |     |         |       |
+----------------+---------------------------------------------------------------------------------------+------+-----+---------+-------+
15 rows in set (0.00 sec)

mysql> desc city;
+-------------+----------+------+-----+---------+----------------+
| Field       | Type     | Null | Key | Default | Extra          |
+-------------+----------+------+-----+---------+----------------+
| ID          | int      | NO   | PRI | NULL    | auto_increment |
| Name        | char(35) | NO   |     |         |                |
| CountryCode | char(3)  | NO   | MUL |         |                |
| District    | char(20) | NO   |     |         |                |
| Population  | int      | NO   |     | 0       |                |
+-------------+----------+------+-----+---------+----------------+
5 rows in set (0.00 sec)

mysql> desc countrylanguage;
+-------------+---------------+------+-----+---------+-------+
| Field       | Type          | Null | Key | Default | Extra |
+-------------+---------------+------+-----+---------+-------+
| CountryCode | char(3)       | NO   | PRI |         |       |
| Language    | char(30)      | NO   | PRI |         |       |
| IsOfficial  | enum('T','F') | NO   |     | F       |       |
| Percentage  | float(4,1)    | NO   |     | 0.0     |       |
+-------------+---------------+------+-----+---------+-------+
4 rows in set (0.00 sec)

mysql> select ci.name as city_name,co.name country_name,language
    -> from country co join countrylanguage on (co.code=countrycode)
    -> use scott;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'use scott' at line 3
mysql>
mysql>
mysql>
mysql>
mysql> show tables;
+-----------------+
| Tables_in_world |
+-----------------+
| city            |
| country         |
| countrylanguage |
+-----------------+
3 rows in set (0.00 sec)

mysql> select ci.name as city_name,co.name country_name,language
    ->  from country co join countrylanguage cl on (co.code=cl.countrycode)
    -> join city ci on (ci.countrycode=cl.countrycode) where name ='india';
ERROR 1052 (23000): Column 'name' in where clause is ambiguous
mysql>
mysql>
mysql>
mysql> select ci.name as city_name,co.name country_name,language
    ->  from country co join countrylanguage cl on (co.code=cl.countrycode)
    -> join city ci on (ci.countrycode=cl.countrycode) where co.name='india';
+--------------------------------+--------------+-----------+
| city_name                      | country_name | language  |
+--------------------------------+--------------+-----------+
| Mumbai (Bombay)                | India        | Asami     |
| Mumbai (Bombay)                | India        | Bengali   |
| Mumbai (Bombay)                | India        | Gujarati  |
| Mumbai (Bombay)                | India        | Hindi     |
| Mumbai (Bombay)                | India        | Kannada   |
| Mumbai (Bombay)                | India        | Malajalam |
| Mumbai (Bombay)                | India        | Marathi   |
| Mumbai (Bombay)                | India        | Orija     |
| Mumbai (Bombay)                | India        | Punjabi   |
| Mumbai (Bombay)                | India        | Tamil     |
| Mumbai (Bombay)                | India        | Telugu    |
| Mumbai (Bombay)                | India        | Urdu      |
| Delhi                          | India        | Asami     |
| Delhi                          | India        | Bengali   |
| Delhi                          | India        | Gujarati  |
| Delhi                          | India        | Hindi     |
| Delhi                          | India        | Kannada   |
| Delhi                          | India        | Malajalam |
| Delhi                          | India        | Marathi   |
| Delhi                          | India        | Orija     |
| Delhi                          | India        | Punjabi   |
| Delhi                          | India        | Tamil     |
| Delhi                          | India        | Telugu    |
| Delhi                          | India        | Urdu      |
| Calcutta [Kolkata]             | India        | Asami     |
| Calcutta [Kolkata]             | India        | Bengali   |
| Calcutta [Kolkata]             | India        | Gujarati  |
| Calcutta [Kolkata]             | India        | Hindi     |
| Calcutta [Kolkata]             | India        | Kannada   |
| Calcutta [Kolkata]             | India        | Malajalam |
| Calcutta [Kolkata]             | India        | Marathi   |
| Calcutta [Kolkata]             | India        | Orija     |
| Calcutta [Kolkata]             | India        | Punjabi   |
| Calcutta [Kolkata]             | India        | Tamil     |
| Calcutta [Kolkata]             | India        | Telugu    |
| Calcutta [Kolkata]             | India        | Urdu      |
| Chennai (Madras)               | India        | Asami     |
| Chennai (Madras)               | India        | Bengali   |
| Chennai (Madras)               | India        | Gujarati  |
| Chennai (Madras)               | India        | Hindi     |
| Chennai (Madras)               | India        | Kannada   |
| Chennai (Madras)               | India        | Malajalam |
| Chennai (Madras)               | India        | Marathi   |
| Chennai (Madras)               | India        | Orija     |
| Chennai (Madras)               | India        | Punjabi   |
| Chennai (Madras)               | India        | Tamil     |
| Chennai (Madras)               | India        | Telugu    |
| Chennai (Madras)               | India        | Urdu      |
| Hyderabad                      | India        | Asami     |
| Hyderabad                      | India        | Bengali   |
| Hyderabad                      | India        | Gujarati  |
| Hyderabad                      | India        | Hindi     |
| Hyderabad                      | India        | Kannada   |
| Hyderabad                      | India        | Malajalam |
| Hyderabad                      | India        | Marathi   |
| Hyderabad                      | India        | Orija     |
| Hyderabad                      | India        | Punjabi   |
| Hyderabad                      | India        | Tamil     |
| Hyderabad                      | India        | Telugu    |
| Hyderabad                      | India        | Urdu      |
| Ahmedabad                      | India        | Asami     |
| Ahmedabad                      | India        | Bengali   |
| Ahmedabad                      | India        | Gujarati  |
| Ahmedabad                      | India        | Hindi     |
| Ahmedabad                      | India        | Kannada   |
| Ahmedabad                      | India        | Malajalam |
| Ahmedabad                      | India        | Marathi   |
| Ahmedabad                      | India        | Orija     |
| Ahmedabad                      | India        | Punjabi   |
| Ahmedabad                      | India        | Tamil     |
| Ahmedabad                      | India        | Telugu    |
| Ahmedabad                      | India        | Urdu      |
| Bangalore                      | India        | Asami     |
| Bangalore                      | India        | Bengali   |
| Bangalore                      | India        | Gujarati  |
| Bangalore                      | India        | Hindi     |
| Bangalore                      | India        | Kannada   |
| Bangalore                      | India        | Malajalam |
| Bangalore                      | India        | Marathi   |
| Bangalore                      | India        | Orija     |
| Bangalore                      | India        | Punjabi   |
| Bangalore                      | India        | Tamil     |
| Bangalore                      | India        | Telugu    |
| Bangalore                      | India        | Urdu      |
| Kanpur                         | India        | Asami     |
| Kanpur                         | India        | Bengali   |
| Kanpur                         | India        | Gujarati  |
| Kanpur                         | India        | Hindi     |
| Kanpur                         | India        | Kannada   |
| Kanpur                         | India        | Malajalam |
| Kanpur                         | India        | Marathi   |
| Kanpur                         | India        | Orija     |
| Kanpur                         | India        | Punjabi   |
| Kanpur                         | India        | Tamil     |
| Kanpur                         | India        | Telugu    |
| Kanpur                         | India        | Urdu      |
| Nagpur                         | India        | Asami     |
| Nagpur                         | India        | Bengali   |
| Nagpur                         | India        | Gujarati  |
| Nagpur                         | India        | Hindi     |
| Nagpur                         | India        | Kannada   |
| Nagpur                         | India        | Malajalam |
| Nagpur                         | India        | Marathi   |
| Nagpur                         | India        | Orija     |
| Nagpur                         | India        | Punjabi   |
| Nagpur                         | India        | Tamil     |
| Nagpur                         | India        | Telugu    |
| Nagpur                         | India        | Urdu      |
| Lucknow                        | India        | Asami     |
| Lucknow                        | India        | Bengali   |
| Lucknow                        | India        | Gujarati  |
| Lucknow                        | India        | Hindi     |
| Lucknow                        | India        | Kannada   |
| Lucknow                        | India        | Malajalam |
| Lucknow                        | India        | Marathi   |
| Lucknow                        | India        | Orija     |
| Lucknow                        | India        | Punjabi   |
| Lucknow                        | India        | Tamil     |
| Lucknow                        | India        | Telugu    |
| Lucknow                        | India        | Urdu      |
| Pune                           | India        | Asami     |
| Pune                           | India        | Bengali   |
| Pune                           | India        | Gujarati  |
| Pune                           | India        | Hindi     |
| Pune                           | India        | Kannada   |
| Pune                           | India        | Malajalam |
| Pune                           | India        | Marathi   |
| Pune                           | India        | Orija     |
| Pune                           | India        | Punjabi   |
| Pune                           | India        | Tamil     |
| Pune                           | India        | Telugu    |
| Pune                           | India        | Urdu      |
| Surat                          | India        | Asami     |
| Surat                          | India        | Bengali   |
| Surat                          | India        | Gujarati  |
| Surat                          | India        | Hindi     |
| Surat                          | India        | Kannada   |
| Surat                          | India        | Malajalam |
| Surat                          | India        | Marathi   |
| Surat                          | India        | Orija     |
| Surat                          | India        | Punjabi   |
| Surat                          | India        | Tamil     |
| Surat                          | India        | Telugu    |
| Surat                          | India        | Urdu      |
| Jaipur                         | India        | Asami     |
| Jaipur                         | India        | Bengali   |
| Jaipur                         | India        | Gujarati  |
| Jaipur                         | India        | Hindi     |
| Jaipur                         | India        | Kannada   |
| Jaipur                         | India        | Malajalam |
| Jaipur                         | India        | Marathi   |
| Jaipur                         | India        | Orija     |
| Jaipur                         | India        | Punjabi   |
| Jaipur                         | India        | Tamil     |
| Jaipur                         | India        | Telugu    |
| Jaipur                         | India        | Urdu      |
| Indore                         | India        | Asami     |
| Indore                         | India        | Bengali   |
| Indore                         | India        | Gujarati  |
| Indore                         | India        | Hindi     |
| Indore                         | India        | Kannada   |
| Indore                         | India        | Malajalam |
| Indore                         | India        | Marathi   |
| Indore                         | India        | Orija     |
| Indore                         | India        | Punjabi   |
| Indore                         | India        | Tamil     |
| Indore                         | India        | Telugu    |
| Indore                         | India        | Urdu      |
| Bhopal                         | India        | Asami     |
| Bhopal                         | India        | Bengali   |
| Bhopal                         | India        | Gujarati  |
| Bhopal                         | India        | Hindi     |
| Bhopal                         | India        | Kannada   |
| Bhopal                         | India        | Malajalam |
| Bhopal                         | India        | Marathi   |
| Bhopal                         | India        | Orija     |
| Bhopal                         | India        | Punjabi   |
| Bhopal                         | India        | Tamil     |
| Bhopal                         | India        | Telugu    |
| Bhopal                         | India        | Urdu      |
| Ludhiana                       | India        | Asami     |
| Ludhiana                       | India        | Bengali   |
| Ludhiana                       | India        | Gujarati  |
| Ludhiana                       | India        | Hindi     |
| Ludhiana                       | India        | Kannada   |
| Ludhiana                       | India        | Malajalam |
| Ludhiana                       | India        | Marathi   |
| Ludhiana                       | India        | Orija     |
| Ludhiana                       | India        | Punjabi   |
| Ludhiana                       | India        | Tamil     |
| Ludhiana                       | India        | Telugu    |
| Ludhiana                       | India        | Urdu      |
| Vadodara (Baroda)              | India        | Asami     |
| Vadodara (Baroda)              | India        | Bengali   |
| Vadodara (Baroda)              | India        | Gujarati  |
| Vadodara (Baroda)              | India        | Hindi     |
| Vadodara (Baroda)              | India        | Kannada   |
| Vadodara (Baroda)              | India        | Malajalam |
| Vadodara (Baroda)              | India        | Marathi   |
| Vadodara (Baroda)              | India        | Orija     |
| Vadodara (Baroda)              | India        | Punjabi   |
| Vadodara (Baroda)              | India        | Tamil     |
| Vadodara (Baroda)              | India        | Telugu    |
| Vadodara (Baroda)              | India        | Urdu      |
| Kalyan                         | India        | Asami     |
| Kalyan                         | India        | Bengali   |
| Kalyan                         | India        | Gujarati  |
| Kalyan                         | India        | Hindi     |
| Kalyan                         | India        | Kannada   |
| Kalyan                         | India        | Malajalam |
| Kalyan                         | India        | Marathi   |
| Kalyan                         | India        | Orija     |
| Kalyan                         | India        | Punjabi   |
| Kalyan                         | India        | Tamil     |
| Kalyan                         | India        | Telugu    |
| Kalyan                         | India        | Urdu      |
| Madurai                        | India        | Asami     |
| Madurai                        | India        | Bengali   |
| Madurai                        | India        | Gujarati  |
| Madurai                        | India        | Hindi     |
| Madurai                        | India        | Kannada   |
| Madurai                        | India        | Malajalam |
| Madurai                        | India        | Marathi   |
| Madurai                        | India        | Orija     |
| Madurai                        | India        | Punjabi   |
| Madurai                        | India        | Tamil     |
| Madurai                        | India        | Telugu    |
| Madurai                        | India        | Urdu      |
| Haora (Howrah)                 | India        | Asami     |
| Haora (Howrah)                 | India        | Bengali   |
| Haora (Howrah)                 | India        | Gujarati  |
| Haora (Howrah)                 | India        | Hindi     |
| Haora (Howrah)                 | India        | Kannada   |
| Haora (Howrah)                 | India        | Malajalam |
| Haora (Howrah)                 | India        | Marathi   |
| Haora (Howrah)                 | India        | Orija     |
| Haora (Howrah)                 | India        | Punjabi   |
| Haora (Howrah)                 | India        | Tamil     |
| Haora (Howrah)                 | India        | Telugu    |
| Haora (Howrah)                 | India        | Urdu      |
| Varanasi (Benares)             | India        | Asami     |
| Varanasi (Benares)             | India        | Bengali   |
| Varanasi (Benares)             | India        | Gujarati  |
| Varanasi (Benares)             | India        | Hindi     |
| Varanasi (Benares)             | India        | Kannada   |
| Varanasi (Benares)             | India        | Malajalam |
| Varanasi (Benares)             | India        | Marathi   |
| Varanasi (Benares)             | India        | Orija     |
| Varanasi (Benares)             | India        | Punjabi   |
| Varanasi (Benares)             | India        | Tamil     |
| Varanasi (Benares)             | India        | Telugu    |
| Varanasi (Benares)             | India        | Urdu      |
| Patna                          | India        | Asami     |
| Patna                          | India        | Bengali   |
| Patna                          | India        | Gujarati  |
| Patna                          | India        | Hindi     |
| Patna                          | India        | Kannada   |
| Patna                          | India        | Malajalam |
| Patna                          | India        | Marathi   |
| Patna                          | India        | Orija     |
| Patna                          | India        | Punjabi   |
| Patna                          | India        | Tamil     |
| Patna                          | India        | Telugu    |
| Patna                          | India        | Urdu      |
| Srinagar                       | India        | Asami     |
| Srinagar                       | India        | Bengali   |
| Srinagar                       | India        | Gujarati  |
| Srinagar                       | India        | Hindi     |
| Srinagar                       | India        | Kannada   |
| Srinagar                       | India        | Malajalam |
| Srinagar                       | India        | Marathi   |
| Srinagar                       | India        | Orija     |
| Srinagar                       | India        | Punjabi   |
| Srinagar                       | India        | Tamil     |
| Srinagar                       | India        | Telugu    |
| Srinagar                       | India        | Urdu      |
| Agra                           | India        | Asami     |
| Agra                           | India        | Bengali   |
| Agra                           | India        | Gujarati  |
| Agra                           | India        | Hindi     |
| Agra                           | India        | Kannada   |
| Agra                           | India        | Malajalam |
| Agra                           | India        | Marathi   |
| Agra                           | India        | Orija     |
| Agra                           | India        | Punjabi   |
| Agra                           | India        | Tamil     |
| Agra                           | India        | Telugu    |
| Agra                           | India        | Urdu      |
| Coimbatore                     | India        | Asami     |
| Coimbatore                     | India        | Bengali   |
| Coimbatore                     | India        | Gujarati  |
| Coimbatore                     | India        | Hindi     |
| Coimbatore                     | India        | Kannada   |
| Coimbatore                     | India        | Malajalam |
| Coimbatore                     | India        | Marathi   |
| Coimbatore                     | India        | Orija     |
| Coimbatore                     | India        | Punjabi   |
| Coimbatore                     | India        | Tamil     |
| Coimbatore                     | India        | Telugu    |
| Coimbatore                     | India        | Urdu      |
| Thane (Thana)                  | India        | Asami     |
| Thane (Thana)                  | India        | Bengali   |
| Thane (Thana)                  | India        | Gujarati  |
| Thane (Thana)                  | India        | Hindi     |
| Thane (Thana)                  | India        | Kannada   |
| Thane (Thana)                  | India        | Malajalam |
| Thane (Thana)                  | India        | Marathi   |
| Thane (Thana)                  | India        | Orija     |
| Thane (Thana)                  | India        | Punjabi   |
| Thane (Thana)                  | India        | Tamil     |
| Thane (Thana)                  | India        | Telugu    |
| Thane (Thana)                  | India        | Urdu      |
| Allahabad                      | India        | Asami     |
| Allahabad                      | India        | Bengali   |
| Allahabad                      | India        | Gujarati  |
| Allahabad                      | India        | Hindi     |
| Allahabad                      | India        | Kannada   |
| Allahabad                      | India        | Malajalam |
| Allahabad                      | India        | Marathi   |
| Allahabad                      | India        | Orija     |
| Allahabad                      | India        | Punjabi   |
| Allahabad                      | India        | Tamil     |
| Allahabad                      | India        | Telugu    |
| Allahabad                      | India        | Urdu      |
| Meerut                         | India        | Asami     |
| Meerut                         | India        | Bengali   |
| Meerut                         | India        | Gujarati  |
| Meerut                         | India        | Hindi     |
| Meerut                         | India        | Kannada   |
| Meerut                         | India        | Malajalam |
| Meerut                         | India        | Marathi   |
| Meerut                         | India        | Orija     |
| Meerut                         | India        | Punjabi   |
| Meerut                         | India        | Tamil     |
| Meerut                         | India        | Telugu    |
| Meerut                         | India        | Urdu      |
| Vishakhapatnam                 | India        | Asami     |
| Vishakhapatnam                 | India        | Bengali   |
| Vishakhapatnam                 | India        | Gujarati  |
| Vishakhapatnam                 | India        | Hindi     |
| Vishakhapatnam                 | India        | Kannada   |
| Vishakhapatnam                 | India        | Malajalam |
| Vishakhapatnam                 | India        | Marathi   |
| Vishakhapatnam                 | India        | Orija     |
| Vishakhapatnam                 | India        | Punjabi   |
| Vishakhapatnam                 | India        | Tamil     |
| Vishakhapatnam                 | India        | Telugu    |
| Vishakhapatnam                 | India        | Urdu      |
| Jabalpur                       | India        | Asami     |
| Jabalpur                       | India        | Bengali   |
| Jabalpur                       | India        | Gujarati  |
| Jabalpur                       | India        | Hindi     |
| Jabalpur                       | India        | Kannada   |
| Jabalpur                       | India        | Malajalam |
| Jabalpur                       | India        | Marathi   |
| Jabalpur                       | India        | Orija     |
| Jabalpur                       | India        | Punjabi   |
| Jabalpur                       | India        | Tamil     |
| Jabalpur                       | India        | Telugu    |
| Jabalpur                       | India        | Urdu      |
| Amritsar                       | India        | Asami     |
| Amritsar                       | India        | Bengali   |
| Amritsar                       | India        | Gujarati  |
| Amritsar                       | India        | Hindi     |
| Amritsar                       | India        | Kannada   |
| Amritsar                       | India        | Malajalam |
| Amritsar                       | India        | Marathi   |
| Amritsar                       | India        | Orija     |
| Amritsar                       | India        | Punjabi   |
| Amritsar                       | India        | Tamil     |
| Amritsar                       | India        | Telugu    |
| Amritsar                       | India        | Urdu      |
| Faridabad                      | India        | Asami     |
| Faridabad                      | India        | Bengali   |
| Faridabad                      | India        | Gujarati  |
| Faridabad                      | India        | Hindi     |
| Faridabad                      | India        | Kannada   |
| Faridabad                      | India        | Malajalam |
| Faridabad                      | India        | Marathi   |
| Faridabad                      | India        | Orija     |
| Faridabad                      | India        | Punjabi   |
| Faridabad                      | India        | Tamil     |
| Faridabad                      | India        | Telugu    |
| Faridabad                      | India        | Urdu      |
| Vijayawada                     | India        | Asami     |
| Vijayawada                     | India        | Bengali   |
| Vijayawada                     | India        | Gujarati  |
| Vijayawada                     | India        | Hindi     |
| Vijayawada                     | India        | Kannada   |
| Vijayawada                     | India        | Malajalam |
| Vijayawada                     | India        | Marathi   |
| Vijayawada                     | India        | Orija     |
| Vijayawada                     | India        | Punjabi   |
| Vijayawada                     | India        | Tamil     |
| Vijayawada                     | India        | Telugu    |
| Vijayawada                     | India        | Urdu      |
| Gwalior                        | India        | Asami     |
| Gwalior                        | India        | Bengali   |
| Gwalior                        | India        | Gujarati  |
| Gwalior                        | India        | Hindi     |
| Gwalior                        | India        | Kannada   |
| Gwalior                        | India        | Malajalam |
| Gwalior                        | India        | Marathi   |
| Gwalior                        | India        | Orija     |
| Gwalior                        | India        | Punjabi   |
| Gwalior                        | India        | Tamil     |
| Gwalior                        | India        | Telugu    |
| Gwalior                        | India        | Urdu      |
| Jodhpur                        | India        | Asami     |
| Jodhpur                        | India        | Bengali   |
| Jodhpur                        | India        | Gujarati  |
| Jodhpur                        | India        | Hindi     |
| Jodhpur                        | India        | Kannada   |
| Jodhpur                        | India        | Malajalam |
| Jodhpur                        | India        | Marathi   |
| Jodhpur                        | India        | Orija     |
| Jodhpur                        | India        | Punjabi   |
| Jodhpur                        | India        | Tamil     |
| Jodhpur                        | India        | Telugu    |
| Jodhpur                        | India        | Urdu      |
| Nashik (Nasik)                 | India        | Asami     |
| Nashik (Nasik)                 | India        | Bengali   |
| Nashik (Nasik)                 | India        | Gujarati  |
| Nashik (Nasik)                 | India        | Hindi     |
| Nashik (Nasik)                 | India        | Kannada   |
| Nashik (Nasik)                 | India        | Malajalam |
| Nashik (Nasik)                 | India        | Marathi   |
| Nashik (Nasik)                 | India        | Orija     |
| Nashik (Nasik)                 | India        | Punjabi   |
| Nashik (Nasik)                 | India        | Tamil     |
| Nashik (Nasik)                 | India        | Telugu    |
| Nashik (Nasik)                 | India        | Urdu      |
| Hubli-Dharwad                  | India        | Asami     |
| Hubli-Dharwad                  | India        | Bengali   |
| Hubli-Dharwad                  | India        | Gujarati  |
| Hubli-Dharwad                  | India        | Hindi     |
| Hubli-Dharwad                  | India        | Kannada   |
| Hubli-Dharwad                  | India        | Malajalam |
| Hubli-Dharwad                  | India        | Marathi   |
| Hubli-Dharwad                  | India        | Orija     |
| Hubli-Dharwad                  | India        | Punjabi   |
| Hubli-Dharwad                  | India        | Tamil     |
| Hubli-Dharwad                  | India        | Telugu    |
| Hubli-Dharwad                  | India        | Urdu      |
| Solapur (Sholapur)             | India        | Asami     |
| Solapur (Sholapur)             | India        | Bengali   |
| Solapur (Sholapur)             | India        | Gujarati  |
| Solapur (Sholapur)             | India        | Hindi     |
| Solapur (Sholapur)             | India        | Kannada   |
| Solapur (Sholapur)             | India        | Malajalam |
| Solapur (Sholapur)             | India        | Marathi   |
| Solapur (Sholapur)             | India        | Orija     |
| Solapur (Sholapur)             | India        | Punjabi   |
| Solapur (Sholapur)             | India        | Tamil     |
| Solapur (Sholapur)             | India        | Telugu    |
| Solapur (Sholapur)             | India        | Urdu      |
| Ranchi                         | India        | Asami     |
| Ranchi                         | India        | Bengali   |
| Ranchi                         | India        | Gujarati  |
| Ranchi                         | India        | Hindi     |
| Ranchi                         | India        | Kannada   |
| Ranchi                         | India        | Malajalam |
| Ranchi                         | India        | Marathi   |
| Ranchi                         | India        | Orija     |
| Ranchi                         | India        | Punjabi   |
| Ranchi                         | India        | Tamil     |
| Ranchi                         | India        | Telugu    |
| Ranchi                         | India        | Urdu      |
| Bareilly                       | India        | Asami     |
| Bareilly                       | India        | Bengali   |
| Bareilly                       | India        | Gujarati  |
| Bareilly                       | India        | Hindi     |
| Bareilly                       | India        | Kannada   |
| Bareilly                       | India        | Malajalam |
| Bareilly                       | India        | Marathi   |
| Bareilly                       | India        | Orija     |
| Bareilly                       | India        | Punjabi   |
| Bareilly                       | India        | Tamil     |
| Bareilly                       | India        | Telugu    |
| Bareilly                       | India        | Urdu      |
| Guwahati (Gauhati)             | India        | Asami     |
| Guwahati (Gauhati)             | India        | Bengali   |
| Guwahati (Gauhati)             | India        | Gujarati  |
| Guwahati (Gauhati)             | India        | Hindi     |
| Guwahati (Gauhati)             | India        | Kannada   |
| Guwahati (Gauhati)             | India        | Malajalam |
| Guwahati (Gauhati)             | India        | Marathi   |
| Guwahati (Gauhati)             | India        | Orija     |
| Guwahati (Gauhati)             | India        | Punjabi   |
| Guwahati (Gauhati)             | India        | Tamil     |
| Guwahati (Gauhati)             | India        | Telugu    |
| Guwahati (Gauhati)             | India        | Urdu      |
| Shambajinagar (Aurangabad)     | India        | Asami     |
| Shambajinagar (Aurangabad)     | India        | Bengali   |
| Shambajinagar (Aurangabad)     | India        | Gujarati  |
| Shambajinagar (Aurangabad)     | India        | Hindi     |
| Shambajinagar (Aurangabad)     | India        | Kannada   |
| Shambajinagar (Aurangabad)     | India        | Malajalam |
| Shambajinagar (Aurangabad)     | India        | Marathi   |
| Shambajinagar (Aurangabad)     | India        | Orija     |
| Shambajinagar (Aurangabad)     | India        | Punjabi   |
| Shambajinagar (Aurangabad)     | India        | Tamil     |
| Shambajinagar (Aurangabad)     | India        | Telugu    |
| Shambajinagar (Aurangabad)     | India        | Urdu      |
| Cochin (Kochi)                 | India        | Asami     |
| Cochin (Kochi)                 | India        | Bengali   |
| Cochin (Kochi)                 | India        | Gujarati  |
| Cochin (Kochi)                 | India        | Hindi     |
| Cochin (Kochi)                 | India        | Kannada   |
| Cochin (Kochi)                 | India        | Malajalam |
| Cochin (Kochi)                 | India        | Marathi   |
| Cochin (Kochi)                 | India        | Orija     |
| Cochin (Kochi)                 | India        | Punjabi   |
| Cochin (Kochi)                 | India        | Tamil     |
| Cochin (Kochi)                 | India        | Telugu    |
| Cochin (Kochi)                 | India        | Urdu      |
| Rajkot                         | India        | Asami     |
| Rajkot                         | India        | Bengali   |
| Rajkot                         | India        | Gujarati  |
| Rajkot                         | India        | Hindi     |
| Rajkot                         | India        | Kannada   |
| Rajkot                         | India        | Malajalam |
| Rajkot                         | India        | Marathi   |
| Rajkot                         | India        | Orija     |
| Rajkot                         | India        | Punjabi   |
| Rajkot                         | India        | Tamil     |
| Rajkot                         | India        | Telugu    |
| Rajkot                         | India        | Urdu      |
| Kota                           | India        | Asami     |
| Kota                           | India        | Bengali   |
| Kota                           | India        | Gujarati  |
| Kota                           | India        | Hindi     |
| Kota                           | India        | Kannada   |
| Kota                           | India        | Malajalam |
| Kota                           | India        | Marathi   |
| Kota                           | India        | Orija     |
| Kota                           | India        | Punjabi   |
| Kota                           | India        | Tamil     |
| Kota                           | India        | Telugu    |
| Kota                           | India        | Urdu      |
| Thiruvananthapuram (Trivandrum | India        | Asami     |
| Thiruvananthapuram (Trivandrum | India        | Bengali   |
| Thiruvananthapuram (Trivandrum | India        | Gujarati  |
| Thiruvananthapuram (Trivandrum | India        | Hindi     |
| Thiruvananthapuram (Trivandrum | India        | Kannada   |
| Thiruvananthapuram (Trivandrum | India        | Malajalam |
| Thiruvananthapuram (Trivandrum | India        | Marathi   |
| Thiruvananthapuram (Trivandrum | India        | Orija     |
| Thiruvananthapuram (Trivandrum | India        | Punjabi   |
| Thiruvananthapuram (Trivandrum | India        | Tamil     |
| Thiruvananthapuram (Trivandrum | India        | Telugu    |
| Thiruvananthapuram (Trivandrum | India        | Urdu      |
| Pimpri-Chinchwad               | India        | Asami     |
| Pimpri-Chinchwad               | India        | Bengali   |
| Pimpri-Chinchwad               | India        | Gujarati  |
| Pimpri-Chinchwad               | India        | Hindi     |
| Pimpri-Chinchwad               | India        | Kannada   |
| Pimpri-Chinchwad               | India        | Malajalam |
| Pimpri-Chinchwad               | India        | Marathi   |
| Pimpri-Chinchwad               | India        | Orija     |
| Pimpri-Chinchwad               | India        | Punjabi   |
| Pimpri-Chinchwad               | India        | Tamil     |
| Pimpri-Chinchwad               | India        | Telugu    |
| Pimpri-Chinchwad               | India        | Urdu      |
| Jalandhar (Jullundur)          | India        | Asami     |
| Jalandhar (Jullundur)          | India        | Bengali   |
| Jalandhar (Jullundur)          | India        | Gujarati  |
| Jalandhar (Jullundur)          | India        | Hindi     |
| Jalandhar (Jullundur)          | India        | Kannada   |
| Jalandhar (Jullundur)          | India        | Malajalam |
| Jalandhar (Jullundur)          | India        | Marathi   |
| Jalandhar (Jullundur)          | India        | Orija     |
| Jalandhar (Jullundur)          | India        | Punjabi   |
| Jalandhar (Jullundur)          | India        | Tamil     |
| Jalandhar (Jullundur)          | India        | Telugu    |
| Jalandhar (Jullundur)          | India        | Urdu      |
| Gorakhpur                      | India        | Asami     |
| Gorakhpur                      | India        | Bengali   |
| Gorakhpur                      | India        | Gujarati  |
| Gorakhpur                      | India        | Hindi     |
| Gorakhpur                      | India        | Kannada   |
| Gorakhpur                      | India        | Malajalam |
| Gorakhpur                      | India        | Marathi   |
| Gorakhpur                      | India        | Orija     |
| Gorakhpur                      | India        | Punjabi   |
| Gorakhpur                      | India        | Tamil     |
| Gorakhpur                      | India        | Telugu    |
| Gorakhpur                      | India        | Urdu      |
| Chandigarh                     | India        | Asami     |
| Chandigarh                     | India        | Bengali   |
| Chandigarh                     | India        | Gujarati  |
| Chandigarh                     | India        | Hindi     |
| Chandigarh                     | India        | Kannada   |
| Chandigarh                     | India        | Malajalam |
| Chandigarh                     | India        | Marathi   |
| Chandigarh                     | India        | Orija     |
| Chandigarh                     | India        | Punjabi   |
| Chandigarh                     | India        | Tamil     |
| Chandigarh                     | India        | Telugu    |
| Chandigarh                     | India        | Urdu      |
| Mysore                         | India        | Asami     |
| Mysore                         | India        | Bengali   |
| Mysore                         | India        | Gujarati  |
| Mysore                         | India        | Hindi     |
| Mysore                         | India        | Kannada   |
| Mysore                         | India        | Malajalam |
| Mysore                         | India        | Marathi   |
| Mysore                         | India        | Orija     |
| Mysore                         | India        | Punjabi   |
| Mysore                         | India        | Tamil     |
| Mysore                         | India        | Telugu    |
| Mysore                         | India        | Urdu      |
| Aligarh                        | India        | Asami     |
| Aligarh                        | India        | Bengali   |
| Aligarh                        | India        | Gujarati  |
| Aligarh                        | India        | Hindi     |
| Aligarh                        | India        | Kannada   |
| Aligarh                        | India        | Malajalam |
| Aligarh                        | India        | Marathi   |
| Aligarh                        | India        | Orija     |
| Aligarh                        | India        | Punjabi   |
| Aligarh                        | India        | Tamil     |
| Aligarh                        | India        | Telugu    |
| Aligarh                        | India        | Urdu      |
| Guntur                         | India        | Asami     |
| Guntur                         | India        | Bengali   |
| Guntur                         | India        | Gujarati  |
| Guntur                         | India        | Hindi     |
| Guntur                         | India        | Kannada   |
| Guntur                         | India        | Malajalam |
| Guntur                         | India        | Marathi   |
| Guntur                         | India        | Orija     |
| Guntur                         | India        | Punjabi   |
| Guntur                         | India        | Tamil     |
| Guntur                         | India        | Telugu    |
| Guntur                         | India        | Urdu      |
| Jamshedpur                     | India        | Asami     |
| Jamshedpur                     | India        | Bengali   |
| Jamshedpur                     | India        | Gujarati  |
| Jamshedpur                     | India        | Hindi     |
| Jamshedpur                     | India        | Kannada   |
| Jamshedpur                     | India        | Malajalam |
| Jamshedpur                     | India        | Marathi   |
| Jamshedpur                     | India        | Orija     |
| Jamshedpur                     | India        | Punjabi   |
| Jamshedpur                     | India        | Tamil     |
| Jamshedpur                     | India        | Telugu    |
| Jamshedpur                     | India        | Urdu      |
| Ghaziabad                      | India        | Asami     |
| Ghaziabad                      | India        | Bengali   |
| Ghaziabad                      | India        | Gujarati  |
| Ghaziabad                      | India        | Hindi     |
| Ghaziabad                      | India        | Kannada   |
| Ghaziabad                      | India        | Malajalam |
| Ghaziabad                      | India        | Marathi   |
| Ghaziabad                      | India        | Orija     |
| Ghaziabad                      | India        | Punjabi   |
| Ghaziabad                      | India        | Tamil     |
| Ghaziabad                      | India        | Telugu    |
| Ghaziabad                      | India        | Urdu      |
| Warangal                       | India        | Asami     |
| Warangal                       | India        | Bengali   |
| Warangal                       | India        | Gujarati  |
| Warangal                       | India        | Hindi     |
| Warangal                       | India        | Kannada   |
| Warangal                       | India        | Malajalam |
| Warangal                       | India        | Marathi   |
| Warangal                       | India        | Orija     |
| Warangal                       | India        | Punjabi   |
| Warangal                       | India        | Tamil     |
| Warangal                       | India        | Telugu    |
| Warangal                       | India        | Urdu      |
| Raipur                         | India        | Asami     |
| Raipur                         | India        | Bengali   |
| Raipur                         | India        | Gujarati  |
| Raipur                         | India        | Hindi     |
| Raipur                         | India        | Kannada   |
| Raipur                         | India        | Malajalam |
| Raipur                         | India        | Marathi   |
| Raipur                         | India        | Orija     |
| Raipur                         | India        | Punjabi   |
| Raipur                         | India        | Tamil     |
| Raipur                         | India        | Telugu    |
| Raipur                         | India        | Urdu      |
| Moradabad                      | India        | Asami     |
| Moradabad                      | India        | Bengali   |
| Moradabad                      | India        | Gujarati  |
| Moradabad                      | India        | Hindi     |
| Moradabad                      | India        | Kannada   |
| Moradabad                      | India        | Malajalam |
| Moradabad                      | India        | Marathi   |
| Moradabad                      | India        | Orija     |
| Moradabad                      | India        | Punjabi   |
| Moradabad                      | India        | Tamil     |
| Moradabad                      | India        | Telugu    |
| Moradabad                      | India        | Urdu      |
| Durgapur                       | India        | Asami     |
| Durgapur                       | India        | Bengali   |
| Durgapur                       | India        | Gujarati  |
| Durgapur                       | India        | Hindi     |
| Durgapur                       | India        | Kannada   |
| Durgapur                       | India        | Malajalam |
| Durgapur                       | India        | Marathi   |
| Durgapur                       | India        | Orija     |
| Durgapur                       | India        | Punjabi   |
| Durgapur                       | India        | Tamil     |
| Durgapur                       | India        | Telugu    |
| Durgapur                       | India        | Urdu      |
| Amravati                       | India        | Asami     |
| Amravati                       | India        | Bengali   |
| Amravati                       | India        | Gujarati  |
| Amravati                       | India        | Hindi     |
| Amravati                       | India        | Kannada   |
| Amravati                       | India        | Malajalam |
| Amravati                       | India        | Marathi   |
| Amravati                       | India        | Orija     |
| Amravati                       | India        | Punjabi   |
| Amravati                       | India        | Tamil     |
| Amravati                       | India        | Telugu    |
| Amravati                       | India        | Urdu      |
| Calicut (Kozhikode)            | India        | Asami     |
| Calicut (Kozhikode)            | India        | Bengali   |
| Calicut (Kozhikode)            | India        | Gujarati  |
| Calicut (Kozhikode)            | India        | Hindi     |
| Calicut (Kozhikode)            | India        | Kannada   |
| Calicut (Kozhikode)            | India        | Malajalam |
| Calicut (Kozhikode)            | India        | Marathi   |
| Calicut (Kozhikode)            | India        | Orija     |
| Calicut (Kozhikode)            | India        | Punjabi   |
| Calicut (Kozhikode)            | India        | Tamil     |
| Calicut (Kozhikode)            | India        | Telugu    |
| Calicut (Kozhikode)            | India        | Urdu      |
| Bikaner                        | India        | Asami     |
| Bikaner                        | India        | Bengali   |
| Bikaner                        | India        | Gujarati  |
| Bikaner                        | India        | Hindi     |
| Bikaner                        | India        | Kannada   |
| Bikaner                        | India        | Malajalam |
| Bikaner                        | India        | Marathi   |
| Bikaner                        | India        | Orija     |
| Bikaner                        | India        | Punjabi   |
| Bikaner                        | India        | Tamil     |
| Bikaner                        | India        | Telugu    |
| Bikaner                        | India        | Urdu      |
| Bhubaneswar                    | India        | Asami     |
| Bhubaneswar                    | India        | Bengali   |
| Bhubaneswar                    | India        | Gujarati  |
| Bhubaneswar                    | India        | Hindi     |
| Bhubaneswar                    | India        | Kannada   |
| Bhubaneswar                    | India        | Malajalam |
| Bhubaneswar                    | India        | Marathi   |
| Bhubaneswar                    | India        | Orija     |
| Bhubaneswar                    | India        | Punjabi   |
| Bhubaneswar                    | India        | Tamil     |
| Bhubaneswar                    | India        | Telugu    |
| Bhubaneswar                    | India        | Urdu      |
| Kolhapur                       | India        | Asami     |
| Kolhapur                       | India        | Bengali   |
| Kolhapur                       | India        | Gujarati  |
| Kolhapur                       | India        | Hindi     |
| Kolhapur                       | India        | Kannada   |
| Kolhapur                       | India        | Malajalam |
| Kolhapur                       | India        | Marathi   |
| Kolhapur                       | India        | Orija     |
| Kolhapur                       | India        | Punjabi   |
| Kolhapur                       | India        | Tamil     |
| Kolhapur                       | India        | Telugu    |
| Kolhapur                       | India        | Urdu      |
| Kataka (Cuttack)               | India        | Asami     |
| Kataka (Cuttack)               | India        | Bengali   |
| Kataka (Cuttack)               | India        | Gujarati  |
| Kataka (Cuttack)               | India        | Hindi     |
| Kataka (Cuttack)               | India        | Kannada   |
| Kataka (Cuttack)               | India        | Malajalam |
| Kataka (Cuttack)               | India        | Marathi   |
| Kataka (Cuttack)               | India        | Orija     |
| Kataka (Cuttack)               | India        | Punjabi   |
| Kataka (Cuttack)               | India        | Tamil     |
| Kataka (Cuttack)               | India        | Telugu    |
| Kataka (Cuttack)               | India        | Urdu      |
| Ajmer                          | India        | Asami     |
| Ajmer                          | India        | Bengali   |
| Ajmer                          | India        | Gujarati  |
| Ajmer                          | India        | Hindi     |
| Ajmer                          | India        | Kannada   |
| Ajmer                          | India        | Malajalam |
| Ajmer                          | India        | Marathi   |
| Ajmer                          | India        | Orija     |
| Ajmer                          | India        | Punjabi   |
| Ajmer                          | India        | Tamil     |
| Ajmer                          | India        | Telugu    |
| Ajmer                          | India        | Urdu      |
| Bhavnagar                      | India        | Asami     |
| Bhavnagar                      | India        | Bengali   |
| Bhavnagar                      | India        | Gujarati  |
| Bhavnagar                      | India        | Hindi     |
| Bhavnagar                      | India        | Kannada   |
| Bhavnagar                      | India        | Malajalam |
| Bhavnagar                      | India        | Marathi   |
| Bhavnagar                      | India        | Orija     |
| Bhavnagar                      | India        | Punjabi   |
| Bhavnagar                      | India        | Tamil     |
| Bhavnagar                      | India        | Telugu    |
| Bhavnagar                      | India        | Urdu      |
| Tiruchirapalli                 | India        | Asami     |
| Tiruchirapalli                 | India        | Bengali   |
| Tiruchirapalli                 | India        | Gujarati  |
| Tiruchirapalli                 | India        | Hindi     |
| Tiruchirapalli                 | India        | Kannada   |
| Tiruchirapalli                 | India        | Malajalam |
| Tiruchirapalli                 | India        | Marathi   |
| Tiruchirapalli                 | India        | Orija     |
| Tiruchirapalli                 | India        | Punjabi   |
| Tiruchirapalli                 | India        | Tamil     |
| Tiruchirapalli                 | India        | Telugu    |
| Tiruchirapalli                 | India        | Urdu      |
| Bhilai                         | India        | Asami     |
| Bhilai                         | India        | Bengali   |
| Bhilai                         | India        | Gujarati  |
| Bhilai                         | India        | Hindi     |
| Bhilai                         | India        | Kannada   |
| Bhilai                         | India        | Malajalam |
| Bhilai                         | India        | Marathi   |
| Bhilai                         | India        | Orija     |
| Bhilai                         | India        | Punjabi   |
| Bhilai                         | India        | Tamil     |
| Bhilai                         | India        | Telugu    |
| Bhilai                         | India        | Urdu      |
| Bhiwandi                       | India        | Asami     |
| Bhiwandi                       | India        | Bengali   |
| Bhiwandi                       | India        | Gujarati  |
| Bhiwandi                       | India        | Hindi     |
| Bhiwandi                       | India        | Kannada   |
| Bhiwandi                       | India        | Malajalam |
| Bhiwandi                       | India        | Marathi   |
| Bhiwandi                       | India        | Orija     |
| Bhiwandi                       | India        | Punjabi   |
| Bhiwandi                       | India        | Tamil     |
| Bhiwandi                       | India        | Telugu    |
| Bhiwandi                       | India        | Urdu      |
| Saharanpur                     | India        | Asami     |
| Saharanpur                     | India        | Bengali   |
| Saharanpur                     | India        | Gujarati  |
| Saharanpur                     | India        | Hindi     |
| Saharanpur                     | India        | Kannada   |
| Saharanpur                     | India        | Malajalam |
| Saharanpur                     | India        | Marathi   |
| Saharanpur                     | India        | Orija     |
| Saharanpur                     | India        | Punjabi   |
| Saharanpur                     | India        | Tamil     |
| Saharanpur                     | India        | Telugu    |
| Saharanpur                     | India        | Urdu      |
| Ulhasnagar                     | India        | Asami     |
| Ulhasnagar                     | India        | Bengali   |
| Ulhasnagar                     | India        | Gujarati  |
| Ulhasnagar                     | India        | Hindi     |
| Ulhasnagar                     | India        | Kannada   |
| Ulhasnagar                     | India        | Malajalam |
| Ulhasnagar                     | India        | Marathi   |
| Ulhasnagar                     | India        | Orija     |
| Ulhasnagar                     | India        | Punjabi   |
| Ulhasnagar                     | India        | Tamil     |
| Ulhasnagar                     | India        | Telugu    |
| Ulhasnagar                     | India        | Urdu      |
| Salem                          | India        | Asami     |
| Salem                          | India        | Bengali   |
| Salem                          | India        | Gujarati  |
| Salem                          | India        | Hindi     |
| Salem                          | India        | Kannada   |
| Salem                          | India        | Malajalam |
| Salem                          | India        | Marathi   |
| Salem                          | India        | Orija     |
| Salem                          | India        | Punjabi   |
| Salem                          | India        | Tamil     |
| Salem                          | India        | Telugu    |
| Salem                          | India        | Urdu      |
| Ujjain                         | India        | Asami     |
| Ujjain                         | India        | Bengali   |
| Ujjain                         | India        | Gujarati  |
| Ujjain                         | India        | Hindi     |
| Ujjain                         | India        | Kannada   |
| Ujjain                         | India        | Malajalam |
| Ujjain                         | India        | Marathi   |
| Ujjain                         | India        | Orija     |
| Ujjain                         | India        | Punjabi   |
| Ujjain                         | India        | Tamil     |
| Ujjain                         | India        | Telugu    |
| Ujjain                         | India        | Urdu      |
| Malegaon                       | India        | Asami     |
| Malegaon                       | India        | Bengali   |
| Malegaon                       | India        | Gujarati  |
| Malegaon                       | India        | Hindi     |
| Malegaon                       | India        | Kannada   |
| Malegaon                       | India        | Malajalam |
| Malegaon                       | India        | Marathi   |
| Malegaon                       | India        | Orija     |
| Malegaon                       | India        | Punjabi   |
| Malegaon                       | India        | Tamil     |
| Malegaon                       | India        | Telugu    |
| Malegaon                       | India        | Urdu      |
| Jamnagar                       | India        | Asami     |
| Jamnagar                       | India        | Bengali   |
| Jamnagar                       | India        | Gujarati  |
| Jamnagar                       | India        | Hindi     |
| Jamnagar                       | India        | Kannada   |
| Jamnagar                       | India        | Malajalam |
| Jamnagar                       | India        | Marathi   |
| Jamnagar                       | India        | Orija     |
| Jamnagar                       | India        | Punjabi   |
| Jamnagar                       | India        | Tamil     |
| Jamnagar                       | India        | Telugu    |
| Jamnagar                       | India        | Urdu      |
| Bokaro Steel City              | India        | Asami     |
| Bokaro Steel City              | India        | Bengali   |
| Bokaro Steel City              | India        | Gujarati  |
| Bokaro Steel City              | India        | Hindi     |
| Bokaro Steel City              | India        | Kannada   |
| Bokaro Steel City              | India        | Malajalam |
| Bokaro Steel City              | India        | Marathi   |
| Bokaro Steel City              | India        | Orija     |
| Bokaro Steel City              | India        | Punjabi   |
| Bokaro Steel City              | India        | Tamil     |
| Bokaro Steel City              | India        | Telugu    |
| Bokaro Steel City              | India        | Urdu      |
| Akola                          | India        | Asami     |
| Akola                          | India        | Bengali   |
| Akola                          | India        | Gujarati  |
| Akola                          | India        | Hindi     |
| Akola                          | India        | Kannada   |
| Akola                          | India        | Malajalam |
| Akola                          | India        | Marathi   |
| Akola                          | India        | Orija     |
| Akola                          | India        | Punjabi   |
| Akola                          | India        | Tamil     |
| Akola                          | India        | Telugu    |
| Akola                          | India        | Urdu      |
| Belgaum                        | India        | Asami     |
| Belgaum                        | India        | Bengali   |
| Belgaum                        | India        | Gujarati  |
| Belgaum                        | India        | Hindi     |
| Belgaum                        | India        | Kannada   |
| Belgaum                        | India        | Malajalam |
| Belgaum                        | India        | Marathi   |
| Belgaum                        | India        | Orija     |
| Belgaum                        | India        | Punjabi   |
| Belgaum                        | India        | Tamil     |
| Belgaum                        | India        | Telugu    |
| Belgaum                        | India        | Urdu      |
| Rajahmundry                    | India        | Asami     |
| Rajahmundry                    | India        | Bengali   |
| Rajahmundry                    | India        | Gujarati  |
| Rajahmundry                    | India        | Hindi     |
| Rajahmundry                    | India        | Kannada   |
| Rajahmundry                    | India        | Malajalam |
| Rajahmundry                    | India        | Marathi   |
| Rajahmundry                    | India        | Orija     |
| Rajahmundry                    | India        | Punjabi   |
| Rajahmundry                    | India        | Tamil     |
| Rajahmundry                    | India        | Telugu    |
| Rajahmundry                    | India        | Urdu      |
| Nellore                        | India        | Asami     |
| Nellore                        | India        | Bengali   |
| Nellore                        | India        | Gujarati  |
| Nellore                        | India        | Hindi     |
| Nellore                        | India        | Kannada   |
| Nellore                        | India        | Malajalam |
| Nellore                        | India        | Marathi   |
| Nellore                        | India        | Orija     |
| Nellore                        | India        | Punjabi   |
| Nellore                        | India        | Tamil     |
| Nellore                        | India        | Telugu    |
| Nellore                        | India        | Urdu      |
| Udaipur                        | India        | Asami     |
| Udaipur                        | India        | Bengali   |
| Udaipur                        | India        | Gujarati  |
| Udaipur                        | India        | Hindi     |
| Udaipur                        | India        | Kannada   |
| Udaipur                        | India        | Malajalam |
| Udaipur                        | India        | Marathi   |
| Udaipur                        | India        | Orija     |
| Udaipur                        | India        | Punjabi   |
| Udaipur                        | India        | Tamil     |
| Udaipur                        | India        | Telugu    |
| Udaipur                        | India        | Urdu      |
| New Bombay                     | India        | Asami     |
| New Bombay                     | India        | Bengali   |
| New Bombay                     | India        | Gujarati  |
| New Bombay                     | India        | Hindi     |
| New Bombay                     | India        | Kannada   |
| New Bombay                     | India        | Malajalam |
| New Bombay                     | India        | Marathi   |
| New Bombay                     | India        | Orija     |
| New Bombay                     | India        | Punjabi   |
| New Bombay                     | India        | Tamil     |
| New Bombay                     | India        | Telugu    |
| New Bombay                     | India        | Urdu      |
| Bhatpara                       | India        | Asami     |
| Bhatpara                       | India        | Bengali   |
| Bhatpara                       | India        | Gujarati  |
| Bhatpara                       | India        | Hindi     |
| Bhatpara                       | India        | Kannada   |
| Bhatpara                       | India        | Malajalam |
| Bhatpara                       | India        | Marathi   |
| Bhatpara                       | India        | Orija     |
| Bhatpara                       | India        | Punjabi   |
| Bhatpara                       | India        | Tamil     |
| Bhatpara                       | India        | Telugu    |
| Bhatpara                       | India        | Urdu      |
| Gulbarga                       | India        | Asami     |
| Gulbarga                       | India        | Bengali   |
| Gulbarga                       | India        | Gujarati  |
| Gulbarga                       | India        | Hindi     |
| Gulbarga                       | India        | Kannada   |
| Gulbarga                       | India        | Malajalam |
| Gulbarga                       | India        | Marathi   |
| Gulbarga                       | India        | Orija     |
| Gulbarga                       | India        | Punjabi   |
| Gulbarga                       | India        | Tamil     |
| Gulbarga                       | India        | Telugu    |
| Gulbarga                       | India        | Urdu      |
| New Delhi                      | India        | Asami     |
| New Delhi                      | India        | Bengali   |
| New Delhi                      | India        | Gujarati  |
| New Delhi                      | India        | Hindi     |
| New Delhi                      | India        | Kannada   |
| New Delhi                      | India        | Malajalam |
| New Delhi                      | India        | Marathi   |
| New Delhi                      | India        | Orija     |
| New Delhi                      | India        | Punjabi   |
| New Delhi                      | India        | Tamil     |
| New Delhi                      | India        | Telugu    |
| New Delhi                      | India        | Urdu      |
| Jhansi                         | India        | Asami     |
| Jhansi                         | India        | Bengali   |
| Jhansi                         | India        | Gujarati  |
| Jhansi                         | India        | Hindi     |
| Jhansi                         | India        | Kannada   |
| Jhansi                         | India        | Malajalam |
| Jhansi                         | India        | Marathi   |
| Jhansi                         | India        | Orija     |
| Jhansi                         | India        | Punjabi   |
| Jhansi                         | India        | Tamil     |
| Jhansi                         | India        | Telugu    |
| Jhansi                         | India        | Urdu      |
| Gaya                           | India        | Asami     |
| Gaya                           | India        | Bengali   |
| Gaya                           | India        | Gujarati  |
| Gaya                           | India        | Hindi     |
| Gaya                           | India        | Kannada   |
| Gaya                           | India        | Malajalam |
| Gaya                           | India        | Marathi   |
| Gaya                           | India        | Orija     |
| Gaya                           | India        | Punjabi   |
| Gaya                           | India        | Tamil     |
| Gaya                           | India        | Telugu    |
| Gaya                           | India        | Urdu      |
| Kakinada                       | India        | Asami     |
| Kakinada                       | India        | Bengali   |
| Kakinada                       | India        | Gujarati  |
| Kakinada                       | India        | Hindi     |
| Kakinada                       | India        | Kannada   |
| Kakinada                       | India        | Malajalam |
| Kakinada                       | India        | Marathi   |
| Kakinada                       | India        | Orija     |
| Kakinada                       | India        | Punjabi   |
| Kakinada                       | India        | Tamil     |
| Kakinada                       | India        | Telugu    |
| Kakinada                       | India        | Urdu      |
| Dhule (Dhulia)                 | India        | Asami     |
| Dhule (Dhulia)                 | India        | Bengali   |
| Dhule (Dhulia)                 | India        | Gujarati  |
| Dhule (Dhulia)                 | India        | Hindi     |
| Dhule (Dhulia)                 | India        | Kannada   |
| Dhule (Dhulia)                 | India        | Malajalam |
| Dhule (Dhulia)                 | India        | Marathi   |
| Dhule (Dhulia)                 | India        | Orija     |
| Dhule (Dhulia)                 | India        | Punjabi   |
| Dhule (Dhulia)                 | India        | Tamil     |
| Dhule (Dhulia)                 | India        | Telugu    |
| Dhule (Dhulia)                 | India        | Urdu      |
| Panihati                       | India        | Asami     |
| Panihati                       | India        | Bengali   |
| Panihati                       | India        | Gujarati  |
| Panihati                       | India        | Hindi     |
| Panihati                       | India        | Kannada   |
| Panihati                       | India        | Malajalam |
| Panihati                       | India        | Marathi   |
| Panihati                       | India        | Orija     |
| Panihati                       | India        | Punjabi   |
| Panihati                       | India        | Tamil     |
| Panihati                       | India        | Telugu    |
| Panihati                       | India        | Urdu      |
| Nanded (Nander)                | India        | Asami     |
| Nanded (Nander)                | India        | Bengali   |
| Nanded (Nander)                | India        | Gujarati  |
| Nanded (Nander)                | India        | Hindi     |
| Nanded (Nander)                | India        | Kannada   |
| Nanded (Nander)                | India        | Malajalam |
| Nanded (Nander)                | India        | Marathi   |
| Nanded (Nander)                | India        | Orija     |
| Nanded (Nander)                | India        | Punjabi   |
| Nanded (Nander)                | India        | Tamil     |
| Nanded (Nander)                | India        | Telugu    |
| Nanded (Nander)                | India        | Urdu      |
| Mangalore                      | India        | Asami     |
| Mangalore                      | India        | Bengali   |
| Mangalore                      | India        | Gujarati  |
| Mangalore                      | India        | Hindi     |
| Mangalore                      | India        | Kannada   |
| Mangalore                      | India        | Malajalam |
| Mangalore                      | India        | Marathi   |
| Mangalore                      | India        | Orija     |
| Mangalore                      | India        | Punjabi   |
| Mangalore                      | India        | Tamil     |
| Mangalore                      | India        | Telugu    |
| Mangalore                      | India        | Urdu      |
| Dehra Dun                      | India        | Asami     |
| Dehra Dun                      | India        | Bengali   |
| Dehra Dun                      | India        | Gujarati  |
| Dehra Dun                      | India        | Hindi     |
| Dehra Dun                      | India        | Kannada   |
| Dehra Dun                      | India        | Malajalam |
| Dehra Dun                      | India        | Marathi   |
| Dehra Dun                      | India        | Orija     |
| Dehra Dun                      | India        | Punjabi   |
| Dehra Dun                      | India        | Tamil     |
| Dehra Dun                      | India        | Telugu    |
| Dehra Dun                      | India        | Urdu      |
| Kamarhati                      | India        | Asami     |
| Kamarhati                      | India        | Bengali   |
| Kamarhati                      | India        | Gujarati  |
| Kamarhati                      | India        | Hindi     |
| Kamarhati                      | India        | Kannada   |
| Kamarhati                      | India        | Malajalam |
| Kamarhati                      | India        | Marathi   |
| Kamarhati                      | India        | Orija     |
| Kamarhati                      | India        | Punjabi   |
| Kamarhati                      | India        | Tamil     |
| Kamarhati                      | India        | Telugu    |
| Kamarhati                      | India        | Urdu      |
| Davangere                      | India        | Asami     |
| Davangere                      | India        | Bengali   |
| Davangere                      | India        | Gujarati  |
| Davangere                      | India        | Hindi     |
| Davangere                      | India        | Kannada   |
| Davangere                      | India        | Malajalam |
| Davangere                      | India        | Marathi   |
| Davangere                      | India        | Orija     |
| Davangere                      | India        | Punjabi   |
| Davangere                      | India        | Tamil     |
| Davangere                      | India        | Telugu    |
| Davangere                      | India        | Urdu      |
| Asansol                        | India        | Asami     |
| Asansol                        | India        | Bengali   |
| Asansol                        | India        | Gujarati  |
| Asansol                        | India        | Hindi     |
| Asansol                        | India        | Kannada   |
| Asansol                        | India        | Malajalam |
| Asansol                        | India        | Marathi   |
| Asansol                        | India        | Orija     |
| Asansol                        | India        | Punjabi   |
| Asansol                        | India        | Tamil     |
| Asansol                        | India        | Telugu    |
| Asansol                        | India        | Urdu      |
| Bhagalpur                      | India        | Asami     |
| Bhagalpur                      | India        | Bengali   |
| Bhagalpur                      | India        | Gujarati  |
| Bhagalpur                      | India        | Hindi     |
| Bhagalpur                      | India        | Kannada   |
| Bhagalpur                      | India        | Malajalam |
| Bhagalpur                      | India        | Marathi   |
| Bhagalpur                      | India        | Orija     |
| Bhagalpur                      | India        | Punjabi   |
| Bhagalpur                      | India        | Tamil     |
| Bhagalpur                      | India        | Telugu    |
| Bhagalpur                      | India        | Urdu      |
| Bellary                        | India        | Asami     |
| Bellary                        | India        | Bengali   |
| Bellary                        | India        | Gujarati  |
| Bellary                        | India        | Hindi     |
| Bellary                        | India        | Kannada   |
| Bellary                        | India        | Malajalam |
| Bellary                        | India        | Marathi   |
| Bellary                        | India        | Orija     |
| Bellary                        | India        | Punjabi   |
| Bellary                        | India        | Tamil     |
| Bellary                        | India        | Telugu    |
| Bellary                        | India        | Urdu      |
| Barddhaman (Burdwan)           | India        | Asami     |
| Barddhaman (Burdwan)           | India        | Bengali   |
| Barddhaman (Burdwan)           | India        | Gujarati  |
| Barddhaman (Burdwan)           | India        | Hindi     |
| Barddhaman (Burdwan)           | India        | Kannada   |
| Barddhaman (Burdwan)           | India        | Malajalam |
| Barddhaman (Burdwan)           | India        | Marathi   |
| Barddhaman (Burdwan)           | India        | Orija     |
| Barddhaman (Burdwan)           | India        | Punjabi   |
| Barddhaman (Burdwan)           | India        | Tamil     |
| Barddhaman (Burdwan)           | India        | Telugu    |
| Barddhaman (Burdwan)           | India        | Urdu      |
| Rampur                         | India        | Asami     |
| Rampur                         | India        | Bengali   |
| Rampur                         | India        | Gujarati  |
| Rampur                         | India        | Hindi     |
| Rampur                         | India        | Kannada   |
| Rampur                         | India        | Malajalam |
| Rampur                         | India        | Marathi   |
| Rampur                         | India        | Orija     |
| Rampur                         | India        | Punjabi   |
| Rampur                         | India        | Tamil     |
| Rampur                         | India        | Telugu    |
| Rampur                         | India        | Urdu      |
| Jalgaon                        | India        | Asami     |
| Jalgaon                        | India        | Bengali   |
| Jalgaon                        | India        | Gujarati  |
| Jalgaon                        | India        | Hindi     |
| Jalgaon                        | India        | Kannada   |
| Jalgaon                        | India        | Malajalam |
| Jalgaon                        | India        | Marathi   |
| Jalgaon                        | India        | Orija     |
| Jalgaon                        | India        | Punjabi   |
| Jalgaon                        | India        | Tamil     |
| Jalgaon                        | India        | Telugu    |
| Jalgaon                        | India        | Urdu      |
| Muzaffarpur                    | India        | Asami     |
| Muzaffarpur                    | India        | Bengali   |
| Muzaffarpur                    | India        | Gujarati  |
| Muzaffarpur                    | India        | Hindi     |
| Muzaffarpur                    | India        | Kannada   |
| Muzaffarpur                    | India        | Malajalam |
| Muzaffarpur                    | India        | Marathi   |
| Muzaffarpur                    | India        | Orija     |
| Muzaffarpur                    | India        | Punjabi   |
| Muzaffarpur                    | India        | Tamil     |
| Muzaffarpur                    | India        | Telugu    |
| Muzaffarpur                    | India        | Urdu      |
| Nizamabad                      | India        | Asami     |
| Nizamabad                      | India        | Bengali   |
| Nizamabad                      | India        | Gujarati  |
| Nizamabad                      | India        | Hindi     |
| Nizamabad                      | India        | Kannada   |
| Nizamabad                      | India        | Malajalam |
| Nizamabad                      | India        | Marathi   |
| Nizamabad                      | India        | Orija     |
| Nizamabad                      | India        | Punjabi   |
| Nizamabad                      | India        | Tamil     |
| Nizamabad                      | India        | Telugu    |
| Nizamabad                      | India        | Urdu      |
| Muzaffarnagar                  | India        | Asami     |
| Muzaffarnagar                  | India        | Bengali   |
| Muzaffarnagar                  | India        | Gujarati  |
| Muzaffarnagar                  | India        | Hindi     |
| Muzaffarnagar                  | India        | Kannada   |
| Muzaffarnagar                  | India        | Malajalam |
| Muzaffarnagar                  | India        | Marathi   |
| Muzaffarnagar                  | India        | Orija     |
| Muzaffarnagar                  | India        | Punjabi   |
| Muzaffarnagar                  | India        | Tamil     |
| Muzaffarnagar                  | India        | Telugu    |
| Muzaffarnagar                  | India        | Urdu      |
| Patiala                        | India        | Asami     |
| Patiala                        | India        | Bengali   |
| Patiala                        | India        | Gujarati  |
| Patiala                        | India        | Hindi     |
| Patiala                        | India        | Kannada   |
| Patiala                        | India        | Malajalam |
| Patiala                        | India        | Marathi   |
| Patiala                        | India        | Orija     |
| Patiala                        | India        | Punjabi   |
| Patiala                        | India        | Tamil     |
| Patiala                        | India        | Telugu    |
| Patiala                        | India        | Urdu      |
| Shahjahanpur                   | India        | Asami     |
| Shahjahanpur                   | India        | Bengali   |
| Shahjahanpur                   | India        | Gujarati  |
| Shahjahanpur                   | India        | Hindi     |
| Shahjahanpur                   | India        | Kannada   |
| Shahjahanpur                   | India        | Malajalam |
| Shahjahanpur                   | India        | Marathi   |
| Shahjahanpur                   | India        | Orija     |
| Shahjahanpur                   | India        | Punjabi   |
| Shahjahanpur                   | India        | Tamil     |
| Shahjahanpur                   | India        | Telugu    |
| Shahjahanpur                   | India        | Urdu      |
| Kurnool                        | India        | Asami     |
| Kurnool                        | India        | Bengali   |
| Kurnool                        | India        | Gujarati  |
| Kurnool                        | India        | Hindi     |
| Kurnool                        | India        | Kannada   |
| Kurnool                        | India        | Malajalam |
| Kurnool                        | India        | Marathi   |
| Kurnool                        | India        | Orija     |
| Kurnool                        | India        | Punjabi   |
| Kurnool                        | India        | Tamil     |
| Kurnool                        | India        | Telugu    |
| Kurnool                        | India        | Urdu      |
| Tiruppur (Tirupper)            | India        | Asami     |
| Tiruppur (Tirupper)            | India        | Bengali   |
| Tiruppur (Tirupper)            | India        | Gujarati  |
| Tiruppur (Tirupper)            | India        | Hindi     |
| Tiruppur (Tirupper)            | India        | Kannada   |
| Tiruppur (Tirupper)            | India        | Malajalam |
| Tiruppur (Tirupper)            | India        | Marathi   |
| Tiruppur (Tirupper)            | India        | Orija     |
| Tiruppur (Tirupper)            | India        | Punjabi   |
| Tiruppur (Tirupper)            | India        | Tamil     |
| Tiruppur (Tirupper)            | India        | Telugu    |
| Tiruppur (Tirupper)            | India        | Urdu      |
| Rohtak                         | India        | Asami     |
| Rohtak                         | India        | Bengali   |
| Rohtak                         | India        | Gujarati  |
| Rohtak                         | India        | Hindi     |
| Rohtak                         | India        | Kannada   |
| Rohtak                         | India        | Malajalam |
| Rohtak                         | India        | Marathi   |
| Rohtak                         | India        | Orija     |
| Rohtak                         | India        | Punjabi   |
| Rohtak                         | India        | Tamil     |
| Rohtak                         | India        | Telugu    |
| Rohtak                         | India        | Urdu      |
| South Dum Dum                  | India        | Asami     |
| South Dum Dum                  | India        | Bengali   |
| South Dum Dum                  | India        | Gujarati  |
| South Dum Dum                  | India        | Hindi     |
| South Dum Dum                  | India        | Kannada   |
| South Dum Dum                  | India        | Malajalam |
| South Dum Dum                  | India        | Marathi   |
| South Dum Dum                  | India        | Orija     |
| South Dum Dum                  | India        | Punjabi   |
| South Dum Dum                  | India        | Tamil     |
| South Dum Dum                  | India        | Telugu    |
| South Dum Dum                  | India        | Urdu      |
| Mathura                        | India        | Asami     |
| Mathura                        | India        | Bengali   |
| Mathura                        | India        | Gujarati  |
| Mathura                        | India        | Hindi     |
| Mathura                        | India        | Kannada   |
| Mathura                        | India        | Malajalam |
| Mathura                        | India        | Marathi   |
| Mathura                        | India        | Orija     |
| Mathura                        | India        | Punjabi   |
| Mathura                        | India        | Tamil     |
| Mathura                        | India        | Telugu    |
| Mathura                        | India        | Urdu      |
| Chandrapur                     | India        | Asami     |
| Chandrapur                     | India        | Bengali   |
| Chandrapur                     | India        | Gujarati  |
| Chandrapur                     | India        | Hindi     |
| Chandrapur                     | India        | Kannada   |
| Chandrapur                     | India        | Malajalam |
| Chandrapur                     | India        | Marathi   |
| Chandrapur                     | India        | Orija     |
| Chandrapur                     | India        | Punjabi   |
| Chandrapur                     | India        | Tamil     |
| Chandrapur                     | India        | Telugu    |
| Chandrapur                     | India        | Urdu      |
| Barahanagar (Baranagar)        | India        | Asami     |
| Barahanagar (Baranagar)        | India        | Bengali   |
| Barahanagar (Baranagar)        | India        | Gujarati  |
| Barahanagar (Baranagar)        | India        | Hindi     |
| Barahanagar (Baranagar)        | India        | Kannada   |
| Barahanagar (Baranagar)        | India        | Malajalam |
| Barahanagar (Baranagar)        | India        | Marathi   |
| Barahanagar (Baranagar)        | India        | Orija     |
| Barahanagar (Baranagar)        | India        | Punjabi   |
| Barahanagar (Baranagar)        | India        | Tamil     |
| Barahanagar (Baranagar)        | India        | Telugu    |
| Barahanagar (Baranagar)        | India        | Urdu      |
| Darbhanga                      | India        | Asami     |
| Darbhanga                      | India        | Bengali   |
| Darbhanga                      | India        | Gujarati  |
| Darbhanga                      | India        | Hindi     |
| Darbhanga                      | India        | Kannada   |
| Darbhanga                      | India        | Malajalam |
| Darbhanga                      | India        | Marathi   |
| Darbhanga                      | India        | Orija     |
| Darbhanga                      | India        | Punjabi   |
| Darbhanga                      | India        | Tamil     |
| Darbhanga                      | India        | Telugu    |
| Darbhanga                      | India        | Urdu      |
| Siliguri (Shiliguri)           | India        | Asami     |
| Siliguri (Shiliguri)           | India        | Bengali   |
| Siliguri (Shiliguri)           | India        | Gujarati  |
| Siliguri (Shiliguri)           | India        | Hindi     |
| Siliguri (Shiliguri)           | India        | Kannada   |
| Siliguri (Shiliguri)           | India        | Malajalam |
| Siliguri (Shiliguri)           | India        | Marathi   |
| Siliguri (Shiliguri)           | India        | Orija     |
| Siliguri (Shiliguri)           | India        | Punjabi   |
| Siliguri (Shiliguri)           | India        | Tamil     |
| Siliguri (Shiliguri)           | India        | Telugu    |
| Siliguri (Shiliguri)           | India        | Urdu      |
| Raurkela                       | India        | Asami     |
| Raurkela                       | India        | Bengali   |
| Raurkela                       | India        | Gujarati  |
| Raurkela                       | India        | Hindi     |
| Raurkela                       | India        | Kannada   |
| Raurkela                       | India        | Malajalam |
| Raurkela                       | India        | Marathi   |
| Raurkela                       | India        | Orija     |
| Raurkela                       | India        | Punjabi   |
| Raurkela                       | India        | Tamil     |
| Raurkela                       | India        | Telugu    |
| Raurkela                       | India        | Urdu      |
| Ambattur                       | India        | Asami     |
| Ambattur                       | India        | Bengali   |
| Ambattur                       | India        | Gujarati  |
| Ambattur                       | India        | Hindi     |
| Ambattur                       | India        | Kannada   |
| Ambattur                       | India        | Malajalam |
| Ambattur                       | India        | Marathi   |
| Ambattur                       | India        | Orija     |
| Ambattur                       | India        | Punjabi   |
| Ambattur                       | India        | Tamil     |
| Ambattur                       | India        | Telugu    |
| Ambattur                       | India        | Urdu      |
| Panipat                        | India        | Asami     |
| Panipat                        | India        | Bengali   |
| Panipat                        | India        | Gujarati  |
| Panipat                        | India        | Hindi     |
| Panipat                        | India        | Kannada   |
| Panipat                        | India        | Malajalam |
| Panipat                        | India        | Marathi   |
| Panipat                        | India        | Orija     |
| Panipat                        | India        | Punjabi   |
| Panipat                        | India        | Tamil     |
| Panipat                        | India        | Telugu    |
| Panipat                        | India        | Urdu      |
| Firozabad                      | India        | Asami     |
| Firozabad                      | India        | Bengali   |
| Firozabad                      | India        | Gujarati  |
| Firozabad                      | India        | Hindi     |
| Firozabad                      | India        | Kannada   |
| Firozabad                      | India        | Malajalam |
| Firozabad                      | India        | Marathi   |
| Firozabad                      | India        | Orija     |
| Firozabad                      | India        | Punjabi   |
| Firozabad                      | India        | Tamil     |
| Firozabad                      | India        | Telugu    |
| Firozabad                      | India        | Urdu      |
| Ichalkaranji                   | India        | Asami     |
| Ichalkaranji                   | India        | Bengali   |
| Ichalkaranji                   | India        | Gujarati  |
| Ichalkaranji                   | India        | Hindi     |
| Ichalkaranji                   | India        | Kannada   |
| Ichalkaranji                   | India        | Malajalam |
| Ichalkaranji                   | India        | Marathi   |
| Ichalkaranji                   | India        | Orija     |
| Ichalkaranji                   | India        | Punjabi   |
| Ichalkaranji                   | India        | Tamil     |
| Ichalkaranji                   | India        | Telugu    |
| Ichalkaranji                   | India        | Urdu      |
| Jammu                          | India        | Asami     |
| Jammu                          | India        | Bengali   |
| Jammu                          | India        | Gujarati  |
| Jammu                          | India        | Hindi     |
| Jammu                          | India        | Kannada   |
| Jammu                          | India        | Malajalam |
| Jammu                          | India        | Marathi   |
| Jammu                          | India        | Orija     |
| Jammu                          | India        | Punjabi   |
| Jammu                          | India        | Tamil     |
| Jammu                          | India        | Telugu    |
| Jammu                          | India        | Urdu      |
| Ramagundam                     | India        | Asami     |
| Ramagundam                     | India        | Bengali   |
| Ramagundam                     | India        | Gujarati  |
| Ramagundam                     | India        | Hindi     |
| Ramagundam                     | India        | Kannada   |
| Ramagundam                     | India        | Malajalam |
| Ramagundam                     | India        | Marathi   |
| Ramagundam                     | India        | Orija     |
| Ramagundam                     | India        | Punjabi   |
| Ramagundam                     | India        | Tamil     |
| Ramagundam                     | India        | Telugu    |
| Ramagundam                     | India        | Urdu      |
| Eluru                          | India        | Asami     |
| Eluru                          | India        | Bengali   |
| Eluru                          | India        | Gujarati  |
| Eluru                          | India        | Hindi     |
| Eluru                          | India        | Kannada   |
| Eluru                          | India        | Malajalam |
| Eluru                          | India        | Marathi   |
| Eluru                          | India        | Orija     |
| Eluru                          | India        | Punjabi   |
| Eluru                          | India        | Tamil     |
| Eluru                          | India        | Telugu    |
| Eluru                          | India        | Urdu      |
| Brahmapur                      | India        | Asami     |
| Brahmapur                      | India        | Bengali   |
| Brahmapur                      | India        | Gujarati  |
| Brahmapur                      | India        | Hindi     |
| Brahmapur                      | India        | Kannada   |
| Brahmapur                      | India        | Malajalam |
| Brahmapur                      | India        | Marathi   |
| Brahmapur                      | India        | Orija     |
| Brahmapur                      | India        | Punjabi   |
| Brahmapur                      | India        | Tamil     |
| Brahmapur                      | India        | Telugu    |
| Brahmapur                      | India        | Urdu      |
| Alwar                          | India        | Asami     |
| Alwar                          | India        | Bengali   |
| Alwar                          | India        | Gujarati  |
| Alwar                          | India        | Hindi     |
| Alwar                          | India        | Kannada   |
| Alwar                          | India        | Malajalam |
| Alwar                          | India        | Marathi   |
| Alwar                          | India        | Orija     |
| Alwar                          | India        | Punjabi   |
| Alwar                          | India        | Tamil     |
| Alwar                          | India        | Telugu    |
| Alwar                          | India        | Urdu      |
| Pondicherry                    | India        | Asami     |
| Pondicherry                    | India        | Bengali   |
| Pondicherry                    | India        | Gujarati  |
| Pondicherry                    | India        | Hindi     |
| Pondicherry                    | India        | Kannada   |
| Pondicherry                    | India        | Malajalam |
| Pondicherry                    | India        | Marathi   |
| Pondicherry                    | India        | Orija     |
| Pondicherry                    | India        | Punjabi   |
| Pondicherry                    | India        | Tamil     |
| Pondicherry                    | India        | Telugu    |
| Pondicherry                    | India        | Urdu      |
| Thanjavur                      | India        | Asami     |
| Thanjavur                      | India        | Bengali   |
| Thanjavur                      | India        | Gujarati  |
| Thanjavur                      | India        | Hindi     |
| Thanjavur                      | India        | Kannada   |
| Thanjavur                      | India        | Malajalam |
| Thanjavur                      | India        | Marathi   |
| Thanjavur                      | India        | Orija     |
| Thanjavur                      | India        | Punjabi   |
| Thanjavur                      | India        | Tamil     |
| Thanjavur                      | India        | Telugu    |
| Thanjavur                      | India        | Urdu      |
| Bihar Sharif                   | India        | Asami     |
| Bihar Sharif                   | India        | Bengali   |
| Bihar Sharif                   | India        | Gujarati  |
| Bihar Sharif                   | India        | Hindi     |
| Bihar Sharif                   | India        | Kannada   |
| Bihar Sharif                   | India        | Malajalam |
| Bihar Sharif                   | India        | Marathi   |
| Bihar Sharif                   | India        | Orija     |
| Bihar Sharif                   | India        | Punjabi   |
| Bihar Sharif                   | India        | Tamil     |
| Bihar Sharif                   | India        | Telugu    |
| Bihar Sharif                   | India        | Urdu      |
| Tuticorin                      | India        | Asami     |
| Tuticorin                      | India        | Bengali   |
| Tuticorin                      | India        | Gujarati  |
| Tuticorin                      | India        | Hindi     |
| Tuticorin                      | India        | Kannada   |
| Tuticorin                      | India        | Malajalam |
| Tuticorin                      | India        | Marathi   |
| Tuticorin                      | India        | Orija     |
| Tuticorin                      | India        | Punjabi   |
| Tuticorin                      | India        | Tamil     |
| Tuticorin                      | India        | Telugu    |
| Tuticorin                      | India        | Urdu      |
| Imphal                         | India        | Asami     |
| Imphal                         | India        | Bengali   |
| Imphal                         | India        | Gujarati  |
| Imphal                         | India        | Hindi     |
| Imphal                         | India        | Kannada   |
| Imphal                         | India        | Malajalam |
| Imphal                         | India        | Marathi   |
| Imphal                         | India        | Orija     |
| Imphal                         | India        | Punjabi   |
| Imphal                         | India        | Tamil     |
| Imphal                         | India        | Telugu    |
| Imphal                         | India        | Urdu      |
| Latur                          | India        | Asami     |
| Latur                          | India        | Bengali   |
| Latur                          | India        | Gujarati  |
| Latur                          | India        | Hindi     |
| Latur                          | India        | Kannada   |
| Latur                          | India        | Malajalam |
| Latur                          | India        | Marathi   |
| Latur                          | India        | Orija     |
| Latur                          | India        | Punjabi   |
| Latur                          | India        | Tamil     |
| Latur                          | India        | Telugu    |
| Latur                          | India        | Urdu      |
| Sagar                          | India        | Asami     |
| Sagar                          | India        | Bengali   |
| Sagar                          | India        | Gujarati  |
| Sagar                          | India        | Hindi     |
| Sagar                          | India        | Kannada   |
| Sagar                          | India        | Malajalam |
| Sagar                          | India        | Marathi   |
| Sagar                          | India        | Orija     |
| Sagar                          | India        | Punjabi   |
| Sagar                          | India        | Tamil     |
| Sagar                          | India        | Telugu    |
| Sagar                          | India        | Urdu      |
| Farrukhabad-cum-Fatehgarh      | India        | Asami     |
| Farrukhabad-cum-Fatehgarh      | India        | Bengali   |
| Farrukhabad-cum-Fatehgarh      | India        | Gujarati  |
| Farrukhabad-cum-Fatehgarh      | India        | Hindi     |
| Farrukhabad-cum-Fatehgarh      | India        | Kannada   |
| Farrukhabad-cum-Fatehgarh      | India        | Malajalam |
| Farrukhabad-cum-Fatehgarh      | India        | Marathi   |
| Farrukhabad-cum-Fatehgarh      | India        | Orija     |
| Farrukhabad-cum-Fatehgarh      | India        | Punjabi   |
| Farrukhabad-cum-Fatehgarh      | India        | Tamil     |
| Farrukhabad-cum-Fatehgarh      | India        | Telugu    |
| Farrukhabad-cum-Fatehgarh      | India        | Urdu      |
| Sangli                         | India        | Asami     |
| Sangli                         | India        | Bengali   |
| Sangli                         | India        | Gujarati  |
| Sangli                         | India        | Hindi     |
| Sangli                         | India        | Kannada   |
| Sangli                         | India        | Malajalam |
| Sangli                         | India        | Marathi   |
| Sangli                         | India        | Orija     |
| Sangli                         | India        | Punjabi   |
| Sangli                         | India        | Tamil     |
| Sangli                         | India        | Telugu    |
| Sangli                         | India        | Urdu      |
| Parbhani                       | India        | Asami     |
| Parbhani                       | India        | Bengali   |
| Parbhani                       | India        | Gujarati  |
| Parbhani                       | India        | Hindi     |
| Parbhani                       | India        | Kannada   |
| Parbhani                       | India        | Malajalam |
| Parbhani                       | India        | Marathi   |
| Parbhani                       | India        | Orija     |
| Parbhani                       | India        | Punjabi   |
| Parbhani                       | India        | Tamil     |
| Parbhani                       | India        | Telugu    |
| Parbhani                       | India        | Urdu      |
| Nagar Coil                     | India        | Asami     |
| Nagar Coil                     | India        | Bengali   |
| Nagar Coil                     | India        | Gujarati  |
| Nagar Coil                     | India        | Hindi     |
| Nagar Coil                     | India        | Kannada   |
| Nagar Coil                     | India        | Malajalam |
| Nagar Coil                     | India        | Marathi   |
| Nagar Coil                     | India        | Orija     |
| Nagar Coil                     | India        | Punjabi   |
| Nagar Coil                     | India        | Tamil     |
| Nagar Coil                     | India        | Telugu    |
| Nagar Coil                     | India        | Urdu      |
| Bijapur                        | India        | Asami     |
| Bijapur                        | India        | Bengali   |
| Bijapur                        | India        | Gujarati  |
| Bijapur                        | India        | Hindi     |
| Bijapur                        | India        | Kannada   |
| Bijapur                        | India        | Malajalam |
| Bijapur                        | India        | Marathi   |
| Bijapur                        | India        | Orija     |
| Bijapur                        | India        | Punjabi   |
| Bijapur                        | India        | Tamil     |
| Bijapur                        | India        | Telugu    |
| Bijapur                        | India        | Urdu      |
| Kukatpalle                     | India        | Asami     |
| Kukatpalle                     | India        | Bengali   |
| Kukatpalle                     | India        | Gujarati  |
| Kukatpalle                     | India        | Hindi     |
| Kukatpalle                     | India        | Kannada   |
| Kukatpalle                     | India        | Malajalam |
| Kukatpalle                     | India        | Marathi   |
| Kukatpalle                     | India        | Orija     |
| Kukatpalle                     | India        | Punjabi   |
| Kukatpalle                     | India        | Tamil     |
| Kukatpalle                     | India        | Telugu    |
| Kukatpalle                     | India        | Urdu      |
| Bally                          | India        | Asami     |
| Bally                          | India        | Bengali   |
| Bally                          | India        | Gujarati  |
| Bally                          | India        | Hindi     |
| Bally                          | India        | Kannada   |
| Bally                          | India        | Malajalam |
| Bally                          | India        | Marathi   |
| Bally                          | India        | Orija     |
| Bally                          | India        | Punjabi   |
| Bally                          | India        | Tamil     |
| Bally                          | India        | Telugu    |
| Bally                          | India        | Urdu      |
| Bhilwara                       | India        | Asami     |
| Bhilwara                       | India        | Bengali   |
| Bhilwara                       | India        | Gujarati  |
| Bhilwara                       | India        | Hindi     |
| Bhilwara                       | India        | Kannada   |
| Bhilwara                       | India        | Malajalam |
| Bhilwara                       | India        | Marathi   |
| Bhilwara                       | India        | Orija     |
| Bhilwara                       | India        | Punjabi   |
| Bhilwara                       | India        | Tamil     |
| Bhilwara                       | India        | Telugu    |
| Bhilwara                       | India        | Urdu      |
| Ratlam                         | India        | Asami     |
| Ratlam                         | India        | Bengali   |
| Ratlam                         | India        | Gujarati  |
| Ratlam                         | India        | Hindi     |
| Ratlam                         | India        | Kannada   |
| Ratlam                         | India        | Malajalam |
| Ratlam                         | India        | Marathi   |
| Ratlam                         | India        | Orija     |
| Ratlam                         | India        | Punjabi   |
| Ratlam                         | India        | Tamil     |
| Ratlam                         | India        | Telugu    |
| Ratlam                         | India        | Urdu      |
| Avadi                          | India        | Asami     |
| Avadi                          | India        | Bengali   |
| Avadi                          | India        | Gujarati  |
| Avadi                          | India        | Hindi     |
| Avadi                          | India        | Kannada   |
| Avadi                          | India        | Malajalam |
| Avadi                          | India        | Marathi   |
| Avadi                          | India        | Orija     |
| Avadi                          | India        | Punjabi   |
| Avadi                          | India        | Tamil     |
| Avadi                          | India        | Telugu    |
| Avadi                          | India        | Urdu      |
| Dindigul                       | India        | Asami     |
| Dindigul                       | India        | Bengali   |
| Dindigul                       | India        | Gujarati  |
| Dindigul                       | India        | Hindi     |
| Dindigul                       | India        | Kannada   |
| Dindigul                       | India        | Malajalam |
| Dindigul                       | India        | Marathi   |
| Dindigul                       | India        | Orija     |
| Dindigul                       | India        | Punjabi   |
| Dindigul                       | India        | Tamil     |
| Dindigul                       | India        | Telugu    |
| Dindigul                       | India        | Urdu      |
| Ahmadnagar                     | India        | Asami     |
| Ahmadnagar                     | India        | Bengali   |
| Ahmadnagar                     | India        | Gujarati  |
| Ahmadnagar                     | India        | Hindi     |
| Ahmadnagar                     | India        | Kannada   |
| Ahmadnagar                     | India        | Malajalam |
| Ahmadnagar                     | India        | Marathi   |
| Ahmadnagar                     | India        | Orija     |
| Ahmadnagar                     | India        | Punjabi   |
| Ahmadnagar                     | India        | Tamil     |
| Ahmadnagar                     | India        | Telugu    |
| Ahmadnagar                     | India        | Urdu      |
| Bilaspur                       | India        | Asami     |
| Bilaspur                       | India        | Bengali   |
| Bilaspur                       | India        | Gujarati  |
| Bilaspur                       | India        | Hindi     |
| Bilaspur                       | India        | Kannada   |
| Bilaspur                       | India        | Malajalam |
| Bilaspur                       | India        | Marathi   |
| Bilaspur                       | India        | Orija     |
| Bilaspur                       | India        | Punjabi   |
| Bilaspur                       | India        | Tamil     |
| Bilaspur                       | India        | Telugu    |
| Bilaspur                       | India        | Urdu      |
| Shimoga                        | India        | Asami     |
| Shimoga                        | India        | Bengali   |
| Shimoga                        | India        | Gujarati  |
| Shimoga                        | India        | Hindi     |
| Shimoga                        | India        | Kannada   |
| Shimoga                        | India        | Malajalam |
| Shimoga                        | India        | Marathi   |
| Shimoga                        | India        | Orija     |
| Shimoga                        | India        | Punjabi   |
| Shimoga                        | India        | Tamil     |
| Shimoga                        | India        | Telugu    |
| Shimoga                        | India        | Urdu      |
| Kharagpur                      | India        | Asami     |
| Kharagpur                      | India        | Bengali   |
| Kharagpur                      | India        | Gujarati  |
| Kharagpur                      | India        | Hindi     |
| Kharagpur                      | India        | Kannada   |
| Kharagpur                      | India        | Malajalam |
| Kharagpur                      | India        | Marathi   |
| Kharagpur                      | India        | Orija     |
| Kharagpur                      | India        | Punjabi   |
| Kharagpur                      | India        | Tamil     |
| Kharagpur                      | India        | Telugu    |
| Kharagpur                      | India        | Urdu      |
| Mira Bhayandar                 | India        | Asami     |
| Mira Bhayandar                 | India        | Bengali   |
| Mira Bhayandar                 | India        | Gujarati  |
| Mira Bhayandar                 | India        | Hindi     |
| Mira Bhayandar                 | India        | Kannada   |
| Mira Bhayandar                 | India        | Malajalam |
| Mira Bhayandar                 | India        | Marathi   |
| Mira Bhayandar                 | India        | Orija     |
| Mira Bhayandar                 | India        | Punjabi   |
| Mira Bhayandar                 | India        | Tamil     |
| Mira Bhayandar                 | India        | Telugu    |
| Mira Bhayandar                 | India        | Urdu      |
| Vellore                        | India        | Asami     |
| Vellore                        | India        | Bengali   |
| Vellore                        | India        | Gujarati  |
| Vellore                        | India        | Hindi     |
| Vellore                        | India        | Kannada   |
| Vellore                        | India        | Malajalam |
| Vellore                        | India        | Marathi   |
| Vellore                        | India        | Orija     |
| Vellore                        | India        | Punjabi   |
| Vellore                        | India        | Tamil     |
| Vellore                        | India        | Telugu    |
| Vellore                        | India        | Urdu      |
| Jalna                          | India        | Asami     |
| Jalna                          | India        | Bengali   |
| Jalna                          | India        | Gujarati  |
| Jalna                          | India        | Hindi     |
| Jalna                          | India        | Kannada   |
| Jalna                          | India        | Malajalam |
| Jalna                          | India        | Marathi   |
| Jalna                          | India        | Orija     |
| Jalna                          | India        | Punjabi   |
| Jalna                          | India        | Tamil     |
| Jalna                          | India        | Telugu    |
| Jalna                          | India        | Urdu      |
| Burnpur                        | India        | Asami     |
| Burnpur                        | India        | Bengali   |
| Burnpur                        | India        | Gujarati  |
| Burnpur                        | India        | Hindi     |
| Burnpur                        | India        | Kannada   |
| Burnpur                        | India        | Malajalam |
| Burnpur                        | India        | Marathi   |
| Burnpur                        | India        | Orija     |
| Burnpur                        | India        | Punjabi   |
| Burnpur                        | India        | Tamil     |
| Burnpur                        | India        | Telugu    |
| Burnpur                        | India        | Urdu      |
| Anantapur                      | India        | Asami     |
| Anantapur                      | India        | Bengali   |
| Anantapur                      | India        | Gujarati  |
| Anantapur                      | India        | Hindi     |
| Anantapur                      | India        | Kannada   |
| Anantapur                      | India        | Malajalam |
| Anantapur                      | India        | Marathi   |
| Anantapur                      | India        | Orija     |
| Anantapur                      | India        | Punjabi   |
| Anantapur                      | India        | Tamil     |
| Anantapur                      | India        | Telugu    |
| Anantapur                      | India        | Urdu      |
| Allappuzha (Alleppey)          | India        | Asami     |
| Allappuzha (Alleppey)          | India        | Bengali   |
| Allappuzha (Alleppey)          | India        | Gujarati  |
| Allappuzha (Alleppey)          | India        | Hindi     |
| Allappuzha (Alleppey)          | India        | Kannada   |
| Allappuzha (Alleppey)          | India        | Malajalam |
| Allappuzha (Alleppey)          | India        | Marathi   |
| Allappuzha (Alleppey)          | India        | Orija     |
| Allappuzha (Alleppey)          | India        | Punjabi   |
| Allappuzha (Alleppey)          | India        | Tamil     |
| Allappuzha (Alleppey)          | India        | Telugu    |
| Allappuzha (Alleppey)          | India        | Urdu      |
| Tirupati                       | India        | Asami     |
| Tirupati                       | India        | Bengali   |
| Tirupati                       | India        | Gujarati  |
| Tirupati                       | India        | Hindi     |
| Tirupati                       | India        | Kannada   |
| Tirupati                       | India        | Malajalam |
| Tirupati                       | India        | Marathi   |
| Tirupati                       | India        | Orija     |
| Tirupati                       | India        | Punjabi   |
| Tirupati                       | India        | Tamil     |
| Tirupati                       | India        | Telugu    |
| Tirupati                       | India        | Urdu      |
| Karnal                         | India        | Asami     |
| Karnal                         | India        | Bengali   |
| Karnal                         | India        | Gujarati  |
| Karnal                         | India        | Hindi     |
| Karnal                         | India        | Kannada   |
| Karnal                         | India        | Malajalam |
| Karnal                         | India        | Marathi   |
| Karnal                         | India        | Orija     |
| Karnal                         | India        | Punjabi   |
| Karnal                         | India        | Tamil     |
| Karnal                         | India        | Telugu    |
| Karnal                         | India        | Urdu      |
| Burhanpur                      | India        | Asami     |
| Burhanpur                      | India        | Bengali   |
| Burhanpur                      | India        | Gujarati  |
| Burhanpur                      | India        | Hindi     |
| Burhanpur                      | India        | Kannada   |
| Burhanpur                      | India        | Malajalam |
| Burhanpur                      | India        | Marathi   |
| Burhanpur                      | India        | Orija     |
| Burhanpur                      | India        | Punjabi   |
| Burhanpur                      | India        | Tamil     |
| Burhanpur                      | India        | Telugu    |
| Burhanpur                      | India        | Urdu      |
| Hisar (Hissar)                 | India        | Asami     |
| Hisar (Hissar)                 | India        | Bengali   |
| Hisar (Hissar)                 | India        | Gujarati  |
| Hisar (Hissar)                 | India        | Hindi     |
| Hisar (Hissar)                 | India        | Kannada   |
| Hisar (Hissar)                 | India        | Malajalam |
| Hisar (Hissar)                 | India        | Marathi   |
| Hisar (Hissar)                 | India        | Orija     |
| Hisar (Hissar)                 | India        | Punjabi   |
| Hisar (Hissar)                 | India        | Tamil     |
| Hisar (Hissar)                 | India        | Telugu    |
| Hisar (Hissar)                 | India        | Urdu      |
| Tiruvottiyur                   | India        | Asami     |
| Tiruvottiyur                   | India        | Bengali   |
| Tiruvottiyur                   | India        | Gujarati  |
| Tiruvottiyur                   | India        | Hindi     |
| Tiruvottiyur                   | India        | Kannada   |
| Tiruvottiyur                   | India        | Malajalam |
| Tiruvottiyur                   | India        | Marathi   |
| Tiruvottiyur                   | India        | Orija     |
| Tiruvottiyur                   | India        | Punjabi   |
| Tiruvottiyur                   | India        | Tamil     |
| Tiruvottiyur                   | India        | Telugu    |
| Tiruvottiyur                   | India        | Urdu      |
| Mirzapur-cum-Vindhyachal       | India        | Asami     |
| Mirzapur-cum-Vindhyachal       | India        | Bengali   |
| Mirzapur-cum-Vindhyachal       | India        | Gujarati  |
| Mirzapur-cum-Vindhyachal       | India        | Hindi     |
| Mirzapur-cum-Vindhyachal       | India        | Kannada   |
| Mirzapur-cum-Vindhyachal       | India        | Malajalam |
| Mirzapur-cum-Vindhyachal       | India        | Marathi   |
| Mirzapur-cum-Vindhyachal       | India        | Orija     |
| Mirzapur-cum-Vindhyachal       | India        | Punjabi   |
| Mirzapur-cum-Vindhyachal       | India        | Tamil     |
| Mirzapur-cum-Vindhyachal       | India        | Telugu    |
| Mirzapur-cum-Vindhyachal       | India        | Urdu      |
| Secunderabad                   | India        | Asami     |
| Secunderabad                   | India        | Bengali   |
| Secunderabad                   | India        | Gujarati  |
| Secunderabad                   | India        | Hindi     |
| Secunderabad                   | India        | Kannada   |
| Secunderabad                   | India        | Malajalam |
| Secunderabad                   | India        | Marathi   |
| Secunderabad                   | India        | Orija     |
| Secunderabad                   | India        | Punjabi   |
| Secunderabad                   | India        | Tamil     |
| Secunderabad                   | India        | Telugu    |
| Secunderabad                   | India        | Urdu      |
| Nadiad                         | India        | Asami     |
| Nadiad                         | India        | Bengali   |
| Nadiad                         | India        | Gujarati  |
| Nadiad                         | India        | Hindi     |
| Nadiad                         | India        | Kannada   |
| Nadiad                         | India        | Malajalam |
| Nadiad                         | India        | Marathi   |
| Nadiad                         | India        | Orija     |
| Nadiad                         | India        | Punjabi   |
| Nadiad                         | India        | Tamil     |
| Nadiad                         | India        | Telugu    |
| Nadiad                         | India        | Urdu      |
| Dewas                          | India        | Asami     |
| Dewas                          | India        | Bengali   |
| Dewas                          | India        | Gujarati  |
| Dewas                          | India        | Hindi     |
| Dewas                          | India        | Kannada   |
| Dewas                          | India        | Malajalam |
| Dewas                          | India        | Marathi   |
| Dewas                          | India        | Orija     |
| Dewas                          | India        | Punjabi   |
| Dewas                          | India        | Tamil     |
| Dewas                          | India        | Telugu    |
| Dewas                          | India        | Urdu      |
| Murwara (Katni)                | India        | Asami     |
| Murwara (Katni)                | India        | Bengali   |
| Murwara (Katni)                | India        | Gujarati  |
| Murwara (Katni)                | India        | Hindi     |
| Murwara (Katni)                | India        | Kannada   |
| Murwara (Katni)                | India        | Malajalam |
| Murwara (Katni)                | India        | Marathi   |
| Murwara (Katni)                | India        | Orija     |
| Murwara (Katni)                | India        | Punjabi   |
| Murwara (Katni)                | India        | Tamil     |
| Murwara (Katni)                | India        | Telugu    |
| Murwara (Katni)                | India        | Urdu      |
| Ganganagar                     | India        | Asami     |
| Ganganagar                     | India        | Bengali   |
| Ganganagar                     | India        | Gujarati  |
| Ganganagar                     | India        | Hindi     |
| Ganganagar                     | India        | Kannada   |
| Ganganagar                     | India        | Malajalam |
| Ganganagar                     | India        | Marathi   |
| Ganganagar                     | India        | Orija     |
| Ganganagar                     | India        | Punjabi   |
| Ganganagar                     | India        | Tamil     |
| Ganganagar                     | India        | Telugu    |
| Ganganagar                     | India        | Urdu      |
| Vizianagaram                   | India        | Asami     |
| Vizianagaram                   | India        | Bengali   |
| Vizianagaram                   | India        | Gujarati  |
| Vizianagaram                   | India        | Hindi     |
| Vizianagaram                   | India        | Kannada   |
| Vizianagaram                   | India        | Malajalam |
| Vizianagaram                   | India        | Marathi   |
| Vizianagaram                   | India        | Orija     |
| Vizianagaram                   | India        | Punjabi   |
| Vizianagaram                   | India        | Tamil     |
| Vizianagaram                   | India        | Telugu    |
| Vizianagaram                   | India        | Urdu      |
| Erode                          | India        | Asami     |
| Erode                          | India        | Bengali   |
| Erode                          | India        | Gujarati  |
| Erode                          | India        | Hindi     |
| Erode                          | India        | Kannada   |
| Erode                          | India        | Malajalam |
| Erode                          | India        | Marathi   |
| Erode                          | India        | Orija     |
| Erode                          | India        | Punjabi   |
| Erode                          | India        | Tamil     |
| Erode                          | India        | Telugu    |
| Erode                          | India        | Urdu      |
| Machilipatnam (Masulipatam)    | India        | Asami     |
| Machilipatnam (Masulipatam)    | India        | Bengali   |
| Machilipatnam (Masulipatam)    | India        | Gujarati  |
| Machilipatnam (Masulipatam)    | India        | Hindi     |
| Machilipatnam (Masulipatam)    | India        | Kannada   |
| Machilipatnam (Masulipatam)    | India        | Malajalam |
| Machilipatnam (Masulipatam)    | India        | Marathi   |
| Machilipatnam (Masulipatam)    | India        | Orija     |
| Machilipatnam (Masulipatam)    | India        | Punjabi   |
| Machilipatnam (Masulipatam)    | India        | Tamil     |
| Machilipatnam (Masulipatam)    | India        | Telugu    |
| Machilipatnam (Masulipatam)    | India        | Urdu      |
| Bhatinda (Bathinda)            | India        | Asami     |
| Bhatinda (Bathinda)            | India        | Bengali   |
| Bhatinda (Bathinda)            | India        | Gujarati  |
| Bhatinda (Bathinda)            | India        | Hindi     |
| Bhatinda (Bathinda)            | India        | Kannada   |
| Bhatinda (Bathinda)            | India        | Malajalam |
| Bhatinda (Bathinda)            | India        | Marathi   |
| Bhatinda (Bathinda)            | India        | Orija     |
| Bhatinda (Bathinda)            | India        | Punjabi   |
| Bhatinda (Bathinda)            | India        | Tamil     |
| Bhatinda (Bathinda)            | India        | Telugu    |
| Bhatinda (Bathinda)            | India        | Urdu      |
| Raichur                        | India        | Asami     |
| Raichur                        | India        | Bengali   |
| Raichur                        | India        | Gujarati  |
| Raichur                        | India        | Hindi     |
| Raichur                        | India        | Kannada   |
| Raichur                        | India        | Malajalam |
| Raichur                        | India        | Marathi   |
| Raichur                        | India        | Orija     |
| Raichur                        | India        | Punjabi   |
| Raichur                        | India        | Tamil     |
| Raichur                        | India        | Telugu    |
| Raichur                        | India        | Urdu      |
| Agartala                       | India        | Asami     |
| Agartala                       | India        | Bengali   |
| Agartala                       | India        | Gujarati  |
| Agartala                       | India        | Hindi     |
| Agartala                       | India        | Kannada   |
| Agartala                       | India        | Malajalam |
| Agartala                       | India        | Marathi   |
| Agartala                       | India        | Orija     |
| Agartala                       | India        | Punjabi   |
| Agartala                       | India        | Tamil     |
| Agartala                       | India        | Telugu    |
| Agartala                       | India        | Urdu      |
| Arrah (Ara)                    | India        | Asami     |
| Arrah (Ara)                    | India        | Bengali   |
| Arrah (Ara)                    | India        | Gujarati  |
| Arrah (Ara)                    | India        | Hindi     |
| Arrah (Ara)                    | India        | Kannada   |
| Arrah (Ara)                    | India        | Malajalam |
| Arrah (Ara)                    | India        | Marathi   |
| Arrah (Ara)                    | India        | Orija     |
| Arrah (Ara)                    | India        | Punjabi   |
| Arrah (Ara)                    | India        | Tamil     |
| Arrah (Ara)                    | India        | Telugu    |
| Arrah (Ara)                    | India        | Urdu      |
| Satna                          | India        | Asami     |
| Satna                          | India        | Bengali   |
| Satna                          | India        | Gujarati  |
| Satna                          | India        | Hindi     |
| Satna                          | India        | Kannada   |
| Satna                          | India        | Malajalam |
| Satna                          | India        | Marathi   |
| Satna                          | India        | Orija     |
| Satna                          | India        | Punjabi   |
| Satna                          | India        | Tamil     |
| Satna                          | India        | Telugu    |
| Satna                          | India        | Urdu      |
| Lalbahadur Nagar               | India        | Asami     |
| Lalbahadur Nagar               | India        | Bengali   |
| Lalbahadur Nagar               | India        | Gujarati  |
| Lalbahadur Nagar               | India        | Hindi     |
| Lalbahadur Nagar               | India        | Kannada   |
| Lalbahadur Nagar               | India        | Malajalam |
| Lalbahadur Nagar               | India        | Marathi   |
| Lalbahadur Nagar               | India        | Orija     |
| Lalbahadur Nagar               | India        | Punjabi   |
| Lalbahadur Nagar               | India        | Tamil     |
| Lalbahadur Nagar               | India        | Telugu    |
| Lalbahadur Nagar               | India        | Urdu      |
| Aizawl                         | India        | Asami     |
| Aizawl                         | India        | Bengali   |
| Aizawl                         | India        | Gujarati  |
| Aizawl                         | India        | Hindi     |
| Aizawl                         | India        | Kannada   |
| Aizawl                         | India        | Malajalam |
| Aizawl                         | India        | Marathi   |
| Aizawl                         | India        | Orija     |
| Aizawl                         | India        | Punjabi   |
| Aizawl                         | India        | Tamil     |
| Aizawl                         | India        | Telugu    |
| Aizawl                         | India        | Urdu      |
| Uluberia                       | India        | Asami     |
| Uluberia                       | India        | Bengali   |
| Uluberia                       | India        | Gujarati  |
| Uluberia                       | India        | Hindi     |
| Uluberia                       | India        | Kannada   |
| Uluberia                       | India        | Malajalam |
| Uluberia                       | India        | Marathi   |
| Uluberia                       | India        | Orija     |
| Uluberia                       | India        | Punjabi   |
| Uluberia                       | India        | Tamil     |
| Uluberia                       | India        | Telugu    |
| Uluberia                       | India        | Urdu      |
| Katihar                        | India        | Asami     |
| Katihar                        | India        | Bengali   |
| Katihar                        | India        | Gujarati  |
| Katihar                        | India        | Hindi     |
| Katihar                        | India        | Kannada   |
| Katihar                        | India        | Malajalam |
| Katihar                        | India        | Marathi   |
| Katihar                        | India        | Orija     |
| Katihar                        | India        | Punjabi   |
| Katihar                        | India        | Tamil     |
| Katihar                        | India        | Telugu    |
| Katihar                        | India        | Urdu      |
| Cuddalore                      | India        | Asami     |
| Cuddalore                      | India        | Bengali   |
| Cuddalore                      | India        | Gujarati  |
| Cuddalore                      | India        | Hindi     |
| Cuddalore                      | India        | Kannada   |
| Cuddalore                      | India        | Malajalam |
| Cuddalore                      | India        | Marathi   |
| Cuddalore                      | India        | Orija     |
| Cuddalore                      | India        | Punjabi   |
| Cuddalore                      | India        | Tamil     |
| Cuddalore                      | India        | Telugu    |
| Cuddalore                      | India        | Urdu      |
| Hugli-Chinsurah                | India        | Asami     |
| Hugli-Chinsurah                | India        | Bengali   |
| Hugli-Chinsurah                | India        | Gujarati  |
| Hugli-Chinsurah                | India        | Hindi     |
| Hugli-Chinsurah                | India        | Kannada   |
| Hugli-Chinsurah                | India        | Malajalam |
| Hugli-Chinsurah                | India        | Marathi   |
| Hugli-Chinsurah                | India        | Orija     |
| Hugli-Chinsurah                | India        | Punjabi   |
| Hugli-Chinsurah                | India        | Tamil     |
| Hugli-Chinsurah                | India        | Telugu    |
| Hugli-Chinsurah                | India        | Urdu      |
| Dhanbad                        | India        | Asami     |
| Dhanbad                        | India        | Bengali   |
| Dhanbad                        | India        | Gujarati  |
| Dhanbad                        | India        | Hindi     |
| Dhanbad                        | India        | Kannada   |
| Dhanbad                        | India        | Malajalam |
| Dhanbad                        | India        | Marathi   |
| Dhanbad                        | India        | Orija     |
| Dhanbad                        | India        | Punjabi   |
| Dhanbad                        | India        | Tamil     |
| Dhanbad                        | India        | Telugu    |
| Dhanbad                        | India        | Urdu      |
| Raiganj                        | India        | Asami     |
| Raiganj                        | India        | Bengali   |
| Raiganj                        | India        | Gujarati  |
| Raiganj                        | India        | Hindi     |
| Raiganj                        | India        | Kannada   |
| Raiganj                        | India        | Malajalam |
| Raiganj                        | India        | Marathi   |
| Raiganj                        | India        | Orija     |
| Raiganj                        | India        | Punjabi   |
| Raiganj                        | India        | Tamil     |
| Raiganj                        | India        | Telugu    |
| Raiganj                        | India        | Urdu      |
| Sambhal                        | India        | Asami     |
| Sambhal                        | India        | Bengali   |
| Sambhal                        | India        | Gujarati  |
| Sambhal                        | India        | Hindi     |
| Sambhal                        | India        | Kannada   |
| Sambhal                        | India        | Malajalam |
| Sambhal                        | India        | Marathi   |
| Sambhal                        | India        | Orija     |
| Sambhal                        | India        | Punjabi   |
| Sambhal                        | India        | Tamil     |
| Sambhal                        | India        | Telugu    |
| Sambhal                        | India        | Urdu      |
| Durg                           | India        | Asami     |
| Durg                           | India        | Bengali   |
| Durg                           | India        | Gujarati  |
| Durg                           | India        | Hindi     |
| Durg                           | India        | Kannada   |
| Durg                           | India        | Malajalam |
| Durg                           | India        | Marathi   |
| Durg                           | India        | Orija     |
| Durg                           | India        | Punjabi   |
| Durg                           | India        | Tamil     |
| Durg                           | India        | Telugu    |
| Durg                           | India        | Urdu      |
| Munger (Monghyr)               | India        | Asami     |
| Munger (Monghyr)               | India        | Bengali   |
| Munger (Monghyr)               | India        | Gujarati  |
| Munger (Monghyr)               | India        | Hindi     |
| Munger (Monghyr)               | India        | Kannada   |
| Munger (Monghyr)               | India        | Malajalam |
| Munger (Monghyr)               | India        | Marathi   |
| Munger (Monghyr)               | India        | Orija     |
| Munger (Monghyr)               | India        | Punjabi   |
| Munger (Monghyr)               | India        | Tamil     |
| Munger (Monghyr)               | India        | Telugu    |
| Munger (Monghyr)               | India        | Urdu      |
| Kanchipuram                    | India        | Asami     |
| Kanchipuram                    | India        | Bengali   |
| Kanchipuram                    | India        | Gujarati  |
| Kanchipuram                    | India        | Hindi     |
| Kanchipuram                    | India        | Kannada   |
| Kanchipuram                    | India        | Malajalam |
| Kanchipuram                    | India        | Marathi   |
| Kanchipuram                    | India        | Orija     |
| Kanchipuram                    | India        | Punjabi   |
| Kanchipuram                    | India        | Tamil     |
| Kanchipuram                    | India        | Telugu    |
| Kanchipuram                    | India        | Urdu      |
| North Dum Dum                  | India        | Asami     |
| North Dum Dum                  | India        | Bengali   |
| North Dum Dum                  | India        | Gujarati  |
| North Dum Dum                  | India        | Hindi     |
| North Dum Dum                  | India        | Kannada   |
| North Dum Dum                  | India        | Malajalam |
| North Dum Dum                  | India        | Marathi   |
| North Dum Dum                  | India        | Orija     |
| North Dum Dum                  | India        | Punjabi   |
| North Dum Dum                  | India        | Tamil     |
| North Dum Dum                  | India        | Telugu    |
| North Dum Dum                  | India        | Urdu      |
| Karimnagar                     | India        | Asami     |
| Karimnagar                     | India        | Bengali   |
| Karimnagar                     | India        | Gujarati  |
| Karimnagar                     | India        | Hindi     |
| Karimnagar                     | India        | Kannada   |
| Karimnagar                     | India        | Malajalam |
| Karimnagar                     | India        | Marathi   |
| Karimnagar                     | India        | Orija     |
| Karimnagar                     | India        | Punjabi   |
| Karimnagar                     | India        | Tamil     |
| Karimnagar                     | India        | Telugu    |
| Karimnagar                     | India        | Urdu      |
| Bharatpur                      | India        | Asami     |
| Bharatpur                      | India        | Bengali   |
| Bharatpur                      | India        | Gujarati  |
| Bharatpur                      | India        | Hindi     |
| Bharatpur                      | India        | Kannada   |
| Bharatpur                      | India        | Malajalam |
| Bharatpur                      | India        | Marathi   |
| Bharatpur                      | India        | Orija     |
| Bharatpur                      | India        | Punjabi   |
| Bharatpur                      | India        | Tamil     |
| Bharatpur                      | India        | Telugu    |
| Bharatpur                      | India        | Urdu      |
| Sikar                          | India        | Asami     |
| Sikar                          | India        | Bengali   |
| Sikar                          | India        | Gujarati  |
| Sikar                          | India        | Hindi     |
| Sikar                          | India        | Kannada   |
| Sikar                          | India        | Malajalam |
| Sikar                          | India        | Marathi   |
| Sikar                          | India        | Orija     |
| Sikar                          | India        | Punjabi   |
| Sikar                          | India        | Tamil     |
| Sikar                          | India        | Telugu    |
| Sikar                          | India        | Urdu      |
| Hardwar (Haridwar)             | India        | Asami     |
| Hardwar (Haridwar)             | India        | Bengali   |
| Hardwar (Haridwar)             | India        | Gujarati  |
| Hardwar (Haridwar)             | India        | Hindi     |
| Hardwar (Haridwar)             | India        | Kannada   |
| Hardwar (Haridwar)             | India        | Malajalam |
| Hardwar (Haridwar)             | India        | Marathi   |
| Hardwar (Haridwar)             | India        | Orija     |
| Hardwar (Haridwar)             | India        | Punjabi   |
| Hardwar (Haridwar)             | India        | Tamil     |
| Hardwar (Haridwar)             | India        | Telugu    |
| Hardwar (Haridwar)             | India        | Urdu      |
| Dabgram                        | India        | Asami     |
| Dabgram                        | India        | Bengali   |
| Dabgram                        | India        | Gujarati  |
| Dabgram                        | India        | Hindi     |
| Dabgram                        | India        | Kannada   |
| Dabgram                        | India        | Malajalam |
| Dabgram                        | India        | Marathi   |
| Dabgram                        | India        | Orija     |
| Dabgram                        | India        | Punjabi   |
| Dabgram                        | India        | Tamil     |
| Dabgram                        | India        | Telugu    |
| Dabgram                        | India        | Urdu      |
| Morena                         | India        | Asami     |
| Morena                         | India        | Bengali   |
| Morena                         | India        | Gujarati  |
| Morena                         | India        | Hindi     |
| Morena                         | India        | Kannada   |
| Morena                         | India        | Malajalam |
| Morena                         | India        | Marathi   |
| Morena                         | India        | Orija     |
| Morena                         | India        | Punjabi   |
| Morena                         | India        | Tamil     |
| Morena                         | India        | Telugu    |
| Morena                         | India        | Urdu      |
| Noida                          | India        | Asami     |
| Noida                          | India        | Bengali   |
| Noida                          | India        | Gujarati  |
| Noida                          | India        | Hindi     |
| Noida                          | India        | Kannada   |
| Noida                          | India        | Malajalam |
| Noida                          | India        | Marathi   |
| Noida                          | India        | Orija     |
| Noida                          | India        | Punjabi   |
| Noida                          | India        | Tamil     |
| Noida                          | India        | Telugu    |
| Noida                          | India        | Urdu      |
| Hapur                          | India        | Asami     |
| Hapur                          | India        | Bengali   |
| Hapur                          | India        | Gujarati  |
| Hapur                          | India        | Hindi     |
| Hapur                          | India        | Kannada   |
| Hapur                          | India        | Malajalam |
| Hapur                          | India        | Marathi   |
| Hapur                          | India        | Orija     |
| Hapur                          | India        | Punjabi   |
| Hapur                          | India        | Tamil     |
| Hapur                          | India        | Telugu    |
| Hapur                          | India        | Urdu      |
| Bhusawal                       | India        | Asami     |
| Bhusawal                       | India        | Bengali   |
| Bhusawal                       | India        | Gujarati  |
| Bhusawal                       | India        | Hindi     |
| Bhusawal                       | India        | Kannada   |
| Bhusawal                       | India        | Malajalam |
| Bhusawal                       | India        | Marathi   |
| Bhusawal                       | India        | Orija     |
| Bhusawal                       | India        | Punjabi   |
| Bhusawal                       | India        | Tamil     |
| Bhusawal                       | India        | Telugu    |
| Bhusawal                       | India        | Urdu      |
| Khandwa                        | India        | Asami     |
| Khandwa                        | India        | Bengali   |
| Khandwa                        | India        | Gujarati  |
| Khandwa                        | India        | Hindi     |
| Khandwa                        | India        | Kannada   |
| Khandwa                        | India        | Malajalam |
| Khandwa                        | India        | Marathi   |
| Khandwa                        | India        | Orija     |
| Khandwa                        | India        | Punjabi   |
| Khandwa                        | India        | Tamil     |
| Khandwa                        | India        | Telugu    |
| Khandwa                        | India        | Urdu      |
| Yamuna Nagar                   | India        | Asami     |
| Yamuna Nagar                   | India        | Bengali   |
| Yamuna Nagar                   | India        | Gujarati  |
| Yamuna Nagar                   | India        | Hindi     |
| Yamuna Nagar                   | India        | Kannada   |
| Yamuna Nagar                   | India        | Malajalam |
| Yamuna Nagar                   | India        | Marathi   |
| Yamuna Nagar                   | India        | Orija     |
| Yamuna Nagar                   | India        | Punjabi   |
| Yamuna Nagar                   | India        | Tamil     |
| Yamuna Nagar                   | India        | Telugu    |
| Yamuna Nagar                   | India        | Urdu      |
| Sonipat (Sonepat)              | India        | Asami     |
| Sonipat (Sonepat)              | India        | Bengali   |
| Sonipat (Sonepat)              | India        | Gujarati  |
| Sonipat (Sonepat)              | India        | Hindi     |
| Sonipat (Sonepat)              | India        | Kannada   |
| Sonipat (Sonepat)              | India        | Malajalam |
| Sonipat (Sonepat)              | India        | Marathi   |
| Sonipat (Sonepat)              | India        | Orija     |
| Sonipat (Sonepat)              | India        | Punjabi   |
| Sonipat (Sonepat)              | India        | Tamil     |
| Sonipat (Sonepat)              | India        | Telugu    |
| Sonipat (Sonepat)              | India        | Urdu      |
| Tenali                         | India        | Asami     |
| Tenali                         | India        | Bengali   |
| Tenali                         | India        | Gujarati  |
| Tenali                         | India        | Hindi     |
| Tenali                         | India        | Kannada   |
| Tenali                         | India        | Malajalam |
| Tenali                         | India        | Marathi   |
| Tenali                         | India        | Orija     |
| Tenali                         | India        | Punjabi   |
| Tenali                         | India        | Tamil     |
| Tenali                         | India        | Telugu    |
| Tenali                         | India        | Urdu      |
| Raurkela Civil Township        | India        | Asami     |
| Raurkela Civil Township        | India        | Bengali   |
| Raurkela Civil Township        | India        | Gujarati  |
| Raurkela Civil Township        | India        | Hindi     |
| Raurkela Civil Township        | India        | Kannada   |
| Raurkela Civil Township        | India        | Malajalam |
| Raurkela Civil Township        | India        | Marathi   |
| Raurkela Civil Township        | India        | Orija     |
| Raurkela Civil Township        | India        | Punjabi   |
| Raurkela Civil Township        | India        | Tamil     |
| Raurkela Civil Township        | India        | Telugu    |
| Raurkela Civil Township        | India        | Urdu      |
| Kollam (Quilon)                | India        | Asami     |
| Kollam (Quilon)                | India        | Bengali   |
| Kollam (Quilon)                | India        | Gujarati  |
| Kollam (Quilon)                | India        | Hindi     |
| Kollam (Quilon)                | India        | Kannada   |
| Kollam (Quilon)                | India        | Malajalam |
| Kollam (Quilon)                | India        | Marathi   |
| Kollam (Quilon)                | India        | Orija     |
| Kollam (Quilon)                | India        | Punjabi   |
| Kollam (Quilon)                | India        | Tamil     |
| Kollam (Quilon)                | India        | Telugu    |
| Kollam (Quilon)                | India        | Urdu      |
| Kumbakonam                     | India        | Asami     |
| Kumbakonam                     | India        | Bengali   |
| Kumbakonam                     | India        | Gujarati  |
| Kumbakonam                     | India        | Hindi     |
| Kumbakonam                     | India        | Kannada   |
| Kumbakonam                     | India        | Malajalam |
| Kumbakonam                     | India        | Marathi   |
| Kumbakonam                     | India        | Orija     |
| Kumbakonam                     | India        | Punjabi   |
| Kumbakonam                     | India        | Tamil     |
| Kumbakonam                     | India        | Telugu    |
| Kumbakonam                     | India        | Urdu      |
| Ingraj Bazar (English Bazar)   | India        | Asami     |
| Ingraj Bazar (English Bazar)   | India        | Bengali   |
| Ingraj Bazar (English Bazar)   | India        | Gujarati  |
| Ingraj Bazar (English Bazar)   | India        | Hindi     |
| Ingraj Bazar (English Bazar)   | India        | Kannada   |
| Ingraj Bazar (English Bazar)   | India        | Malajalam |
| Ingraj Bazar (English Bazar)   | India        | Marathi   |
| Ingraj Bazar (English Bazar)   | India        | Orija     |
| Ingraj Bazar (English Bazar)   | India        | Punjabi   |
| Ingraj Bazar (English Bazar)   | India        | Tamil     |
| Ingraj Bazar (English Bazar)   | India        | Telugu    |
| Ingraj Bazar (English Bazar)   | India        | Urdu      |
| Timkur                         | India        | Asami     |
| Timkur                         | India        | Bengali   |
| Timkur                         | India        | Gujarati  |
| Timkur                         | India        | Hindi     |
| Timkur                         | India        | Kannada   |
| Timkur                         | India        | Malajalam |
| Timkur                         | India        | Marathi   |
| Timkur                         | India        | Orija     |
| Timkur                         | India        | Punjabi   |
| Timkur                         | India        | Tamil     |
| Timkur                         | India        | Telugu    |
| Timkur                         | India        | Urdu      |
| Amroha                         | India        | Asami     |
| Amroha                         | India        | Bengali   |
| Amroha                         | India        | Gujarati  |
| Amroha                         | India        | Hindi     |
| Amroha                         | India        | Kannada   |
| Amroha                         | India        | Malajalam |
| Amroha                         | India        | Marathi   |
| Amroha                         | India        | Orija     |
| Amroha                         | India        | Punjabi   |
| Amroha                         | India        | Tamil     |
| Amroha                         | India        | Telugu    |
| Amroha                         | India        | Urdu      |
| Serampore                      | India        | Asami     |
| Serampore                      | India        | Bengali   |
| Serampore                      | India        | Gujarati  |
| Serampore                      | India        | Hindi     |
| Serampore                      | India        | Kannada   |
| Serampore                      | India        | Malajalam |
| Serampore                      | India        | Marathi   |
| Serampore                      | India        | Orija     |
| Serampore                      | India        | Punjabi   |
| Serampore                      | India        | Tamil     |
| Serampore                      | India        | Telugu    |
| Serampore                      | India        | Urdu      |
| Chapra                         | India        | Asami     |
| Chapra                         | India        | Bengali   |
| Chapra                         | India        | Gujarati  |
| Chapra                         | India        | Hindi     |
| Chapra                         | India        | Kannada   |
| Chapra                         | India        | Malajalam |
| Chapra                         | India        | Marathi   |
| Chapra                         | India        | Orija     |
| Chapra                         | India        | Punjabi   |
| Chapra                         | India        | Tamil     |
| Chapra                         | India        | Telugu    |
| Chapra                         | India        | Urdu      |
| Pali                           | India        | Asami     |
| Pali                           | India        | Bengali   |
| Pali                           | India        | Gujarati  |
| Pali                           | India        | Hindi     |
| Pali                           | India        | Kannada   |
| Pali                           | India        | Malajalam |
| Pali                           | India        | Marathi   |
| Pali                           | India        | Orija     |
| Pali                           | India        | Punjabi   |
| Pali                           | India        | Tamil     |
| Pali                           | India        | Telugu    |
| Pali                           | India        | Urdu      |
| Maunath Bhanjan                | India        | Asami     |
| Maunath Bhanjan                | India        | Bengali   |
| Maunath Bhanjan                | India        | Gujarati  |
| Maunath Bhanjan                | India        | Hindi     |
| Maunath Bhanjan                | India        | Kannada   |
| Maunath Bhanjan                | India        | Malajalam |
| Maunath Bhanjan                | India        | Marathi   |
| Maunath Bhanjan                | India        | Orija     |
| Maunath Bhanjan                | India        | Punjabi   |
| Maunath Bhanjan                | India        | Tamil     |
| Maunath Bhanjan                | India        | Telugu    |
| Maunath Bhanjan                | India        | Urdu      |
| Adoni                          | India        | Asami     |
| Adoni                          | India        | Bengali   |
| Adoni                          | India        | Gujarati  |
| Adoni                          | India        | Hindi     |
| Adoni                          | India        | Kannada   |
| Adoni                          | India        | Malajalam |
| Adoni                          | India        | Marathi   |
| Adoni                          | India        | Orija     |
| Adoni                          | India        | Punjabi   |
| Adoni                          | India        | Tamil     |
| Adoni                          | India        | Telugu    |
| Adoni                          | India        | Urdu      |
| Jaunpur                        | India        | Asami     |
| Jaunpur                        | India        | Bengali   |
| Jaunpur                        | India        | Gujarati  |
| Jaunpur                        | India        | Hindi     |
| Jaunpur                        | India        | Kannada   |
| Jaunpur                        | India        | Malajalam |
| Jaunpur                        | India        | Marathi   |
| Jaunpur                        | India        | Orija     |
| Jaunpur                        | India        | Punjabi   |
| Jaunpur                        | India        | Tamil     |
| Jaunpur                        | India        | Telugu    |
| Jaunpur                        | India        | Urdu      |
| Tirunelveli                    | India        | Asami     |
| Tirunelveli                    | India        | Bengali   |
| Tirunelveli                    | India        | Gujarati  |
| Tirunelveli                    | India        | Hindi     |
| Tirunelveli                    | India        | Kannada   |
| Tirunelveli                    | India        | Malajalam |
| Tirunelveli                    | India        | Marathi   |
| Tirunelveli                    | India        | Orija     |
| Tirunelveli                    | India        | Punjabi   |
| Tirunelveli                    | India        | Tamil     |
| Tirunelveli                    | India        | Telugu    |
| Tirunelveli                    | India        | Urdu      |
| Bahraich                       | India        | Asami     |
| Bahraich                       | India        | Bengali   |
| Bahraich                       | India        | Gujarati  |
| Bahraich                       | India        | Hindi     |
| Bahraich                       | India        | Kannada   |
| Bahraich                       | India        | Malajalam |
| Bahraich                       | India        | Marathi   |
| Bahraich                       | India        | Orija     |
| Bahraich                       | India        | Punjabi   |
| Bahraich                       | India        | Tamil     |
| Bahraich                       | India        | Telugu    |
| Bahraich                       | India        | Urdu      |
| Gadag Betigeri                 | India        | Asami     |
| Gadag Betigeri                 | India        | Bengali   |
| Gadag Betigeri                 | India        | Gujarati  |
| Gadag Betigeri                 | India        | Hindi     |
| Gadag Betigeri                 | India        | Kannada   |
| Gadag Betigeri                 | India        | Malajalam |
| Gadag Betigeri                 | India        | Marathi   |
| Gadag Betigeri                 | India        | Orija     |
| Gadag Betigeri                 | India        | Punjabi   |
| Gadag Betigeri                 | India        | Tamil     |
| Gadag Betigeri                 | India        | Telugu    |
| Gadag Betigeri                 | India        | Urdu      |
| Proddatur                      | India        | Asami     |
| Proddatur                      | India        | Bengali   |
| Proddatur                      | India        | Gujarati  |
| Proddatur                      | India        | Hindi     |
| Proddatur                      | India        | Kannada   |
| Proddatur                      | India        | Malajalam |
| Proddatur                      | India        | Marathi   |
| Proddatur                      | India        | Orija     |
| Proddatur                      | India        | Punjabi   |
| Proddatur                      | India        | Tamil     |
| Proddatur                      | India        | Telugu    |
| Proddatur                      | India        | Urdu      |
| Chittoor                       | India        | Asami     |
| Chittoor                       | India        | Bengali   |
| Chittoor                       | India        | Gujarati  |
| Chittoor                       | India        | Hindi     |
| Chittoor                       | India        | Kannada   |
| Chittoor                       | India        | Malajalam |
| Chittoor                       | India        | Marathi   |
| Chittoor                       | India        | Orija     |
| Chittoor                       | India        | Punjabi   |
| Chittoor                       | India        | Tamil     |
| Chittoor                       | India        | Telugu    |
| Chittoor                       | India        | Urdu      |
| Barrackpur                     | India        | Asami     |
| Barrackpur                     | India        | Bengali   |
| Barrackpur                     | India        | Gujarati  |
| Barrackpur                     | India        | Hindi     |
| Barrackpur                     | India        | Kannada   |
| Barrackpur                     | India        | Malajalam |
| Barrackpur                     | India        | Marathi   |
| Barrackpur                     | India        | Orija     |
| Barrackpur                     | India        | Punjabi   |
| Barrackpur                     | India        | Tamil     |
| Barrackpur                     | India        | Telugu    |
| Barrackpur                     | India        | Urdu      |
| Bharuch (Broach)               | India        | Asami     |
| Bharuch (Broach)               | India        | Bengali   |
| Bharuch (Broach)               | India        | Gujarati  |
| Bharuch (Broach)               | India        | Hindi     |
| Bharuch (Broach)               | India        | Kannada   |
| Bharuch (Broach)               | India        | Malajalam |
| Bharuch (Broach)               | India        | Marathi   |
| Bharuch (Broach)               | India        | Orija     |
| Bharuch (Broach)               | India        | Punjabi   |
| Bharuch (Broach)               | India        | Tamil     |
| Bharuch (Broach)               | India        | Telugu    |
| Bharuch (Broach)               | India        | Urdu      |
| Naihati                        | India        | Asami     |
| Naihati                        | India        | Bengali   |
| Naihati                        | India        | Gujarati  |
| Naihati                        | India        | Hindi     |
| Naihati                        | India        | Kannada   |
| Naihati                        | India        | Malajalam |
| Naihati                        | India        | Marathi   |
| Naihati                        | India        | Orija     |
| Naihati                        | India        | Punjabi   |
| Naihati                        | India        | Tamil     |
| Naihati                        | India        | Telugu    |
| Naihati                        | India        | Urdu      |
| Shillong                       | India        | Asami     |
| Shillong                       | India        | Bengali   |
| Shillong                       | India        | Gujarati  |
| Shillong                       | India        | Hindi     |
| Shillong                       | India        | Kannada   |
| Shillong                       | India        | Malajalam |
| Shillong                       | India        | Marathi   |
| Shillong                       | India        | Orija     |
| Shillong                       | India        | Punjabi   |
| Shillong                       | India        | Tamil     |
| Shillong                       | India        | Telugu    |
| Shillong                       | India        | Urdu      |
| Sambalpur                      | India        | Asami     |
| Sambalpur                      | India        | Bengali   |
| Sambalpur                      | India        | Gujarati  |
| Sambalpur                      | India        | Hindi     |
| Sambalpur                      | India        | Kannada   |
| Sambalpur                      | India        | Malajalam |
| Sambalpur                      | India        | Marathi   |
| Sambalpur                      | India        | Orija     |
| Sambalpur                      | India        | Punjabi   |
| Sambalpur                      | India        | Tamil     |
| Sambalpur                      | India        | Telugu    |
| Sambalpur                      | India        | Urdu      |
| Junagadh                       | India        | Asami     |
| Junagadh                       | India        | Bengali   |
| Junagadh                       | India        | Gujarati  |
| Junagadh                       | India        | Hindi     |
| Junagadh                       | India        | Kannada   |
| Junagadh                       | India        | Malajalam |
| Junagadh                       | India        | Marathi   |
| Junagadh                       | India        | Orija     |
| Junagadh                       | India        | Punjabi   |
| Junagadh                       | India        | Tamil     |
| Junagadh                       | India        | Telugu    |
| Junagadh                       | India        | Urdu      |
| Rae Bareli                     | India        | Asami     |
| Rae Bareli                     | India        | Bengali   |
| Rae Bareli                     | India        | Gujarati  |
| Rae Bareli                     | India        | Hindi     |
| Rae Bareli                     | India        | Kannada   |
| Rae Bareli                     | India        | Malajalam |
| Rae Bareli                     | India        | Marathi   |
| Rae Bareli                     | India        | Orija     |
| Rae Bareli                     | India        | Punjabi   |
| Rae Bareli                     | India        | Tamil     |
| Rae Bareli                     | India        | Telugu    |
| Rae Bareli                     | India        | Urdu      |
| Rewa                           | India        | Asami     |
| Rewa                           | India        | Bengali   |
| Rewa                           | India        | Gujarati  |
| Rewa                           | India        | Hindi     |
| Rewa                           | India        | Kannada   |
| Rewa                           | India        | Malajalam |
| Rewa                           | India        | Marathi   |
| Rewa                           | India        | Orija     |
| Rewa                           | India        | Punjabi   |
| Rewa                           | India        | Tamil     |
| Rewa                           | India        | Telugu    |
| Rewa                           | India        | Urdu      |
| Gurgaon                        | India        | Asami     |
| Gurgaon                        | India        | Bengali   |
| Gurgaon                        | India        | Gujarati  |
| Gurgaon                        | India        | Hindi     |
| Gurgaon                        | India        | Kannada   |
| Gurgaon                        | India        | Malajalam |
| Gurgaon                        | India        | Marathi   |
| Gurgaon                        | India        | Orija     |
| Gurgaon                        | India        | Punjabi   |
| Gurgaon                        | India        | Tamil     |
| Gurgaon                        | India        | Telugu    |
| Gurgaon                        | India        | Urdu      |
| Khammam                        | India        | Asami     |
| Khammam                        | India        | Bengali   |
| Khammam                        | India        | Gujarati  |
| Khammam                        | India        | Hindi     |
| Khammam                        | India        | Kannada   |
| Khammam                        | India        | Malajalam |
| Khammam                        | India        | Marathi   |
| Khammam                        | India        | Orija     |
| Khammam                        | India        | Punjabi   |
| Khammam                        | India        | Tamil     |
| Khammam                        | India        | Telugu    |
| Khammam                        | India        | Urdu      |
| Bulandshahr                    | India        | Asami     |
| Bulandshahr                    | India        | Bengali   |
| Bulandshahr                    | India        | Gujarati  |
| Bulandshahr                    | India        | Hindi     |
| Bulandshahr                    | India        | Kannada   |
| Bulandshahr                    | India        | Malajalam |
| Bulandshahr                    | India        | Marathi   |
| Bulandshahr                    | India        | Orija     |
| Bulandshahr                    | India        | Punjabi   |
| Bulandshahr                    | India        | Tamil     |
| Bulandshahr                    | India        | Telugu    |
| Bulandshahr                    | India        | Urdu      |
| Navsari                        | India        | Asami     |
| Navsari                        | India        | Bengali   |
| Navsari                        | India        | Gujarati  |
| Navsari                        | India        | Hindi     |
| Navsari                        | India        | Kannada   |
| Navsari                        | India        | Malajalam |
| Navsari                        | India        | Marathi   |
| Navsari                        | India        | Orija     |
| Navsari                        | India        | Punjabi   |
| Navsari                        | India        | Tamil     |
| Navsari                        | India        | Telugu    |
| Navsari                        | India        | Urdu      |
| Malkajgiri                     | India        | Asami     |
| Malkajgiri                     | India        | Bengali   |
| Malkajgiri                     | India        | Gujarati  |
| Malkajgiri                     | India        | Hindi     |
| Malkajgiri                     | India        | Kannada   |
| Malkajgiri                     | India        | Malajalam |
| Malkajgiri                     | India        | Marathi   |
| Malkajgiri                     | India        | Orija     |
| Malkajgiri                     | India        | Punjabi   |
| Malkajgiri                     | India        | Tamil     |
| Malkajgiri                     | India        | Telugu    |
| Malkajgiri                     | India        | Urdu      |
| Midnapore (Medinipur)          | India        | Asami     |
| Midnapore (Medinipur)          | India        | Bengali   |
| Midnapore (Medinipur)          | India        | Gujarati  |
| Midnapore (Medinipur)          | India        | Hindi     |
| Midnapore (Medinipur)          | India        | Kannada   |
| Midnapore (Medinipur)          | India        | Malajalam |
| Midnapore (Medinipur)          | India        | Marathi   |
| Midnapore (Medinipur)          | India        | Orija     |
| Midnapore (Medinipur)          | India        | Punjabi   |
| Midnapore (Medinipur)          | India        | Tamil     |
| Midnapore (Medinipur)          | India        | Telugu    |
| Midnapore (Medinipur)          | India        | Urdu      |
| Miraj                          | India        | Asami     |
| Miraj                          | India        | Bengali   |
| Miraj                          | India        | Gujarati  |
| Miraj                          | India        | Hindi     |
| Miraj                          | India        | Kannada   |
| Miraj                          | India        | Malajalam |
| Miraj                          | India        | Marathi   |
| Miraj                          | India        | Orija     |
| Miraj                          | India        | Punjabi   |
| Miraj                          | India        | Tamil     |
| Miraj                          | India        | Telugu    |
| Miraj                          | India        | Urdu      |
| Raj Nandgaon                   | India        | Asami     |
| Raj Nandgaon                   | India        | Bengali   |
| Raj Nandgaon                   | India        | Gujarati  |
| Raj Nandgaon                   | India        | Hindi     |
| Raj Nandgaon                   | India        | Kannada   |
| Raj Nandgaon                   | India        | Malajalam |
| Raj Nandgaon                   | India        | Marathi   |
| Raj Nandgaon                   | India        | Orija     |
| Raj Nandgaon                   | India        | Punjabi   |
| Raj Nandgaon                   | India        | Tamil     |
| Raj Nandgaon                   | India        | Telugu    |
| Raj Nandgaon                   | India        | Urdu      |
| Alandur                        | India        | Asami     |
| Alandur                        | India        | Bengali   |
| Alandur                        | India        | Gujarati  |
| Alandur                        | India        | Hindi     |
| Alandur                        | India        | Kannada   |
| Alandur                        | India        | Malajalam |
| Alandur                        | India        | Marathi   |
| Alandur                        | India        | Orija     |
| Alandur                        | India        | Punjabi   |
| Alandur                        | India        | Tamil     |
| Alandur                        | India        | Telugu    |
| Alandur                        | India        | Urdu      |
| Puri                           | India        | Asami     |
| Puri                           | India        | Bengali   |
| Puri                           | India        | Gujarati  |
| Puri                           | India        | Hindi     |
| Puri                           | India        | Kannada   |
| Puri                           | India        | Malajalam |
| Puri                           | India        | Marathi   |
| Puri                           | India        | Orija     |
| Puri                           | India        | Punjabi   |
| Puri                           | India        | Tamil     |
| Puri                           | India        | Telugu    |
| Puri                           | India        | Urdu      |
| Navadwip                       | India        | Asami     |
| Navadwip                       | India        | Bengali   |
| Navadwip                       | India        | Gujarati  |
| Navadwip                       | India        | Hindi     |
| Navadwip                       | India        | Kannada   |
| Navadwip                       | India        | Malajalam |
| Navadwip                       | India        | Marathi   |
| Navadwip                       | India        | Orija     |
| Navadwip                       | India        | Punjabi   |
| Navadwip                       | India        | Tamil     |
| Navadwip                       | India        | Telugu    |
| Navadwip                       | India        | Urdu      |
| Sirsa                          | India        | Asami     |
| Sirsa                          | India        | Bengali   |
| Sirsa                          | India        | Gujarati  |
| Sirsa                          | India        | Hindi     |
| Sirsa                          | India        | Kannada   |
| Sirsa                          | India        | Malajalam |
| Sirsa                          | India        | Marathi   |
| Sirsa                          | India        | Orija     |
| Sirsa                          | India        | Punjabi   |
| Sirsa                          | India        | Tamil     |
| Sirsa                          | India        | Telugu    |
| Sirsa                          | India        | Urdu      |
| Korba                          | India        | Asami     |
| Korba                          | India        | Bengali   |
| Korba                          | India        | Gujarati  |
| Korba                          | India        | Hindi     |
| Korba                          | India        | Kannada   |
| Korba                          | India        | Malajalam |
| Korba                          | India        | Marathi   |
| Korba                          | India        | Orija     |
| Korba                          | India        | Punjabi   |
| Korba                          | India        | Tamil     |
| Korba                          | India        | Telugu    |
| Korba                          | India        | Urdu      |
| Faizabad                       | India        | Asami     |
| Faizabad                       | India        | Bengali   |
| Faizabad                       | India        | Gujarati  |
| Faizabad                       | India        | Hindi     |
| Faizabad                       | India        | Kannada   |
| Faizabad                       | India        | Malajalam |
| Faizabad                       | India        | Marathi   |
| Faizabad                       | India        | Orija     |
| Faizabad                       | India        | Punjabi   |
| Faizabad                       | India        | Tamil     |
| Faizabad                       | India        | Telugu    |
| Faizabad                       | India        | Urdu      |
| Etawah                         | India        | Asami     |
| Etawah                         | India        | Bengali   |
| Etawah                         | India        | Gujarati  |
| Etawah                         | India        | Hindi     |
| Etawah                         | India        | Kannada   |
| Etawah                         | India        | Malajalam |
| Etawah                         | India        | Marathi   |
| Etawah                         | India        | Orija     |
| Etawah                         | India        | Punjabi   |
| Etawah                         | India        | Tamil     |
| Etawah                         | India        | Telugu    |
| Etawah                         | India        | Urdu      |
| Pathankot                      | India        | Asami     |
| Pathankot                      | India        | Bengali   |
| Pathankot                      | India        | Gujarati  |
| Pathankot                      | India        | Hindi     |
| Pathankot                      | India        | Kannada   |
| Pathankot                      | India        | Malajalam |
| Pathankot                      | India        | Marathi   |
| Pathankot                      | India        | Orija     |
| Pathankot                      | India        | Punjabi   |
| Pathankot                      | India        | Tamil     |
| Pathankot                      | India        | Telugu    |
| Pathankot                      | India        | Urdu      |
| Gandhinagar                    | India        | Asami     |
| Gandhinagar                    | India        | Bengali   |
| Gandhinagar                    | India        | Gujarati  |
| Gandhinagar                    | India        | Hindi     |
| Gandhinagar                    | India        | Kannada   |
| Gandhinagar                    | India        | Malajalam |
| Gandhinagar                    | India        | Marathi   |
| Gandhinagar                    | India        | Orija     |
| Gandhinagar                    | India        | Punjabi   |
| Gandhinagar                    | India        | Tamil     |
| Gandhinagar                    | India        | Telugu    |
| Gandhinagar                    | India        | Urdu      |
| Palghat (Palakkad)             | India        | Asami     |
| Palghat (Palakkad)             | India        | Bengali   |
| Palghat (Palakkad)             | India        | Gujarati  |
| Palghat (Palakkad)             | India        | Hindi     |
| Palghat (Palakkad)             | India        | Kannada   |
| Palghat (Palakkad)             | India        | Malajalam |
| Palghat (Palakkad)             | India        | Marathi   |
| Palghat (Palakkad)             | India        | Orija     |
| Palghat (Palakkad)             | India        | Punjabi   |
| Palghat (Palakkad)             | India        | Tamil     |
| Palghat (Palakkad)             | India        | Telugu    |
| Palghat (Palakkad)             | India        | Urdu      |
| Veraval                        | India        | Asami     |
| Veraval                        | India        | Bengali   |
| Veraval                        | India        | Gujarati  |
| Veraval                        | India        | Hindi     |
| Veraval                        | India        | Kannada   |
| Veraval                        | India        | Malajalam |
| Veraval                        | India        | Marathi   |
| Veraval                        | India        | Orija     |
| Veraval                        | India        | Punjabi   |
| Veraval                        | India        | Tamil     |
| Veraval                        | India        | Telugu    |
| Veraval                        | India        | Urdu      |
| Hoshiarpur                     | India        | Asami     |
| Hoshiarpur                     | India        | Bengali   |
| Hoshiarpur                     | India        | Gujarati  |
| Hoshiarpur                     | India        | Hindi     |
| Hoshiarpur                     | India        | Kannada   |
| Hoshiarpur                     | India        | Malajalam |
| Hoshiarpur                     | India        | Marathi   |
| Hoshiarpur                     | India        | Orija     |
| Hoshiarpur                     | India        | Punjabi   |
| Hoshiarpur                     | India        | Tamil     |
| Hoshiarpur                     | India        | Telugu    |
| Hoshiarpur                     | India        | Urdu      |
| Ambala                         | India        | Asami     |
| Ambala                         | India        | Bengali   |
| Ambala                         | India        | Gujarati  |
| Ambala                         | India        | Hindi     |
| Ambala                         | India        | Kannada   |
| Ambala                         | India        | Malajalam |
| Ambala                         | India        | Marathi   |
| Ambala                         | India        | Orija     |
| Ambala                         | India        | Punjabi   |
| Ambala                         | India        | Tamil     |
| Ambala                         | India        | Telugu    |
| Ambala                         | India        | Urdu      |
| Sitapur                        | India        | Asami     |
| Sitapur                        | India        | Bengali   |
| Sitapur                        | India        | Gujarati  |
| Sitapur                        | India        | Hindi     |
| Sitapur                        | India        | Kannada   |
| Sitapur                        | India        | Malajalam |
| Sitapur                        | India        | Marathi   |
| Sitapur                        | India        | Orija     |
| Sitapur                        | India        | Punjabi   |
| Sitapur                        | India        | Tamil     |
| Sitapur                        | India        | Telugu    |
| Sitapur                        | India        | Urdu      |
| Bhiwani                        | India        | Asami     |
| Bhiwani                        | India        | Bengali   |
| Bhiwani                        | India        | Gujarati  |
| Bhiwani                        | India        | Hindi     |
| Bhiwani                        | India        | Kannada   |
| Bhiwani                        | India        | Malajalam |
| Bhiwani                        | India        | Marathi   |
| Bhiwani                        | India        | Orija     |
| Bhiwani                        | India        | Punjabi   |
| Bhiwani                        | India        | Tamil     |
| Bhiwani                        | India        | Telugu    |
| Bhiwani                        | India        | Urdu      |
| Cuddapah                       | India        | Asami     |
| Cuddapah                       | India        | Bengali   |
| Cuddapah                       | India        | Gujarati  |
| Cuddapah                       | India        | Hindi     |
| Cuddapah                       | India        | Kannada   |
| Cuddapah                       | India        | Malajalam |
| Cuddapah                       | India        | Marathi   |
| Cuddapah                       | India        | Orija     |
| Cuddapah                       | India        | Punjabi   |
| Cuddapah                       | India        | Tamil     |
| Cuddapah                       | India        | Telugu    |
| Cuddapah                       | India        | Urdu      |
| Bhimavaram                     | India        | Asami     |
| Bhimavaram                     | India        | Bengali   |
| Bhimavaram                     | India        | Gujarati  |
| Bhimavaram                     | India        | Hindi     |
| Bhimavaram                     | India        | Kannada   |
| Bhimavaram                     | India        | Malajalam |
| Bhimavaram                     | India        | Marathi   |
| Bhimavaram                     | India        | Orija     |
| Bhimavaram                     | India        | Punjabi   |
| Bhimavaram                     | India        | Tamil     |
| Bhimavaram                     | India        | Telugu    |
| Bhimavaram                     | India        | Urdu      |
| Krishnanagar                   | India        | Asami     |
| Krishnanagar                   | India        | Bengali   |
| Krishnanagar                   | India        | Gujarati  |
| Krishnanagar                   | India        | Hindi     |
| Krishnanagar                   | India        | Kannada   |
| Krishnanagar                   | India        | Malajalam |
| Krishnanagar                   | India        | Marathi   |
| Krishnanagar                   | India        | Orija     |
| Krishnanagar                   | India        | Punjabi   |
| Krishnanagar                   | India        | Tamil     |
| Krishnanagar                   | India        | Telugu    |
| Krishnanagar                   | India        | Urdu      |
| Chandannagar                   | India        | Asami     |
| Chandannagar                   | India        | Bengali   |
| Chandannagar                   | India        | Gujarati  |
| Chandannagar                   | India        | Hindi     |
| Chandannagar                   | India        | Kannada   |
| Chandannagar                   | India        | Malajalam |
| Chandannagar                   | India        | Marathi   |
| Chandannagar                   | India        | Orija     |
| Chandannagar                   | India        | Punjabi   |
| Chandannagar                   | India        | Tamil     |
| Chandannagar                   | India        | Telugu    |
| Chandannagar                   | India        | Urdu      |
| Mandya                         | India        | Asami     |
| Mandya                         | India        | Bengali   |
| Mandya                         | India        | Gujarati  |
| Mandya                         | India        | Hindi     |
| Mandya                         | India        | Kannada   |
| Mandya                         | India        | Malajalam |
| Mandya                         | India        | Marathi   |
| Mandya                         | India        | Orija     |
| Mandya                         | India        | Punjabi   |
| Mandya                         | India        | Tamil     |
| Mandya                         | India        | Telugu    |
| Mandya                         | India        | Urdu      |
| Dibrugarh                      | India        | Asami     |
| Dibrugarh                      | India        | Bengali   |
| Dibrugarh                      | India        | Gujarati  |
| Dibrugarh                      | India        | Hindi     |
| Dibrugarh                      | India        | Kannada   |
| Dibrugarh                      | India        | Malajalam |
| Dibrugarh                      | India        | Marathi   |
| Dibrugarh                      | India        | Orija     |
| Dibrugarh                      | India        | Punjabi   |
| Dibrugarh                      | India        | Tamil     |
| Dibrugarh                      | India        | Telugu    |
| Dibrugarh                      | India        | Urdu      |
| Nandyal                        | India        | Asami     |
| Nandyal                        | India        | Bengali   |
| Nandyal                        | India        | Gujarati  |
| Nandyal                        | India        | Hindi     |
| Nandyal                        | India        | Kannada   |
| Nandyal                        | India        | Malajalam |
| Nandyal                        | India        | Marathi   |
| Nandyal                        | India        | Orija     |
| Nandyal                        | India        | Punjabi   |
| Nandyal                        | India        | Tamil     |
| Nandyal                        | India        | Telugu    |
| Nandyal                        | India        | Urdu      |
| Balurghat                      | India        | Asami     |
| Balurghat                      | India        | Bengali   |
| Balurghat                      | India        | Gujarati  |
| Balurghat                      | India        | Hindi     |
| Balurghat                      | India        | Kannada   |
| Balurghat                      | India        | Malajalam |
| Balurghat                      | India        | Marathi   |
| Balurghat                      | India        | Orija     |
| Balurghat                      | India        | Punjabi   |
| Balurghat                      | India        | Tamil     |
| Balurghat                      | India        | Telugu    |
| Balurghat                      | India        | Urdu      |
| Neyveli                        | India        | Asami     |
| Neyveli                        | India        | Bengali   |
| Neyveli                        | India        | Gujarati  |
| Neyveli                        | India        | Hindi     |
| Neyveli                        | India        | Kannada   |
| Neyveli                        | India        | Malajalam |
| Neyveli                        | India        | Marathi   |
| Neyveli                        | India        | Orija     |
| Neyveli                        | India        | Punjabi   |
| Neyveli                        | India        | Tamil     |
| Neyveli                        | India        | Telugu    |
| Neyveli                        | India        | Urdu      |
| Fatehpur                       | India        | Asami     |
| Fatehpur                       | India        | Bengali   |
| Fatehpur                       | India        | Gujarati  |
| Fatehpur                       | India        | Hindi     |
| Fatehpur                       | India        | Kannada   |
| Fatehpur                       | India        | Malajalam |
| Fatehpur                       | India        | Marathi   |
| Fatehpur                       | India        | Orija     |
| Fatehpur                       | India        | Punjabi   |
| Fatehpur                       | India        | Tamil     |
| Fatehpur                       | India        | Telugu    |
| Fatehpur                       | India        | Urdu      |
| Mahbubnagar                    | India        | Asami     |
| Mahbubnagar                    | India        | Bengali   |
| Mahbubnagar                    | India        | Gujarati  |
| Mahbubnagar                    | India        | Hindi     |
| Mahbubnagar                    | India        | Kannada   |
| Mahbubnagar                    | India        | Malajalam |
| Mahbubnagar                    | India        | Marathi   |
| Mahbubnagar                    | India        | Orija     |
| Mahbubnagar                    | India        | Punjabi   |
| Mahbubnagar                    | India        | Tamil     |
| Mahbubnagar                    | India        | Telugu    |
| Mahbubnagar                    | India        | Urdu      |
| Budaun                         | India        | Asami     |
| Budaun                         | India        | Bengali   |
| Budaun                         | India        | Gujarati  |
| Budaun                         | India        | Hindi     |
| Budaun                         | India        | Kannada   |
| Budaun                         | India        | Malajalam |
| Budaun                         | India        | Marathi   |
| Budaun                         | India        | Orija     |
| Budaun                         | India        | Punjabi   |
| Budaun                         | India        | Tamil     |
| Budaun                         | India        | Telugu    |
| Budaun                         | India        | Urdu      |
| Porbandar                      | India        | Asami     |
| Porbandar                      | India        | Bengali   |
| Porbandar                      | India        | Gujarati  |
| Porbandar                      | India        | Hindi     |
| Porbandar                      | India        | Kannada   |
| Porbandar                      | India        | Malajalam |
| Porbandar                      | India        | Marathi   |
| Porbandar                      | India        | Orija     |
| Porbandar                      | India        | Punjabi   |
| Porbandar                      | India        | Tamil     |
| Porbandar                      | India        | Telugu    |
| Porbandar                      | India        | Urdu      |
| Silchar                        | India        | Asami     |
| Silchar                        | India        | Bengali   |
| Silchar                        | India        | Gujarati  |
| Silchar                        | India        | Hindi     |
| Silchar                        | India        | Kannada   |
| Silchar                        | India        | Malajalam |
| Silchar                        | India        | Marathi   |
| Silchar                        | India        | Orija     |
| Silchar                        | India        | Punjabi   |
| Silchar                        | India        | Tamil     |
| Silchar                        | India        | Telugu    |
| Silchar                        | India        | Urdu      |
| Berhampore (Baharampur)        | India        | Asami     |
| Berhampore (Baharampur)        | India        | Bengali   |
| Berhampore (Baharampur)        | India        | Gujarati  |
| Berhampore (Baharampur)        | India        | Hindi     |
| Berhampore (Baharampur)        | India        | Kannada   |
| Berhampore (Baharampur)        | India        | Malajalam |
| Berhampore (Baharampur)        | India        | Marathi   |
| Berhampore (Baharampur)        | India        | Orija     |
| Berhampore (Baharampur)        | India        | Punjabi   |
| Berhampore (Baharampur)        | India        | Tamil     |
| Berhampore (Baharampur)        | India        | Telugu    |
| Berhampore (Baharampur)        | India        | Urdu      |
| Purnea (Purnia)                | India        | Asami     |
| Purnea (Purnia)                | India        | Bengali   |
| Purnea (Purnia)                | India        | Gujarati  |
| Purnea (Purnia)                | India        | Hindi     |
| Purnea (Purnia)                | India        | Kannada   |
| Purnea (Purnia)                | India        | Malajalam |
| Purnea (Purnia)                | India        | Marathi   |
| Purnea (Purnia)                | India        | Orija     |
| Purnea (Purnia)                | India        | Punjabi   |
| Purnea (Purnia)                | India        | Tamil     |
| Purnea (Purnia)                | India        | Telugu    |
| Purnea (Purnia)                | India        | Urdu      |
| Bankura                        | India        | Asami     |
| Bankura                        | India        | Bengali   |
| Bankura                        | India        | Gujarati  |
| Bankura                        | India        | Hindi     |
| Bankura                        | India        | Kannada   |
| Bankura                        | India        | Malajalam |
| Bankura                        | India        | Marathi   |
| Bankura                        | India        | Orija     |
| Bankura                        | India        | Punjabi   |
| Bankura                        | India        | Tamil     |
| Bankura                        | India        | Telugu    |
| Bankura                        | India        | Urdu      |
| Rajapalaiyam                   | India        | Asami     |
| Rajapalaiyam                   | India        | Bengali   |
| Rajapalaiyam                   | India        | Gujarati  |
| Rajapalaiyam                   | India        | Hindi     |
| Rajapalaiyam                   | India        | Kannada   |
| Rajapalaiyam                   | India        | Malajalam |
| Rajapalaiyam                   | India        | Marathi   |
| Rajapalaiyam                   | India        | Orija     |
| Rajapalaiyam                   | India        | Punjabi   |
| Rajapalaiyam                   | India        | Tamil     |
| Rajapalaiyam                   | India        | Telugu    |
| Rajapalaiyam                   | India        | Urdu      |
| Titagarh                       | India        | Asami     |
| Titagarh                       | India        | Bengali   |
| Titagarh                       | India        | Gujarati  |
| Titagarh                       | India        | Hindi     |
| Titagarh                       | India        | Kannada   |
| Titagarh                       | India        | Malajalam |
| Titagarh                       | India        | Marathi   |
| Titagarh                       | India        | Orija     |
| Titagarh                       | India        | Punjabi   |
| Titagarh                       | India        | Tamil     |
| Titagarh                       | India        | Telugu    |
| Titagarh                       | India        | Urdu      |
| Halisahar                      | India        | Asami     |
| Halisahar                      | India        | Bengali   |
| Halisahar                      | India        | Gujarati  |
| Halisahar                      | India        | Hindi     |
| Halisahar                      | India        | Kannada   |
| Halisahar                      | India        | Malajalam |
| Halisahar                      | India        | Marathi   |
| Halisahar                      | India        | Orija     |
| Halisahar                      | India        | Punjabi   |
| Halisahar                      | India        | Tamil     |
| Halisahar                      | India        | Telugu    |
| Halisahar                      | India        | Urdu      |
| Hathras                        | India        | Asami     |
| Hathras                        | India        | Bengali   |
| Hathras                        | India        | Gujarati  |
| Hathras                        | India        | Hindi     |
| Hathras                        | India        | Kannada   |
| Hathras                        | India        | Malajalam |
| Hathras                        | India        | Marathi   |
| Hathras                        | India        | Orija     |
| Hathras                        | India        | Punjabi   |
| Hathras                        | India        | Tamil     |
| Hathras                        | India        | Telugu    |
| Hathras                        | India        | Urdu      |
| Bhir (Bid)                     | India        | Asami     |
| Bhir (Bid)                     | India        | Bengali   |
| Bhir (Bid)                     | India        | Gujarati  |
| Bhir (Bid)                     | India        | Hindi     |
| Bhir (Bid)                     | India        | Kannada   |
| Bhir (Bid)                     | India        | Malajalam |
| Bhir (Bid)                     | India        | Marathi   |
| Bhir (Bid)                     | India        | Orija     |
| Bhir (Bid)                     | India        | Punjabi   |
| Bhir (Bid)                     | India        | Tamil     |
| Bhir (Bid)                     | India        | Telugu    |
| Bhir (Bid)                     | India        | Urdu      |
| Pallavaram                     | India        | Asami     |
| Pallavaram                     | India        | Bengali   |
| Pallavaram                     | India        | Gujarati  |
| Pallavaram                     | India        | Hindi     |
| Pallavaram                     | India        | Kannada   |
| Pallavaram                     | India        | Malajalam |
| Pallavaram                     | India        | Marathi   |
| Pallavaram                     | India        | Orija     |
| Pallavaram                     | India        | Punjabi   |
| Pallavaram                     | India        | Tamil     |
| Pallavaram                     | India        | Telugu    |
| Pallavaram                     | India        | Urdu      |
| Anand                          | India        | Asami     |
| Anand                          | India        | Bengali   |
| Anand                          | India        | Gujarati  |
| Anand                          | India        | Hindi     |
| Anand                          | India        | Kannada   |
| Anand                          | India        | Malajalam |
| Anand                          | India        | Marathi   |
| Anand                          | India        | Orija     |
| Anand                          | India        | Punjabi   |
| Anand                          | India        | Tamil     |
| Anand                          | India        | Telugu    |
| Anand                          | India        | Urdu      |
| Mango                          | India        | Asami     |
| Mango                          | India        | Bengali   |
| Mango                          | India        | Gujarati  |
| Mango                          | India        | Hindi     |
| Mango                          | India        | Kannada   |
| Mango                          | India        | Malajalam |
| Mango                          | India        | Marathi   |
| Mango                          | India        | Orija     |
| Mango                          | India        | Punjabi   |
| Mango                          | India        | Tamil     |
| Mango                          | India        | Telugu    |
| Mango                          | India        | Urdu      |
| Santipur                       | India        | Asami     |
| Santipur                       | India        | Bengali   |
| Santipur                       | India        | Gujarati  |
| Santipur                       | India        | Hindi     |
| Santipur                       | India        | Kannada   |
| Santipur                       | India        | Malajalam |
| Santipur                       | India        | Marathi   |
| Santipur                       | India        | Orija     |
| Santipur                       | India        | Punjabi   |
| Santipur                       | India        | Tamil     |
| Santipur                       | India        | Telugu    |
| Santipur                       | India        | Urdu      |
| Bhind                          | India        | Asami     |
| Bhind                          | India        | Bengali   |
| Bhind                          | India        | Gujarati  |
| Bhind                          | India        | Hindi     |
| Bhind                          | India        | Kannada   |
| Bhind                          | India        | Malajalam |
| Bhind                          | India        | Marathi   |
| Bhind                          | India        | Orija     |
| Bhind                          | India        | Punjabi   |
| Bhind                          | India        | Tamil     |
| Bhind                          | India        | Telugu    |
| Bhind                          | India        | Urdu      |
| Gondiya                        | India        | Asami     |
| Gondiya                        | India        | Bengali   |
| Gondiya                        | India        | Gujarati  |
| Gondiya                        | India        | Hindi     |
| Gondiya                        | India        | Kannada   |
| Gondiya                        | India        | Malajalam |
| Gondiya                        | India        | Marathi   |
| Gondiya                        | India        | Orija     |
| Gondiya                        | India        | Punjabi   |
| Gondiya                        | India        | Tamil     |
| Gondiya                        | India        | Telugu    |
| Gondiya                        | India        | Urdu      |
| Tiruvannamalai                 | India        | Asami     |
| Tiruvannamalai                 | India        | Bengali   |
| Tiruvannamalai                 | India        | Gujarati  |
| Tiruvannamalai                 | India        | Hindi     |
| Tiruvannamalai                 | India        | Kannada   |
| Tiruvannamalai                 | India        | Malajalam |
| Tiruvannamalai                 | India        | Marathi   |
| Tiruvannamalai                 | India        | Orija     |
| Tiruvannamalai                 | India        | Punjabi   |
| Tiruvannamalai                 | India        | Tamil     |
| Tiruvannamalai                 | India        | Telugu    |
| Tiruvannamalai                 | India        | Urdu      |
| Yeotmal (Yavatmal)             | India        | Asami     |
| Yeotmal (Yavatmal)             | India        | Bengali   |
| Yeotmal (Yavatmal)             | India        | Gujarati  |
| Yeotmal (Yavatmal)             | India        | Hindi     |
| Yeotmal (Yavatmal)             | India        | Kannada   |
| Yeotmal (Yavatmal)             | India        | Malajalam |
| Yeotmal (Yavatmal)             | India        | Marathi   |
| Yeotmal (Yavatmal)             | India        | Orija     |
| Yeotmal (Yavatmal)             | India        | Punjabi   |
| Yeotmal (Yavatmal)             | India        | Tamil     |
| Yeotmal (Yavatmal)             | India        | Telugu    |
| Yeotmal (Yavatmal)             | India        | Urdu      |
| Kulti-Barakar                  | India        | Asami     |
| Kulti-Barakar                  | India        | Bengali   |
| Kulti-Barakar                  | India        | Gujarati  |
| Kulti-Barakar                  | India        | Hindi     |
| Kulti-Barakar                  | India        | Kannada   |
| Kulti-Barakar                  | India        | Malajalam |
| Kulti-Barakar                  | India        | Marathi   |
| Kulti-Barakar                  | India        | Orija     |
| Kulti-Barakar                  | India        | Punjabi   |
| Kulti-Barakar                  | India        | Tamil     |
| Kulti-Barakar                  | India        | Telugu    |
| Kulti-Barakar                  | India        | Urdu      |
| Moga                           | India        | Asami     |
| Moga                           | India        | Bengali   |
| Moga                           | India        | Gujarati  |
| Moga                           | India        | Hindi     |
| Moga                           | India        | Kannada   |
| Moga                           | India        | Malajalam |
| Moga                           | India        | Marathi   |
| Moga                           | India        | Orija     |
| Moga                           | India        | Punjabi   |
| Moga                           | India        | Tamil     |
| Moga                           | India        | Telugu    |
| Moga                           | India        | Urdu      |
| Shivapuri                      | India        | Asami     |
| Shivapuri                      | India        | Bengali   |
| Shivapuri                      | India        | Gujarati  |
| Shivapuri                      | India        | Hindi     |
| Shivapuri                      | India        | Kannada   |
| Shivapuri                      | India        | Malajalam |
| Shivapuri                      | India        | Marathi   |
| Shivapuri                      | India        | Orija     |
| Shivapuri                      | India        | Punjabi   |
| Shivapuri                      | India        | Tamil     |
| Shivapuri                      | India        | Telugu    |
| Shivapuri                      | India        | Urdu      |
| Bidar                          | India        | Asami     |
| Bidar                          | India        | Bengali   |
| Bidar                          | India        | Gujarati  |
| Bidar                          | India        | Hindi     |
| Bidar                          | India        | Kannada   |
| Bidar                          | India        | Malajalam |
| Bidar                          | India        | Marathi   |
| Bidar                          | India        | Orija     |
| Bidar                          | India        | Punjabi   |
| Bidar                          | India        | Tamil     |
| Bidar                          | India        | Telugu    |
| Bidar                          | India        | Urdu      |
| Guntakal                       | India        | Asami     |
| Guntakal                       | India        | Bengali   |
| Guntakal                       | India        | Gujarati  |
| Guntakal                       | India        | Hindi     |
| Guntakal                       | India        | Kannada   |
| Guntakal                       | India        | Malajalam |
| Guntakal                       | India        | Marathi   |
| Guntakal                       | India        | Orija     |
| Guntakal                       | India        | Punjabi   |
| Guntakal                       | India        | Tamil     |
| Guntakal                       | India        | Telugu    |
| Guntakal                       | India        | Urdu      |
| Unnao                          | India        | Asami     |
| Unnao                          | India        | Bengali   |
| Unnao                          | India        | Gujarati  |
| Unnao                          | India        | Hindi     |
| Unnao                          | India        | Kannada   |
| Unnao                          | India        | Malajalam |
| Unnao                          | India        | Marathi   |
| Unnao                          | India        | Orija     |
| Unnao                          | India        | Punjabi   |
| Unnao                          | India        | Tamil     |
| Unnao                          | India        | Telugu    |
| Unnao                          | India        | Urdu      |
| Barasat                        | India        | Asami     |
| Barasat                        | India        | Bengali   |
| Barasat                        | India        | Gujarati  |
| Barasat                        | India        | Hindi     |
| Barasat                        | India        | Kannada   |
| Barasat                        | India        | Malajalam |
| Barasat                        | India        | Marathi   |
| Barasat                        | India        | Orija     |
| Barasat                        | India        | Punjabi   |
| Barasat                        | India        | Tamil     |
| Barasat                        | India        | Telugu    |
| Barasat                        | India        | Urdu      |
| Tambaram                       | India        | Asami     |
| Tambaram                       | India        | Bengali   |
| Tambaram                       | India        | Gujarati  |
| Tambaram                       | India        | Hindi     |
| Tambaram                       | India        | Kannada   |
| Tambaram                       | India        | Malajalam |
| Tambaram                       | India        | Marathi   |
| Tambaram                       | India        | Orija     |
| Tambaram                       | India        | Punjabi   |
| Tambaram                       | India        | Tamil     |
| Tambaram                       | India        | Telugu    |
| Tambaram                       | India        | Urdu      |
| Abohar                         | India        | Asami     |
| Abohar                         | India        | Bengali   |
| Abohar                         | India        | Gujarati  |
| Abohar                         | India        | Hindi     |
| Abohar                         | India        | Kannada   |
| Abohar                         | India        | Malajalam |
| Abohar                         | India        | Marathi   |
| Abohar                         | India        | Orija     |
| Abohar                         | India        | Punjabi   |
| Abohar                         | India        | Tamil     |
| Abohar                         | India        | Telugu    |
| Abohar                         | India        | Urdu      |
| Pilibhit                       | India        | Asami     |
| Pilibhit                       | India        | Bengali   |
| Pilibhit                       | India        | Gujarati  |
| Pilibhit                       | India        | Hindi     |
| Pilibhit                       | India        | Kannada   |
| Pilibhit                       | India        | Malajalam |
| Pilibhit                       | India        | Marathi   |
| Pilibhit                       | India        | Orija     |
| Pilibhit                       | India        | Punjabi   |
| Pilibhit                       | India        | Tamil     |
| Pilibhit                       | India        | Telugu    |
| Pilibhit                       | India        | Urdu      |
| Valparai                       | India        | Asami     |
| Valparai                       | India        | Bengali   |
| Valparai                       | India        | Gujarati  |
| Valparai                       | India        | Hindi     |
| Valparai                       | India        | Kannada   |
| Valparai                       | India        | Malajalam |
| Valparai                       | India        | Marathi   |
| Valparai                       | India        | Orija     |
| Valparai                       | India        | Punjabi   |
| Valparai                       | India        | Tamil     |
| Valparai                       | India        | Telugu    |
| Valparai                       | India        | Urdu      |
| Gonda                          | India        | Asami     |
| Gonda                          | India        | Bengali   |
| Gonda                          | India        | Gujarati  |
| Gonda                          | India        | Hindi     |
| Gonda                          | India        | Kannada   |
| Gonda                          | India        | Malajalam |
| Gonda                          | India        | Marathi   |
| Gonda                          | India        | Orija     |
| Gonda                          | India        | Punjabi   |
| Gonda                          | India        | Tamil     |
| Gonda                          | India        | Telugu    |
| Gonda                          | India        | Urdu      |
| Surendranagar                  | India        | Asami     |
| Surendranagar                  | India        | Bengali   |
| Surendranagar                  | India        | Gujarati  |
| Surendranagar                  | India        | Hindi     |
| Surendranagar                  | India        | Kannada   |
| Surendranagar                  | India        | Malajalam |
| Surendranagar                  | India        | Marathi   |
| Surendranagar                  | India        | Orija     |
| Surendranagar                  | India        | Punjabi   |
| Surendranagar                  | India        | Tamil     |
| Surendranagar                  | India        | Telugu    |
| Surendranagar                  | India        | Urdu      |
| Qutubullapur                   | India        | Asami     |
| Qutubullapur                   | India        | Bengali   |
| Qutubullapur                   | India        | Gujarati  |
| Qutubullapur                   | India        | Hindi     |
| Qutubullapur                   | India        | Kannada   |
| Qutubullapur                   | India        | Malajalam |
| Qutubullapur                   | India        | Marathi   |
| Qutubullapur                   | India        | Orija     |
| Qutubullapur                   | India        | Punjabi   |
| Qutubullapur                   | India        | Tamil     |
| Qutubullapur                   | India        | Telugu    |
| Qutubullapur                   | India        | Urdu      |
| Beawar                         | India        | Asami     |
| Beawar                         | India        | Bengali   |
| Beawar                         | India        | Gujarati  |
| Beawar                         | India        | Hindi     |
| Beawar                         | India        | Kannada   |
| Beawar                         | India        | Malajalam |
| Beawar                         | India        | Marathi   |
| Beawar                         | India        | Orija     |
| Beawar                         | India        | Punjabi   |
| Beawar                         | India        | Tamil     |
| Beawar                         | India        | Telugu    |
| Beawar                         | India        | Urdu      |
| Hindupur                       | India        | Asami     |
| Hindupur                       | India        | Bengali   |
| Hindupur                       | India        | Gujarati  |
| Hindupur                       | India        | Hindi     |
| Hindupur                       | India        | Kannada   |
| Hindupur                       | India        | Malajalam |
| Hindupur                       | India        | Marathi   |
| Hindupur                       | India        | Orija     |
| Hindupur                       | India        | Punjabi   |
| Hindupur                       | India        | Tamil     |
| Hindupur                       | India        | Telugu    |
| Hindupur                       | India        | Urdu      |
| Gandhidham                     | India        | Asami     |
| Gandhidham                     | India        | Bengali   |
| Gandhidham                     | India        | Gujarati  |
| Gandhidham                     | India        | Hindi     |
| Gandhidham                     | India        | Kannada   |
| Gandhidham                     | India        | Malajalam |
| Gandhidham                     | India        | Marathi   |
| Gandhidham                     | India        | Orija     |
| Gandhidham                     | India        | Punjabi   |
| Gandhidham                     | India        | Tamil     |
| Gandhidham                     | India        | Telugu    |
| Gandhidham                     | India        | Urdu      |
| Haldwani-cum-Kathgodam         | India        | Asami     |
| Haldwani-cum-Kathgodam         | India        | Bengali   |
| Haldwani-cum-Kathgodam         | India        | Gujarati  |
| Haldwani-cum-Kathgodam         | India        | Hindi     |
| Haldwani-cum-Kathgodam         | India        | Kannada   |
| Haldwani-cum-Kathgodam         | India        | Malajalam |
| Haldwani-cum-Kathgodam         | India        | Marathi   |
| Haldwani-cum-Kathgodam         | India        | Orija     |
| Haldwani-cum-Kathgodam         | India        | Punjabi   |
| Haldwani-cum-Kathgodam         | India        | Tamil     |
| Haldwani-cum-Kathgodam         | India        | Telugu    |
| Haldwani-cum-Kathgodam         | India        | Urdu      |
| Tellicherry (Thalassery)       | India        | Asami     |
| Tellicherry (Thalassery)       | India        | Bengali   |
| Tellicherry (Thalassery)       | India        | Gujarati  |
| Tellicherry (Thalassery)       | India        | Hindi     |
| Tellicherry (Thalassery)       | India        | Kannada   |
| Tellicherry (Thalassery)       | India        | Malajalam |
| Tellicherry (Thalassery)       | India        | Marathi   |
| Tellicherry (Thalassery)       | India        | Orija     |
| Tellicherry (Thalassery)       | India        | Punjabi   |
| Tellicherry (Thalassery)       | India        | Tamil     |
| Tellicherry (Thalassery)       | India        | Telugu    |
| Tellicherry (Thalassery)       | India        | Urdu      |
| Wardha                         | India        | Asami     |
| Wardha                         | India        | Bengali   |
| Wardha                         | India        | Gujarati  |
| Wardha                         | India        | Hindi     |
| Wardha                         | India        | Kannada   |
| Wardha                         | India        | Malajalam |
| Wardha                         | India        | Marathi   |
| Wardha                         | India        | Orija     |
| Wardha                         | India        | Punjabi   |
| Wardha                         | India        | Tamil     |
| Wardha                         | India        | Telugu    |
| Wardha                         | India        | Urdu      |
| Rishra                         | India        | Asami     |
| Rishra                         | India        | Bengali   |
| Rishra                         | India        | Gujarati  |
| Rishra                         | India        | Hindi     |
| Rishra                         | India        | Kannada   |
| Rishra                         | India        | Malajalam |
| Rishra                         | India        | Marathi   |
| Rishra                         | India        | Orija     |
| Rishra                         | India        | Punjabi   |
| Rishra                         | India        | Tamil     |
| Rishra                         | India        | Telugu    |
| Rishra                         | India        | Urdu      |
| Bhuj                           | India        | Asami     |
| Bhuj                           | India        | Bengali   |
| Bhuj                           | India        | Gujarati  |
| Bhuj                           | India        | Hindi     |
| Bhuj                           | India        | Kannada   |
| Bhuj                           | India        | Malajalam |
| Bhuj                           | India        | Marathi   |
| Bhuj                           | India        | Orija     |
| Bhuj                           | India        | Punjabi   |
| Bhuj                           | India        | Tamil     |
| Bhuj                           | India        | Telugu    |
| Bhuj                           | India        | Urdu      |
| Modinagar                      | India        | Asami     |
| Modinagar                      | India        | Bengali   |
| Modinagar                      | India        | Gujarati  |
| Modinagar                      | India        | Hindi     |
| Modinagar                      | India        | Kannada   |
| Modinagar                      | India        | Malajalam |
| Modinagar                      | India        | Marathi   |
| Modinagar                      | India        | Orija     |
| Modinagar                      | India        | Punjabi   |
| Modinagar                      | India        | Tamil     |
| Modinagar                      | India        | Telugu    |
| Modinagar                      | India        | Urdu      |
| Gudivada                       | India        | Asami     |
| Gudivada                       | India        | Bengali   |
| Gudivada                       | India        | Gujarati  |
| Gudivada                       | India        | Hindi     |
| Gudivada                       | India        | Kannada   |
| Gudivada                       | India        | Malajalam |
| Gudivada                       | India        | Marathi   |
| Gudivada                       | India        | Orija     |
| Gudivada                       | India        | Punjabi   |
| Gudivada                       | India        | Tamil     |
| Gudivada                       | India        | Telugu    |
| Gudivada                       | India        | Urdu      |
| Basirhat                       | India        | Asami     |
| Basirhat                       | India        | Bengali   |
| Basirhat                       | India        | Gujarati  |
| Basirhat                       | India        | Hindi     |
| Basirhat                       | India        | Kannada   |
| Basirhat                       | India        | Malajalam |
| Basirhat                       | India        | Marathi   |
| Basirhat                       | India        | Orija     |
| Basirhat                       | India        | Punjabi   |
| Basirhat                       | India        | Tamil     |
| Basirhat                       | India        | Telugu    |
| Basirhat                       | India        | Urdu      |
| Uttarpara-Kotrung              | India        | Asami     |
| Uttarpara-Kotrung              | India        | Bengali   |
| Uttarpara-Kotrung              | India        | Gujarati  |
| Uttarpara-Kotrung              | India        | Hindi     |
| Uttarpara-Kotrung              | India        | Kannada   |
| Uttarpara-Kotrung              | India        | Malajalam |
| Uttarpara-Kotrung              | India        | Marathi   |
| Uttarpara-Kotrung              | India        | Orija     |
| Uttarpara-Kotrung              | India        | Punjabi   |
| Uttarpara-Kotrung              | India        | Tamil     |
| Uttarpara-Kotrung              | India        | Telugu    |
| Uttarpara-Kotrung              | India        | Urdu      |
| Ongole                         | India        | Asami     |
| Ongole                         | India        | Bengali   |
| Ongole                         | India        | Gujarati  |
| Ongole                         | India        | Hindi     |
| Ongole                         | India        | Kannada   |
| Ongole                         | India        | Malajalam |
| Ongole                         | India        | Marathi   |
| Ongole                         | India        | Orija     |
| Ongole                         | India        | Punjabi   |
| Ongole                         | India        | Tamil     |
| Ongole                         | India        | Telugu    |
| Ongole                         | India        | Urdu      |
| North Barrackpur               | India        | Asami     |
| North Barrackpur               | India        | Bengali   |
| North Barrackpur               | India        | Gujarati  |
| North Barrackpur               | India        | Hindi     |
| North Barrackpur               | India        | Kannada   |
| North Barrackpur               | India        | Malajalam |
| North Barrackpur               | India        | Marathi   |
| North Barrackpur               | India        | Orija     |
| North Barrackpur               | India        | Punjabi   |
| North Barrackpur               | India        | Tamil     |
| North Barrackpur               | India        | Telugu    |
| North Barrackpur               | India        | Urdu      |
| Guna                           | India        | Asami     |
| Guna                           | India        | Bengali   |
| Guna                           | India        | Gujarati  |
| Guna                           | India        | Hindi     |
| Guna                           | India        | Kannada   |
| Guna                           | India        | Malajalam |
| Guna                           | India        | Marathi   |
| Guna                           | India        | Orija     |
| Guna                           | India        | Punjabi   |
| Guna                           | India        | Tamil     |
| Guna                           | India        | Telugu    |
| Guna                           | India        | Urdu      |
| Haldia                         | India        | Asami     |
| Haldia                         | India        | Bengali   |
| Haldia                         | India        | Gujarati  |
| Haldia                         | India        | Hindi     |
| Haldia                         | India        | Kannada   |
| Haldia                         | India        | Malajalam |
| Haldia                         | India        | Marathi   |
| Haldia                         | India        | Orija     |
| Haldia                         | India        | Punjabi   |
| Haldia                         | India        | Tamil     |
| Haldia                         | India        | Telugu    |
| Haldia                         | India        | Urdu      |
| Habra                          | India        | Asami     |
| Habra                          | India        | Bengali   |
| Habra                          | India        | Gujarati  |
| Habra                          | India        | Hindi     |
| Habra                          | India        | Kannada   |
| Habra                          | India        | Malajalam |
| Habra                          | India        | Marathi   |
| Habra                          | India        | Orija     |
| Habra                          | India        | Punjabi   |
| Habra                          | India        | Tamil     |
| Habra                          | India        | Telugu    |
| Habra                          | India        | Urdu      |
| Kanchrapara                    | India        | Asami     |
| Kanchrapara                    | India        | Bengali   |
| Kanchrapara                    | India        | Gujarati  |
| Kanchrapara                    | India        | Hindi     |
| Kanchrapara                    | India        | Kannada   |
| Kanchrapara                    | India        | Malajalam |
| Kanchrapara                    | India        | Marathi   |
| Kanchrapara                    | India        | Orija     |
| Kanchrapara                    | India        | Punjabi   |
| Kanchrapara                    | India        | Tamil     |
| Kanchrapara                    | India        | Telugu    |
| Kanchrapara                    | India        | Urdu      |
| Tonk                           | India        | Asami     |
| Tonk                           | India        | Bengali   |
| Tonk                           | India        | Gujarati  |
| Tonk                           | India        | Hindi     |
| Tonk                           | India        | Kannada   |
| Tonk                           | India        | Malajalam |
| Tonk                           | India        | Marathi   |
| Tonk                           | India        | Orija     |
| Tonk                           | India        | Punjabi   |
| Tonk                           | India        | Tamil     |
| Tonk                           | India        | Telugu    |
| Tonk                           | India        | Urdu      |
| Champdani                      | India        | Asami     |
| Champdani                      | India        | Bengali   |
| Champdani                      | India        | Gujarati  |
| Champdani                      | India        | Hindi     |
| Champdani                      | India        | Kannada   |
| Champdani                      | India        | Malajalam |
| Champdani                      | India        | Marathi   |
| Champdani                      | India        | Orija     |
| Champdani                      | India        | Punjabi   |
| Champdani                      | India        | Tamil     |
| Champdani                      | India        | Telugu    |
| Champdani                      | India        | Urdu      |
| Orai                           | India        | Asami     |
| Orai                           | India        | Bengali   |
| Orai                           | India        | Gujarati  |
| Orai                           | India        | Hindi     |
| Orai                           | India        | Kannada   |
| Orai                           | India        | Malajalam |
| Orai                           | India        | Marathi   |
| Orai                           | India        | Orija     |
| Orai                           | India        | Punjabi   |
| Orai                           | India        | Tamil     |
| Orai                           | India        | Telugu    |
| Orai                           | India        | Urdu      |
| Pudukkottai                    | India        | Asami     |
| Pudukkottai                    | India        | Bengali   |
| Pudukkottai                    | India        | Gujarati  |
| Pudukkottai                    | India        | Hindi     |
| Pudukkottai                    | India        | Kannada   |
| Pudukkottai                    | India        | Malajalam |
| Pudukkottai                    | India        | Marathi   |
| Pudukkottai                    | India        | Orija     |
| Pudukkottai                    | India        | Punjabi   |
| Pudukkottai                    | India        | Tamil     |
| Pudukkottai                    | India        | Telugu    |
| Pudukkottai                    | India        | Urdu      |
| Sasaram                        | India        | Asami     |
| Sasaram                        | India        | Bengali   |
| Sasaram                        | India        | Gujarati  |
| Sasaram                        | India        | Hindi     |
| Sasaram                        | India        | Kannada   |
| Sasaram                        | India        | Malajalam |
| Sasaram                        | India        | Marathi   |
| Sasaram                        | India        | Orija     |
| Sasaram                        | India        | Punjabi   |
| Sasaram                        | India        | Tamil     |
| Sasaram                        | India        | Telugu    |
| Sasaram                        | India        | Urdu      |
| Hazaribag                      | India        | Asami     |
| Hazaribag                      | India        | Bengali   |
| Hazaribag                      | India        | Gujarati  |
| Hazaribag                      | India        | Hindi     |
| Hazaribag                      | India        | Kannada   |
| Hazaribag                      | India        | Malajalam |
| Hazaribag                      | India        | Marathi   |
| Hazaribag                      | India        | Orija     |
| Hazaribag                      | India        | Punjabi   |
| Hazaribag                      | India        | Tamil     |
| Hazaribag                      | India        | Telugu    |
| Hazaribag                      | India        | Urdu      |
| Palayankottai                  | India        | Asami     |
| Palayankottai                  | India        | Bengali   |
| Palayankottai                  | India        | Gujarati  |
| Palayankottai                  | India        | Hindi     |
| Palayankottai                  | India        | Kannada   |
| Palayankottai                  | India        | Malajalam |
| Palayankottai                  | India        | Marathi   |
| Palayankottai                  | India        | Orija     |
| Palayankottai                  | India        | Punjabi   |
| Palayankottai                  | India        | Tamil     |
| Palayankottai                  | India        | Telugu    |
| Palayankottai                  | India        | Urdu      |
| Banda                          | India        | Asami     |
| Banda                          | India        | Bengali   |
| Banda                          | India        | Gujarati  |
| Banda                          | India        | Hindi     |
| Banda                          | India        | Kannada   |
| Banda                          | India        | Malajalam |
| Banda                          | India        | Marathi   |
| Banda                          | India        | Orija     |
| Banda                          | India        | Punjabi   |
| Banda                          | India        | Tamil     |
| Banda                          | India        | Telugu    |
| Banda                          | India        | Urdu      |
| Godhra                         | India        | Asami     |
| Godhra                         | India        | Bengali   |
| Godhra                         | India        | Gujarati  |
| Godhra                         | India        | Hindi     |
| Godhra                         | India        | Kannada   |
| Godhra                         | India        | Malajalam |
| Godhra                         | India        | Marathi   |
| Godhra                         | India        | Orija     |
| Godhra                         | India        | Punjabi   |
| Godhra                         | India        | Tamil     |
| Godhra                         | India        | Telugu    |
| Godhra                         | India        | Urdu      |
| Hospet                         | India        | Asami     |
| Hospet                         | India        | Bengali   |
| Hospet                         | India        | Gujarati  |
| Hospet                         | India        | Hindi     |
| Hospet                         | India        | Kannada   |
| Hospet                         | India        | Malajalam |
| Hospet                         | India        | Marathi   |
| Hospet                         | India        | Orija     |
| Hospet                         | India        | Punjabi   |
| Hospet                         | India        | Tamil     |
| Hospet                         | India        | Telugu    |
| Hospet                         | India        | Urdu      |
| Ashoknagar-Kalyangarh          | India        | Asami     |
| Ashoknagar-Kalyangarh          | India        | Bengali   |
| Ashoknagar-Kalyangarh          | India        | Gujarati  |
| Ashoknagar-Kalyangarh          | India        | Hindi     |
| Ashoknagar-Kalyangarh          | India        | Kannada   |
| Ashoknagar-Kalyangarh          | India        | Malajalam |
| Ashoknagar-Kalyangarh          | India        | Marathi   |
| Ashoknagar-Kalyangarh          | India        | Orija     |
| Ashoknagar-Kalyangarh          | India        | Punjabi   |
| Ashoknagar-Kalyangarh          | India        | Tamil     |
| Ashoknagar-Kalyangarh          | India        | Telugu    |
| Ashoknagar-Kalyangarh          | India        | Urdu      |
| Achalpur                       | India        | Asami     |
| Achalpur                       | India        | Bengali   |
| Achalpur                       | India        | Gujarati  |
| Achalpur                       | India        | Hindi     |
| Achalpur                       | India        | Kannada   |
| Achalpur                       | India        | Malajalam |
| Achalpur                       | India        | Marathi   |
| Achalpur                       | India        | Orija     |
| Achalpur                       | India        | Punjabi   |
| Achalpur                       | India        | Tamil     |
| Achalpur                       | India        | Telugu    |
| Achalpur                       | India        | Urdu      |
| Patan                          | India        | Asami     |
| Patan                          | India        | Bengali   |
| Patan                          | India        | Gujarati  |
| Patan                          | India        | Hindi     |
| Patan                          | India        | Kannada   |
| Patan                          | India        | Malajalam |
| Patan                          | India        | Marathi   |
| Patan                          | India        | Orija     |
| Patan                          | India        | Punjabi   |
| Patan                          | India        | Tamil     |
| Patan                          | India        | Telugu    |
| Patan                          | India        | Urdu      |
| Mandasor                       | India        | Asami     |
| Mandasor                       | India        | Bengali   |
| Mandasor                       | India        | Gujarati  |
| Mandasor                       | India        | Hindi     |
| Mandasor                       | India        | Kannada   |
| Mandasor                       | India        | Malajalam |
| Mandasor                       | India        | Marathi   |
| Mandasor                       | India        | Orija     |
| Mandasor                       | India        | Punjabi   |
| Mandasor                       | India        | Tamil     |
| Mandasor                       | India        | Telugu    |
| Mandasor                       | India        | Urdu      |
| Damoh                          | India        | Asami     |
| Damoh                          | India        | Bengali   |
| Damoh                          | India        | Gujarati  |
| Damoh                          | India        | Hindi     |
| Damoh                          | India        | Kannada   |
| Damoh                          | India        | Malajalam |
| Damoh                          | India        | Marathi   |
| Damoh                          | India        | Orija     |
| Damoh                          | India        | Punjabi   |
| Damoh                          | India        | Tamil     |
| Damoh                          | India        | Telugu    |
| Damoh                          | India        | Urdu      |
| Satara                         | India        | Asami     |
| Satara                         | India        | Bengali   |
| Satara                         | India        | Gujarati  |
| Satara                         | India        | Hindi     |
| Satara                         | India        | Kannada   |
| Satara                         | India        | Malajalam |
| Satara                         | India        | Marathi   |
| Satara                         | India        | Orija     |
| Satara                         | India        | Punjabi   |
| Satara                         | India        | Tamil     |
| Satara                         | India        | Telugu    |
| Satara                         | India        | Urdu      |
| Meerut Cantonment              | India        | Asami     |
| Meerut Cantonment              | India        | Bengali   |
| Meerut Cantonment              | India        | Gujarati  |
| Meerut Cantonment              | India        | Hindi     |
| Meerut Cantonment              | India        | Kannada   |
| Meerut Cantonment              | India        | Malajalam |
| Meerut Cantonment              | India        | Marathi   |
| Meerut Cantonment              | India        | Orija     |
| Meerut Cantonment              | India        | Punjabi   |
| Meerut Cantonment              | India        | Tamil     |
| Meerut Cantonment              | India        | Telugu    |
| Meerut Cantonment              | India        | Urdu      |
| Dehri                          | India        | Asami     |
| Dehri                          | India        | Bengali   |
| Dehri                          | India        | Gujarati  |
| Dehri                          | India        | Hindi     |
| Dehri                          | India        | Kannada   |
| Dehri                          | India        | Malajalam |
| Dehri                          | India        | Marathi   |
| Dehri                          | India        | Orija     |
| Dehri                          | India        | Punjabi   |
| Dehri                          | India        | Tamil     |
| Dehri                          | India        | Telugu    |
| Dehri                          | India        | Urdu      |
| Delhi Cantonment               | India        | Asami     |
| Delhi Cantonment               | India        | Bengali   |
| Delhi Cantonment               | India        | Gujarati  |
| Delhi Cantonment               | India        | Hindi     |
| Delhi Cantonment               | India        | Kannada   |
| Delhi Cantonment               | India        | Malajalam |
| Delhi Cantonment               | India        | Marathi   |
| Delhi Cantonment               | India        | Orija     |
| Delhi Cantonment               | India        | Punjabi   |
| Delhi Cantonment               | India        | Tamil     |
| Delhi Cantonment               | India        | Telugu    |
| Delhi Cantonment               | India        | Urdu      |
| Chhindwara                     | India        | Asami     |
| Chhindwara                     | India        | Bengali   |
| Chhindwara                     | India        | Gujarati  |
| Chhindwara                     | India        | Hindi     |
| Chhindwara                     | India        | Kannada   |
| Chhindwara                     | India        | Malajalam |
| Chhindwara                     | India        | Marathi   |
| Chhindwara                     | India        | Orija     |
| Chhindwara                     | India        | Punjabi   |
| Chhindwara                     | India        | Tamil     |
| Chhindwara                     | India        | Telugu    |
| Chhindwara                     | India        | Urdu      |
| Bansberia                      | India        | Asami     |
| Bansberia                      | India        | Bengali   |
| Bansberia                      | India        | Gujarati  |
| Bansberia                      | India        | Hindi     |
| Bansberia                      | India        | Kannada   |
| Bansberia                      | India        | Malajalam |
| Bansberia                      | India        | Marathi   |
| Bansberia                      | India        | Orija     |
| Bansberia                      | India        | Punjabi   |
| Bansberia                      | India        | Tamil     |
| Bansberia                      | India        | Telugu    |
| Bansberia                      | India        | Urdu      |
| Nagaon                         | India        | Asami     |
| Nagaon                         | India        | Bengali   |
| Nagaon                         | India        | Gujarati  |
| Nagaon                         | India        | Hindi     |
| Nagaon                         | India        | Kannada   |
| Nagaon                         | India        | Malajalam |
| Nagaon                         | India        | Marathi   |
| Nagaon                         | India        | Orija     |
| Nagaon                         | India        | Punjabi   |
| Nagaon                         | India        | Tamil     |
| Nagaon                         | India        | Telugu    |
| Nagaon                         | India        | Urdu      |
| Kanpur Cantonment              | India        | Asami     |
| Kanpur Cantonment              | India        | Bengali   |
| Kanpur Cantonment              | India        | Gujarati  |
| Kanpur Cantonment              | India        | Hindi     |
| Kanpur Cantonment              | India        | Kannada   |
| Kanpur Cantonment              | India        | Malajalam |
| Kanpur Cantonment              | India        | Marathi   |
| Kanpur Cantonment              | India        | Orija     |
| Kanpur Cantonment              | India        | Punjabi   |
| Kanpur Cantonment              | India        | Tamil     |
| Kanpur Cantonment              | India        | Telugu    |
| Kanpur Cantonment              | India        | Urdu      |
| Vidisha                        | India        | Asami     |
| Vidisha                        | India        | Bengali   |
| Vidisha                        | India        | Gujarati  |
| Vidisha                        | India        | Hindi     |
| Vidisha                        | India        | Kannada   |
| Vidisha                        | India        | Malajalam |
| Vidisha                        | India        | Marathi   |
| Vidisha                        | India        | Orija     |
| Vidisha                        | India        | Punjabi   |
| Vidisha                        | India        | Tamil     |
| Vidisha                        | India        | Telugu    |
| Vidisha                        | India        | Urdu      |
| Bettiah                        | India        | Asami     |
| Bettiah                        | India        | Bengali   |
| Bettiah                        | India        | Gujarati  |
| Bettiah                        | India        | Hindi     |
| Bettiah                        | India        | Kannada   |
| Bettiah                        | India        | Malajalam |
| Bettiah                        | India        | Marathi   |
| Bettiah                        | India        | Orija     |
| Bettiah                        | India        | Punjabi   |
| Bettiah                        | India        | Tamil     |
| Bettiah                        | India        | Telugu    |
| Bettiah                        | India        | Urdu      |
| Purulia                        | India        | Asami     |
| Purulia                        | India        | Bengali   |
| Purulia                        | India        | Gujarati  |
| Purulia                        | India        | Hindi     |
| Purulia                        | India        | Kannada   |
| Purulia                        | India        | Malajalam |
| Purulia                        | India        | Marathi   |
| Purulia                        | India        | Orija     |
| Purulia                        | India        | Punjabi   |
| Purulia                        | India        | Tamil     |
| Purulia                        | India        | Telugu    |
| Purulia                        | India        | Urdu      |
| Hassan                         | India        | Asami     |
| Hassan                         | India        | Bengali   |
| Hassan                         | India        | Gujarati  |
| Hassan                         | India        | Hindi     |
| Hassan                         | India        | Kannada   |
| Hassan                         | India        | Malajalam |
| Hassan                         | India        | Marathi   |
| Hassan                         | India        | Orija     |
| Hassan                         | India        | Punjabi   |
| Hassan                         | India        | Tamil     |
| Hassan                         | India        | Telugu    |
| Hassan                         | India        | Urdu      |
| Ambala Sadar                   | India        | Asami     |
| Ambala Sadar                   | India        | Bengali   |
| Ambala Sadar                   | India        | Gujarati  |
| Ambala Sadar                   | India        | Hindi     |
| Ambala Sadar                   | India        | Kannada   |
| Ambala Sadar                   | India        | Malajalam |
| Ambala Sadar                   | India        | Marathi   |
| Ambala Sadar                   | India        | Orija     |
| Ambala Sadar                   | India        | Punjabi   |
| Ambala Sadar                   | India        | Tamil     |
| Ambala Sadar                   | India        | Telugu    |
| Ambala Sadar                   | India        | Urdu      |
| Baidyabati                     | India        | Asami     |
| Baidyabati                     | India        | Bengali   |
| Baidyabati                     | India        | Gujarati  |
| Baidyabati                     | India        | Hindi     |
| Baidyabati                     | India        | Kannada   |
| Baidyabati                     | India        | Malajalam |
| Baidyabati                     | India        | Marathi   |
| Baidyabati                     | India        | Orija     |
| Baidyabati                     | India        | Punjabi   |
| Baidyabati                     | India        | Tamil     |
| Baidyabati                     | India        | Telugu    |
| Baidyabati                     | India        | Urdu      |
| Morvi                          | India        | Asami     |
| Morvi                          | India        | Bengali   |
| Morvi                          | India        | Gujarati  |
| Morvi                          | India        | Hindi     |
| Morvi                          | India        | Kannada   |
| Morvi                          | India        | Malajalam |
| Morvi                          | India        | Marathi   |
| Morvi                          | India        | Orija     |
| Morvi                          | India        | Punjabi   |
| Morvi                          | India        | Tamil     |
| Morvi                          | India        | Telugu    |
| Morvi                          | India        | Urdu      |
| Raigarh                        | India        | Asami     |
| Raigarh                        | India        | Bengali   |
| Raigarh                        | India        | Gujarati  |
| Raigarh                        | India        | Hindi     |
| Raigarh                        | India        | Kannada   |
| Raigarh                        | India        | Malajalam |
| Raigarh                        | India        | Marathi   |
| Raigarh                        | India        | Orija     |
| Raigarh                        | India        | Punjabi   |
| Raigarh                        | India        | Tamil     |
| Raigarh                        | India        | Telugu    |
| Raigarh                        | India        | Urdu      |
| Vejalpur                       | India        | Asami     |
| Vejalpur                       | India        | Bengali   |
| Vejalpur                       | India        | Gujarati  |
| Vejalpur                       | India        | Hindi     |
| Vejalpur                       | India        | Kannada   |
| Vejalpur                       | India        | Malajalam |
| Vejalpur                       | India        | Marathi   |
| Vejalpur                       | India        | Orija     |
| Vejalpur                       | India        | Punjabi   |
| Vejalpur                       | India        | Tamil     |
| Vejalpur                       | India        | Telugu    |
| Vejalpur                       | India        | Urdu      |
+--------------------------------+--------------+-----------+
4092 rows in set (0.01 sec)

select __________________
from table1 join table2 on()
join table3 on ();

use world;

/*
Subquery:
NON CORRELATED QUERY
CORRELATED QUERY
*/
select ename from emp where sal>(select sal from emp where ename ='scott');
select ename,sal,deptno from emp where sal in (select max(sal) from emp group by deptno);
select ename,sal,deptno from emp where sal in(2850,3000,5000);
select * from emp where ename in('smith','scott');
# display that department were none of the employee is working
select * from dept where deptno not in(select deptno from emp);
select ename as manager_name from emp where empno in(select mgr from emp);
select ename as worker_name from emp where empno not in(select mgr from emp where mgr is not null);
# display those emp whose sal> smith and job = smith
select * from emp where job=(select job from emp where ename='smith') and
sal>(select sal from emp where ename='smith');

#Correlated query
select ename as 'simple worker'from emp o where not exists(select mgr from emp i where i.mgr=o.empno);
select * from emp;

# Inline View-->Complex select
select * from 
(select ename as min_earner,sal as min_sal from emp where sal=(select min(sal) from emp)) Query1
cross join
(select ename as max_earner,sal as max_sal from emp where sal=(select max(sal) from emp)) Query2;
# select * from Query1 cross join Query 2;
###############################################################################################
/*
INDEX-->To locate the data
Btree index
*/

select * from emp where ename='scott';
create index idf on emp(ename);
create index idf2 on emp(job);
show indexes from emp;

alter table emp add primary key(empno);
alter table emp drop index idf;
drop index idf2 on emp;
create index idf using hash on emp(ename);