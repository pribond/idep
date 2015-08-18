---
title: "Code book"
author: "pm"
date: '2015-08-04 15:02:05'
output:
  pdf_document:
    keep_tex: yes
    number_sections: yes
  html_document:
    keep_md: yes
    number_sections: yes
    self_contained: no
---





# The reforms dataset (version 1.27)
The data-set is based on the IDEP data - data on Standing Orders versions (*texts*), data on Standing Orders Text (*textlines*) and data on Standing Orders change between versions (*linelinkage*). Information from all three sources are aggregated on Standing Orders version level - i.e. each version has its own line in the data-set. This aggregation allows for studying what happened - in an aggregate - at each reform of Standing Orders. 

The data set incorporates aggregated data for 
770 reforms in
15 countries and consists of 
225 variables. 

**Example:**


```r
reforms  %>% 
  select(t_id, wds_clean_rel, wds_chg, pro_min, pro_maj, wds_corp_agg_1)
```

```
## Source: local data frame [786 x 6]
## 
##                t_id wds_clean_rel wds_chg pro_min pro_maj wds_corp_agg_1
## 1  AUT_1928-02-01.0          7802       0      NA      NA           2530
## 2  AUT_1948-06-04.0          7907     242       0       1           2523
## 3  AUT_1961-09-01.0          9103    3983      17       5           2832
## 4  AUT_1975-10-01.0         13558   11307      36      23           4242
## 5  AUT_1976-07-01.0         13676      78       1       0           4318
## 6  AUT_1979-10-01.0         13826     454       2       0           4356
## 7  AUT_1986-09-01.0         14225    1036       3       4           4454
## 8  AUT_1989-01-01.0         16910    6094      33      24           4772
## 9  AUT_1993-09-15.0         18295    3002      15      16           4951
## 10 AUT_1996-10-15.0         20639    5712      20      29           5332
## ..              ...           ...     ...     ...     ...            ...
```

# Shortcuts 

**SP** is short for subparagraph and in most cases identical to **line** or text line due to the fact that sub-paragraphs have in the data gathering process been transfered (from PDFs and Word documents and the like) to simple text files in which each sub-paragraph was put on a single line and on one single line only.

**SO** is short for Standing Orders (rules of procedure) and usually refers to one particular version of Standing Orders in force in a particular country from a particular time point on. 



# General variable name shortcuts

**wds** is short for words, like the number of words within a SP. 

**lns** is short for lines an equivalent to SP. 

**rel** is short for relevant, like whether or not a SP contains relevant information or can be  dismissed as headline, blank-line, comment, appendix or some other not relevant part of the text (the opposite usually is **all**)

**raw** versus **clean** denote whether or not the SP was used as found in the official documents or cleaned up. Cleaned SPs have been stripped by their enumeration (only at the start of the SP), thus pure changes of enumeration (only at the start of the SP) are not considered as changes nor are they counted as relevant content. 

**ins**, **del**, **mdf**, **non**: denote the type of change that occurred for a particular SP - insertion, deletion, modification and no-change. The shorthand **chg** is for change and refers to all three possible forms that change might come by. 

**pro_...** indicate minority/majority codings, e.g. *pro_min* indicates how many SPs were changed in a way considered minority friendly. 


# Shortcuts indicating their raw data sets 

**db_** and **int_** denote variables that have to do with the database that serves as basis for all data-sets and are most likely not relevant to the user. 

**t_** information on text or Standing Orders version level, e.g. the data when a particular standing order was accepted, the country it belongs to or total number of words of the  version, ... .

**tl_** information on text lines aka SPs, e.g whether or not a SP is relevant, how many words it contains, it's corpus code, ... .


**ll_** information on the what happened to SPs from one version to the next - e.g. was it changed or deleted. 

Other shortcuts or variable names missing the above mentioned shortcuts indicate that those variables have been computed from other variables and most likely were result from some form of aggregation. See below for more detailed descriptions. 


# Variable descriptions










## 1 meta



**t_id** (texts)

Unique identifier of a SO version by including country shorthand, date, and version counter.

**class:**  character \
<br>**unique:**  786 \
<br>**NAs:**  0 \
<br>**range:** *[ AUT_1928-02-01.0 ]* ... *[ UK_2009-06-25.0 ]* \
<br>**examples:**  *[ SWE_1991-10-01.2 ], [ UK_1953-11-04.0 ], [ SWE_1986-06-15.0 ], [ LUX_1991-01-* ... \
<br>

<p>&nbsp;</p>

**t_date** (texts)

Date of the SO version - equals to (according to availibility) enactment, promulgation, acceptance.

**class:**  character \
<br>**unique:**  702 \
<br>**NAs:**  0 \
<br>**range:** *[ 1903-01-20 ]* ... *[ 2011-07-01 ]* \
<br>**examples:**  *[ 1954-11-02 ], [ 1995-03-01 ], [ 1982-03-17 ], [ 2003-05-27 ], [ 1980-01-17 ],* ... \
<br>

<p>&nbsp;</p>

**t_dplus** (texts)

Version counter that is zero under normal circumstances but might be higher if more than one version got enacted on the same date.

**class:**  integer \
<br>**unique:**  5 \
<br>**NAs:**  0 \
<br>**range:** *[ 0 ]* ... *[ 4 ]* \
<br>**examples:**  *[ 0 ], [ 0 ], [ 0 ], [ 0 ], [ 0 ], [ 1 ], [ 0 ], [ 0 ], [ 0 ], [ 0 ]* ... \
<br>

<p>&nbsp;</p>

**t_country** (texts)

Country shorthand. In case of Swiss two seperate shorthands exist because there SO are spread among two bodies.

**class:**  character \
<br>**unique:**  16 \
<br>**NAs:**  0 \
<br>**range:** *[ AUT ]* ... *[ UK ]* \
<br>**examples:**  *[ DEN ], [ DEN ], [ UK ], [ SWE ], [ UK ], [ UK ], [ UK ], [ UK ], [ DEN ], [ G* ... \
<br>

<p>&nbsp;</p>

**t_daccept** (texts)

Date on which the SO were accepted, voted upon, decided upon, ... .

**class:**  character \
<br>**unique:**  690 \
<br>**NAs:**  38 \
<br>**range:** *[ 1902-10-09 ]* ... *[ 2011-04-28 ]* \
<br>**examples:**  *[ 2004-12-16 ], [ 1994-06-16 ], [ 1995-04-07 ], [ 1990-07-12 ], [ 1982-03-12 ],* ... \
<br>

<p>&nbsp;</p>

**t_dpromul** (texts)

Date on which the SO were promulgated - made puplic, printed, published, ... .

**class:**  character \
<br>**unique:**  313 \
<br>**NAs:**  450 \
<br>**range:** *[ 1902-10-15 ]* ... *[ 2011-04-19 ]* \
<br>**examples:**  *[ 1995-06-01 ], [ 2009-12-11 ], [ NA ], [ 1970-07-03 ], [ NA ], [ NA ], [ NA ],* ... \
<br>

<p>&nbsp;</p>

**t_denact** (texts)

Date on which the SO were enacted - came into force / took effect.

**class:**  character \
<br>**unique:**  303 \
<br>**NAs:**  418 \
<br>**range:** *[ 1903-01-20 ]* ... *[ 2011-07-01 ]* \
<br>**examples:**  *[ 2009-12-01 ], [ NA ], [ 2007-10-25 ], [ NA ], [ 1976-07-31 ], [ 1990-05-01 ],* ... \
<br>

<p>&nbsp;</p>
## 2 db



**int_dupdate_texts** (db)

Date at which the 'texts' table of the database was last updated.

**class:**  character \
<br>**unique:**  16 \
<br>**NAs:**  0 \
<br>**range:** *[ 2015-07-23 14:47:15 ]* ... *[ 2015-07-23 22:18:09 ]* \
<br>**examples:**  *[ 2015-07-23 19:29:06 ], [ 2015-07-23 21:14:36 ], [ 2015-07-23 19:37:33 ], [ 20* ... \
<br>

<p>&nbsp;</p>

**int_id_texts** (db)

Database internal enumeration of SO - this might change at any time. Do **not** use this as an id variable.

**class:**  numeric \
<br>**unique:**  786 \
<br>**NAs:**  0 \
<br>**range:** *[ 1 ]* ... *[ 1010 ]* \
<br>**examples:**  *[ 824 ], [ 937 ], [ 381 ], [ 940 ], [ 898 ], [ 905 ], [ 219 ], [ 81 ], [ 382 ],* ... \
<br>

<p>&nbsp;</p>

**db_version** (db)

Version of the database which was used to create the data set. On every change the version number goes up by 0.01 - there is no distinction between major and minor version.

**class:**  numeric \
<br>**unique:**  1 \
<br>**NAs:**  0 \
<br>**range:** *[ 1.27 ]* ... *[ 1.27 ]* \
<br>**examples:**  *[ 1.27 ], [ 1.27 ], [ 1.27 ], [ 1.27 ], [ 1.27 ], [ 1.27 ], [ 1.27 ], [ 1.27 ],* ... \
<br>

<p>&nbsp;</p>

**db_lastupdate** (db)

Date at which the database was last updated.

**class:**  character \
<br>**unique:**  1 \
<br>**NAs:**  0 \
<br>**range:** *[ 2015-07-31 18:14:35 ]* ... *[ 2015-07-31 18:14:35 ]* \
<br>**examples:**  *[ 2015-07-31 18:14:35 ], [ 2015-07-31 18:14:35 ], [ 2015-07-31 18:14:35 ], [ 20* ... \
<br>

<p>&nbsp;</p>
## 3 length



**lns_all** (textlines)

Number of lines - also known as sub paragraphs - within a particular SO.

**class:**  integer \
<br>**unique:**  473 \
<br>**NAs:**  0 \
<br>**range:** *[ 88 ]* ... *[ 2645 ]* \
<br>**examples:**  *[ 1212 ], [ 435 ], [ 306 ], [ 303 ], [ 726 ], [ 975 ], [ 825 ], [ 595 ], [ 576 * ... \
<br>

<p>&nbsp;</p>

**wds_raw_all** (textlines)

Number of words within a particular SO.

**class:**  integer \
<br>**unique:**  744 \
<br>**NAs:**  0 \
<br>**range:** *[ 2318 ]* ... *[ 61397 ]* \
<br>**examples:**  *[ 22941 ], [ 6342 ], [ 35360 ], [ 28133 ], [ 12802 ], [ 16076 ], [ 10824 ], [ 2* ... \
<br>

<p>&nbsp;</p>

**wds_clean_all** (textlines)

Number of words within a particular SO after having striped away enumerations like, a), b), ..., 1., 2., ... I, II, ... and so forth.

**class:**  integer \
<br>**unique:**  739 \
<br>**NAs:**  0 \
<br>**range:** *[ 2236 ]* ... *[ 59628 ]* \
<br>**examples:**  *[ 14435 ], [ 10209 ], [ 21200 ], [ 16435 ], [ 35037 ], [ 14400 ], [ 11246 ], [ * ... \
<br>

<p>&nbsp;</p>

**lns_rel** (textlines)

Number of lines that contain relevant content - e.g. no blank lines, no headlines, no appendices.

**class:**  integer \
<br>**unique:**  402 \
<br>**NAs:**  0 \
<br>**range:** *[ 38 ]* ... *[ 1242 ]* \
<br>**examples:**  *[ 285 ], [ 199 ], [ 708 ], [ 279 ], [ 337 ], [ 625 ], [ 862 ], [ 881 ], [ 416 ]* ... \
<br>

<p>&nbsp;</p>

**wds_raw_rel** (textlines)

Number of words that are not from irrelevant lines - e.g. no blank lines, no headlines, no appendices.

**class:**  integer \
<br>**unique:**  740 \
<br>**NAs:**  0 \
<br>**range:** *[ 2122 ]* ... *[ 43046 ]* \
<br>**examples:**  *[ 9601 ], [ 22141 ], [ 15093 ], [ 14197 ], [ 9032 ], [ 15683 ], [ 9918 ], [ 186* ... \
<br>

<p>&nbsp;</p>

**wds_clean_rel** (textlines)

Number of words that are not from irrelevant lines - e.g. no blank lines, no headlines, no appendices - after having striped away enumerations like, a), b), ..., 1., 2., ... I, II, ... and so forth.

**class:**  integer \
<br>**unique:**  742 \
<br>**NAs:**  0 \
<br>**range:** *[ 2122 ]* ... *[ 41488 ]* \
<br>**examples:**  *[ 34957 ], [ 7176 ], [ 27035 ], [ 11516 ], [ 14288 ], [ 10564 ], [ 8612 ], [ 71* ... \
<br>

<p>&nbsp;</p>
## 4 change



**lns_mdf** (textlines)

Number of lines that were mofified - i.e. changed but not deleted or inserted.

**class:**  numeric \
<br>**unique:**  98 \
<br>**NAs:**  16 \
<br>**range:** *[ 0 ]* ... *[ 583 ]* \
<br>**examples:**  *[ NA ], [ 1 ], [ 1 ], [ 7 ], [ 5 ], [ 87 ], [ 4 ], [ 0 ], [ 11 ], [ 4 ]* ... \
<br>

<p>&nbsp;</p>

**wds_mdf** (textlines)

Number of words modified - i.e. changed but not deleted or inserted.

**class:**  numeric \
<br>**unique:**  347 \
<br>**NAs:**  16 \
<br>**range:** *[ 0 ]* ... *[ 12273 ]* \
<br>**examples:**  *[ 1247 ], [ 0 ], [ 11 ], [ 0 ], [ 20 ], [ 61 ], [ 0 ], [ 329 ], [ 99 ], [ 472 ]* ... \
<br>

<p>&nbsp;</p>

**wds_ins** (textlines, linelinkage)

Number of words that were inserted into SO.

**class:**  numeric \
<br>**unique:**  357 \
<br>**NAs:**  16 \
<br>**range:** *[ 0 ]* ... *[ 11246 ]* \
<br>**examples:**  *[ 91 ], [ 0 ], [ 145 ], [ 37 ], [ 85 ], [ 0 ], [ 4226 ], [ 18 ], [ 0 ], [ 58 ]* ... \
<br>

<p>&nbsp;</p>

**lns_ins** (textlines, linelinkage)

Number of lines that were inserted into SO.

**class:**  numeric \
<br>**unique:**  80 \
<br>**NAs:**  16 \
<br>**range:** *[ 0 ]* ... *[ 375 ]* \
<br>**examples:**  *[ 48 ], [ 1 ], [ 0 ], [ 0 ], [ 16 ], [ 1 ], [ 3 ], [ 0 ], [ 0 ], [ 134 ]* ... \
<br>

<p>&nbsp;</p>

**wds_del** (textlines, linelinkage)

Number of words that were deleted from old SO.

**class:**  numeric \
<br>**unique:**  204 \
<br>**NAs:**  16 \
<br>**range:** *[ 0 ]* ... *[ 6059 ]* \
<br>**examples:**  *[ 119 ], [ 0 ], [ 0 ], [ 0 ], [ 0 ], [ 0 ], [ 0 ], [ 0 ], [ 0 ], [ 0 ]* ... \
<br>

<p>&nbsp;</p>

**lns_del** (textlines, linelinkage)

Number of lines that were deleted from old SO.

**class:**  numeric \
<br>**unique:**  51 \
<br>**NAs:**  16 \
<br>**range:** *[ 0 ]* ... *[ 229 ]* \
<br>**examples:**  *[ 0 ], [ 2 ], [ 2 ], [ 4 ], [ 0 ], [ 0 ], [ 8 ], [ 0 ], [ 1 ], [ 0 ]* ... \
<br>

<p>&nbsp;</p>

**lns_chg** (textlines, linelinkage)

Number of lines that were changed from the old SO to the current - i.e. the sum of insertions, deletions and modifikations.

**class:**  numeric \
<br>**unique:**  134 \
<br>**NAs:**  0 \
<br>**range:** *[ 0 ]* ... *[ 778 ]* \
<br>**examples:**  *[ 74 ], [ 2 ], [ 11 ], [ 5 ], [ 1 ], [ 70 ], [ 8 ], [ 16 ], [ 3 ], [ 16 ]* ... \
<br>

<p>&nbsp;</p>

**wds_chg** (textlines, linelinkage)

Number of words that were changed from the old SO to the current - i.e. the sum of insertions, deletions and modifikations.

**class:**  numeric \
<br>**unique:**  522 \
<br>**NAs:**  0 \
<br>**range:** *[ 0 ]* ... *[ 23366 ]* \
<br>**examples:**  *[ 552 ], [ 5 ], [ 1016 ], [ 309 ], [ 614 ], [ 388 ], [ 864 ], [ 29 ], [ 241 ], * ... \
<br>

<p>&nbsp;</p>
## 7 raw corpus codes - 1 law making



**lns_corp_111** (textlines)

Number of lines with corpus code 111  

 1 Law-Making 

 11 Bills and motions 

 111 types of bills and motions; printing and distribution of bills and motions to MPs

**class:**  numeric \
<br>**unique:**  24 \
<br>**NAs:**  0 \
<br>**range:** *[ 0 ]* ... *[ 33 ]* \
<br>**examples:**  *[ 1 ], [ 2 ], [ 1 ], [ 17 ], [ 2 ], [ 0 ], [ 2 ], [ 2 ], [ 7 ], [ 2 ]* ... \
<br>

<p>&nbsp;</p>

**lns_corp_112** (textlines)

Number of lines with corpus code 112  

 1 Law-Making 

 11 Bills and motions 

 112 right to initiate bills and motions 

**class:**  numeric \
<br>**unique:**  17 \
<br>**NAs:**  0 \
<br>**range:** *[ 0 ]* ... *[ 28 ]* \
<br>**examples:**  *[ 1 ], [ 0 ], [ 5 ], [ 5 ], [ 3 ], [ 4 ], [ 3 ], [ 3 ], [ 15 ], [ 4 ]* ... \
<br>

<p>&nbsp;</p>

**lns_corp_113** (textlines)

Number of lines with corpus code 113  

 1 Law-Making 

 11 Bills and motions 

 113 restrictions and deadlines (if not assignable to more specific category, e.g. code 121; 32; 134)

**class:**  numeric \
<br>**unique:**  26 \
<br>**NAs:**  0 \
<br>**range:** *[ 0 ]* ... *[ 31 ]* \
<br>**examples:**  *[ 1 ], [ 11 ], [ 9 ], [ 0 ], [ 1 ], [ 3 ], [ 1 ], [ 7 ], [ 8 ], [ 3 ]* ... \
<br>

<p>&nbsp;</p>

**lns_corp_114** (textlines)

Number of lines with corpus code 114  

 1 Law-Making 

 11 Bills and motions 

 114 legislative planning (concerns the whole term- general schedule)

**class:**  numeric \
<br>**unique:**  9 \
<br>**NAs:**  0 \
<br>**range:** *[ 0 ]* ... *[ 12 ]* \
<br>**examples:**  *[ 0 ], [ 0 ], [ 0 ], [ 0 ], [ 0 ], [ 9 ], [ 6 ], [ 0 ], [ 0 ], [ 0 ]* ... \
<br>

<p>&nbsp;</p>

**lns_corp_121** (textlines)

Number of lines with corpus code 121  

 1 Law-Making 

 12 Treatment of Bills and motions in the plenary 

 121 debate in the plenary

**class:**  numeric \
<br>**unique:**  34 \
<br>**NAs:**  0 \
<br>**range:** *[ 0 ]* ... *[ 49 ]* \
<br>**examples:**  *[ 4 ], [ 8 ], [ 5 ], [ 4 ], [ 37 ], [ 5 ], [ 13 ], [ 2 ], [ 0 ], [ 0 ]* ... \
<br>

<p>&nbsp;</p>

**lns_corp_122** (textlines)

Number of lines with corpus code 122  

 1 Law-Making 

 12 Treatment of Bills and motions in the plenary 

 122 right of amendment in the plenary 

**class:**  numeric \
<br>**unique:**  26 \
<br>**NAs:**  0 \
<br>**range:** *[ 0 ]* ... *[ 26 ]* \
<br>**examples:**  *[ 3 ], [ 0 ], [ 2 ], [ 0 ], [ 5 ], [ 6 ], [ 0 ], [ 0 ], [ 3 ], [ 5 ]* ... \
<br>

<p>&nbsp;</p>

**lns_corp_123** (textlines)

Number of lines with corpus code 123  

 1 Law-Making 

 12 Treatment of Bills and motions in the plenary 

 123 subject of vote, rules of vote (including quorum), voting technology in the plenary

**class:**  integer \
<br>**unique:**  49 \
<br>**NAs:**  0 \
<br>**range:** *[ 2 ]* ... *[ 67 ]* \
<br>**examples:**  *[ 22 ], [ 56 ], [ 9 ], [ 17 ], [ 22 ], [ 10 ], [ 49 ], [ 13 ], [ 25 ], [ 15 ]* ... \
<br>

<p>&nbsp;</p>

**lns_corp_124** (textlines)

Number of lines with corpus code 124  

 1 Law-Making 

 12 Treatment of Bills and motions in the plenary 

 124 the plenary as Committee of the Whole House

**class:**  numeric \
<br>**unique:**  7 \
<br>**NAs:**  0 \
<br>**range:** *[ 0 ]* ... *[ 9 ]* \
<br>**examples:**  *[ 0 ], [ 0 ], [ 0 ], [ 0 ], [ 0 ], [ 0 ], [ 0 ], [ 0 ], [ 3 ], [ 3 ]* ... \
<br>

<p>&nbsp;</p>

**lns_corp_125** (textlines)

Number of lines with corpus code 125  

 1 Law-Making 

 12 Treatment of Bills and motions in the plenary 

 125 referral to committee, withdrawal from committee

**class:**  numeric \
<br>**unique:**  18 \
<br>**NAs:**  0 \
<br>**range:** *[ 0 ]* ... *[ 22 ]* \
<br>**examples:**  *[ 2 ], [ 10 ], [ 0 ], [ 5 ], [ 21 ], [ 3 ], [ 7 ], [ 7 ], [ 7 ], [ 7 ]* ... \
<br>

<p>&nbsp;</p>

**lns_corp_131** (textlines)

Number of lines with corpus code 131  

 1 Law-Making 

 13 Treatment of bills and motions in committee 

 131 debate in committee (including hearing)  

**class:**  numeric \
<br>**unique:**  13 \
<br>**NAs:**  0 \
<br>**range:** *[ 0 ]* ... *[ 13 ]* \
<br>**examples:**  *[ 1 ], [ 0 ], [ 1 ], [ 0 ], [ 5 ], [ 0 ], [ 4 ], [ 0 ], [ 1 ], [ 1 ]* ... \
<br>

<p>&nbsp;</p>

**lns_corp_132** (textlines)

Number of lines with corpus code 132  

 1 Law-Making 

 13 Treatment of bills and motions in committee 

 132 amendment rights in committee 

**class:**  numeric \
<br>**unique:**  9 \
<br>**NAs:**  0 \
<br>**range:** *[ 0 ]* ... *[ 10 ]* \
<br>**examples:**  *[ 0 ], [ 2 ], [ 1 ], [ 10 ], [ 1 ], [ 2 ], [ 2 ], [ 2 ], [ 0 ], [ 0 ]* ... \
<br>

<p>&nbsp;</p>

**lns_corp_133** (textlines)

Number of lines with corpus code 133  

 1 Law-Making 

 13 Treatment of bills and motions in committee 

 133 subject of vote, rules of vote (including quorum), voting technology in committee 

**class:**  numeric \
<br>**unique:**  11 \
<br>**NAs:**  0 \
<br>**range:** *[ 0 ]* ... *[ 11 ]* \
<br>**examples:**  *[ 1 ], [ 1 ], [ 7 ], [ 2 ], [ 1 ], [ 7 ], [ 1 ], [ 2 ], [ 0 ], [ 1 ]* ... \
<br>

<p>&nbsp;</p>

**lns_corp_134** (textlines)

Number of lines with corpus code 134  

 1 Law-Making 

 13 Treatment of bills and motions in committee 

 134 report to the plenary 

**class:**  numeric \
<br>**unique:**  21 \
<br>**NAs:**  0 \
<br>**range:** *[ 0 ]* ... *[ 22 ]* \
<br>**examples:**  *[ 5 ], [ 13 ], [ 5 ], [ 8 ], [ 4 ], [ 13 ], [ 4 ], [ 12 ], [ 5 ], [ 4 ]* ... \
<br>

<p>&nbsp;</p>

**lns_corp_141** (textlines)

Number of lines with corpus code 141  

 1 Law-Making 

 14 Post-parliamentary stage 

 141 veto right of government actors and head of state ( any case when government actors can oppose themselves to the decisions of parliament) 

**class:**  numeric \
<br>**unique:**  6 \
<br>**NAs:**  0 \
<br>**range:** *[ 0 ]* ... *[ 6 ]* \
<br>**examples:**  *[ 0 ], [ 0 ], [ 3 ], [ 0 ], [ 0 ], [ 0 ], [ 0 ], [ 0 ], [ 0 ], [ 0 ]* ... \
<br>

<p>&nbsp;</p>

**lns_corp_142** (textlines)

Number of lines with corpus code 142  

 1 Law-Making 

 14 Post-parliamentary stage 

 142 referral to second chamber, conciliation committee, and renewed decision after intervention  

**class:**  numeric \
<br>**unique:**  20 \
<br>**NAs:**  0 \
<br>**range:** *[ 0 ]* ... *[ 47 ]* \
<br>**examples:**  *[ 0 ], [ 1 ], [ 0 ], [ 5 ], [ 0 ], [ 3 ], [ 1 ], [ 6 ], [ 4 ], [ 40 ]* ... \
<br>

<p>&nbsp;</p>

**lns_corp_143** (textlines)

Number of lines with corpus code 143  

 1 Law-Making 

 14 Post-parliamentary stage 

 143 	direct democratic procedures following the legislative stage  

**class:**  numeric \
<br>**unique:**  7 \
<br>**NAs:**  0 \
<br>**range:** *[ 0 ]* ... *[ 13 ]* \
<br>**examples:**  *[ 0 ], [ 0 ], [ 0 ], [ 0 ], [ 0 ], [ 1 ], [ 0 ], [ 0 ], [ 0 ], [ 0 ]* ... \
<br>

<p>&nbsp;</p>

**lns_corp_144** (textlines)

Number of lines with corpus code 144  

 1 Law-Making 

 14 Post-parliamentary stage 

 144 promulgation and enactment	 

**class:**  numeric \
<br>**unique:**  5 \
<br>**NAs:**  0 \
<br>**range:** *[ 0 ]* ... *[ 6 ]* \
<br>**examples:**  *[ 0 ], [ 1 ], [ 1 ], [ 0 ], [ 0 ], [ 1 ], [ 1 ], [ 0 ], [ 0 ], [ 0 ]* ... \
<br>

<p>&nbsp;</p>

**lns_corp_145** (textlines)

Number of lines with corpus code 145  

 1 Law-Making 

 14 Post-parliamentary stage 

 145 referral to the constitutional court/supreme court 

**class:**  numeric \
<br>**unique:**  5 \
<br>**NAs:**  0 \
<br>**range:** *[ 0 ]* ... *[ 15 ]* \
<br>**examples:**  *[ 0 ], [ 0 ], [ 0 ], [ 0 ], [ 0 ], [ 0 ], [ 13 ], [ 0 ], [ 0 ], [ 0 ]* ... \
<br>

<p>&nbsp;</p>

**wds_corp_111** (textlines)

Number of words with corpus code 111  - see lns_corp_111  for more information.

**class:**  numeric \
<br>**unique:**  68 \
<br>**NAs:**  0 \
<br>**range:** *[ 0 ]* ... *[ 651 ]* \
<br>**examples:**  *[ 18 ], [ 0 ], [ 0 ], [ 0 ], [ 255 ], [ 70 ], [ 105 ], [ 70 ], [ 260 ], [ 0 ]* ... \
<br>

<p>&nbsp;</p>

**wds_corp_112** (textlines)

Number of words with corpus code 112  - see lns_corp_112  for more information.

**class:**  numeric \
<br>**unique:**  79 \
<br>**NAs:**  0 \
<br>**range:** *[ 0 ]* ... *[ 522 ]* \
<br>**examples:**  *[ 65 ], [ 397 ], [ 0 ], [ 134 ], [ 277 ], [ 53 ], [ 65 ], [ 120 ], [ 328 ], [ 6* ... \
<br>

<p>&nbsp;</p>

**wds_corp_113** (textlines)

Number of words with corpus code 113  - see lns_corp_113  for more information.

**class:**  numeric \
<br>**unique:**  100 \
<br>**NAs:**  0 \
<br>**range:** *[ 0 ]* ... *[ 806 ]* \
<br>**examples:**  *[ 0 ], [ 289 ], [ 122 ], [ 700 ], [ 259 ], [ 184 ], [ 367 ], [ 237 ], [ 378 ], * ... \
<br>

<p>&nbsp;</p>

**wds_corp_114** (textlines)

Number of words with corpus code 114  - see lns_corp_114  for more information.

**class:**  numeric \
<br>**unique:**  23 \
<br>**NAs:**  0 \
<br>**range:** *[ 0 ]* ... *[ 635 ]* \
<br>**examples:**  *[ 0 ], [ 0 ], [ 23 ], [ 0 ], [ 23 ], [ 0 ], [ 24 ], [ 0 ], [ 0 ], [ 256 ]* ... \
<br>

<p>&nbsp;</p>

**wds_corp_121** (textlines)

Number of words with corpus code 121  - see lns_corp_121  for more information.

**class:**  numeric \
<br>**unique:**  109 \
<br>**NAs:**  0 \
<br>**range:** *[ 0 ]* ... *[ 1536 ]* \
<br>**examples:**  *[ 179 ], [ 0 ], [ 243 ], [ 363 ], [ 589 ], [ 169 ], [ 0 ], [ 179 ], [ 745 ], [ * ... \
<br>

<p>&nbsp;</p>

**wds_corp_122** (textlines)

Number of words with corpus code 122  - see lns_corp_122  for more information.

**class:**  numeric \
<br>**unique:**  91 \
<br>**NAs:**  0 \
<br>**range:** *[ 0 ]* ... *[ 1189 ]* \
<br>**examples:**  *[ 216 ], [ 172 ], [ 200 ], [ 945 ], [ 240 ], [ 229 ], [ 333 ], [ 54 ], [ 44 ], * ... \
<br>

<p>&nbsp;</p>

**wds_corp_123** (textlines)

Number of words with corpus code 123  - see lns_corp_123  for more information.

**class:**  integer \
<br>**unique:**  182 \
<br>**NAs:**  0 \
<br>**range:** *[ 80 ]* ... *[ 2366 ]* \
<br>**examples:**  *[ 848 ], [ 565 ], [ 503 ], [ 703 ], [ 1453 ], [ 565 ], [ 703 ], [ 341 ], [ 1688* ... \
<br>

<p>&nbsp;</p>

**wds_corp_124** (textlines)

Number of words with corpus code 124  - see lns_corp_124  for more information.

**class:**  numeric \
<br>**unique:**  18 \
<br>**NAs:**  0 \
<br>**range:** *[ 0 ]* ... *[ 498 ]* \
<br>**examples:**  *[ 264 ], [ 498 ], [ 0 ], [ 21 ], [ 0 ], [ 0 ], [ 0 ], [ 0 ], [ 0 ], [ 0 ]* ... \
<br>

<p>&nbsp;</p>

**wds_corp_125** (textlines)

Number of words with corpus code 125  - see lns_corp_125  for more information.

**class:**  numeric \
<br>**unique:**  106 \
<br>**NAs:**  0 \
<br>**range:** *[ 0 ]* ... *[ 1073 ]* \
<br>**examples:**  *[ 268 ], [ 486 ], [ 162 ], [ 961 ], [ 203 ], [ 444 ], [ 299 ], [ 0 ], [ 176 ], * ... \
<br>

<p>&nbsp;</p>

**wds_corp_131** (textlines)

Number of words with corpus code 131  - see lns_corp_131  for more information.

**class:**  numeric \
<br>**unique:**  58 \
<br>**NAs:**  0 \
<br>**range:** *[ 0 ]* ... *[ 636 ]* \
<br>**examples:**  *[ 0 ], [ 23 ], [ 25 ], [ 0 ], [ 35 ], [ 35 ], [ 130 ], [ 0 ], [ 0 ], [ 200 ]* ... \
<br>

<p>&nbsp;</p>

**wds_corp_132** (textlines)

Number of words with corpus code 132  - see lns_corp_132  for more information.

**class:**  numeric \
<br>**unique:**  46 \
<br>**NAs:**  0 \
<br>**range:** *[ 0 ]* ... *[ 435 ]* \
<br>**examples:**  *[ 307 ], [ 0 ], [ 0 ], [ 49 ], [ 0 ], [ 0 ], [ 0 ], [ 86 ], [ 0 ], [ 122 ]* ... \
<br>

<p>&nbsp;</p>

**wds_corp_133** (textlines)

Number of words with corpus code 133  - see lns_corp_133  for more information.

**class:**  numeric \
<br>**unique:**  60 \
<br>**NAs:**  0 \
<br>**range:** *[ 0 ]* ... *[ 489 ]* \
<br>**examples:**  *[ 445 ], [ 18 ], [ 37 ], [ 19 ], [ 37 ], [ 15 ], [ 15 ], [ 37 ], [ 0 ], [ 0 ]* ... \
<br>

<p>&nbsp;</p>

**wds_corp_134** (textlines)

Number of words with corpus code 134  - see lns_corp_134  for more information.

**class:**  numeric \
<br>**unique:**  126 \
<br>**NAs:**  0 \
<br>**range:** *[ 0 ]* ... *[ 761 ]* \
<br>**examples:**  *[ 58 ], [ 393 ], [ 334 ], [ 257 ], [ 296 ], [ 337 ], [ 200 ], [ 308 ], [ 260 ],* ... \
<br>

<p>&nbsp;</p>

**wds_corp_141** (textlines)

Number of words with corpus code 141  - see lns_corp_141  for more information.

**class:**  numeric \
<br>**unique:**  9 \
<br>**NAs:**  0 \
<br>**range:** *[ 0 ]* ... *[ 187 ]* \
<br>**examples:**  *[ 0 ], [ 0 ], [ 187 ], [ 0 ], [ 0 ], [ 0 ], [ 0 ], [ 0 ], [ 0 ], [ 0 ]* ... \
<br>

<p>&nbsp;</p>

**wds_corp_142** (textlines)

Number of words with corpus code 142  - see lns_corp_142  for more information.

**class:**  numeric \
<br>**unique:**  59 \
<br>**NAs:**  0 \
<br>**range:** *[ 0 ]* ... *[ 1359 ]* \
<br>**examples:**  *[ 123 ], [ 74 ], [ 0 ], [ 128 ], [ 451 ], [ 0 ], [ 74 ], [ 1076 ], [ 1359 ], [ * ... \
<br>

<p>&nbsp;</p>

**wds_corp_143** (textlines)

Number of words with corpus code 143  - see lns_corp_143  for more information.

**class:**  numeric \
<br>**unique:**  18 \
<br>**NAs:**  0 \
<br>**range:** *[ 0 ]* ... *[ 555 ]* \
<br>**examples:**  *[ 0 ], [ 0 ], [ 0 ], [ 0 ], [ 0 ], [ 0 ], [ 0 ], [ 0 ], [ 0 ], [ 546 ]* ... \
<br>

<p>&nbsp;</p>

**wds_corp_144** (textlines)

Number of words with corpus code 144  - see lns_corp_144  for more information.

**class:**  numeric \
<br>**unique:**  10 \
<br>**NAs:**  0 \
<br>**range:** *[ 0 ]* ... *[ 136 ]* \
<br>**examples:**  *[ 0 ], [ 0 ], [ 0 ], [ 0 ], [ 0 ], [ 0 ], [ 0 ], [ 0 ], [ 0 ], [ 21 ]* ... \
<br>

<p>&nbsp;</p>

**wds_corp_145** (textlines)

Number of words with corpus code 145  - see lns_corp_145  for more information.

**class:**  numeric \
<br>**unique:**  9 \
<br>**NAs:**  0 \
<br>**range:** *[ 0 ]* ... *[ 857 ]* \
<br>**examples:**  *[ 76 ], [ 0 ], [ 0 ], [ 0 ], [ 0 ], [ 0 ], [ 0 ], [ 0 ], [ 0 ], [ 0 ]* ... \
<br>

<p>&nbsp;</p>
## 7 raw corpus codes - 2 special decision procedures



**lns_corp_21** (textlines)

Number of lines with corpus code 21   

 2 Special Decision Procedures other than Regular Law-Making 

 21 constitutional change and amendment

**class:**  numeric \
<br>**unique:**  22 \
<br>**NAs:**  0 \
<br>**range:** *[ 0 ]* ... *[ 35 ]* \
<br>**examples:**  *[ 0 ], [ 1 ], [ 0 ], [ 7 ], [ 7 ], [ 2 ], [ 0 ], [ 1 ], [ 5 ], [ 1 ]* ... \
<br>

<p>&nbsp;</p>

**lns_corp_22** (textlines)

Number of lines with corpus code 22   

 2 Special Decision Procedures other than Regular Law-Making 

 22 financial laws (money bills) and budgeting 

**class:**  numeric \
<br>**unique:**  48 \
<br>**NAs:**  0 \
<br>**range:** *[ 0 ]* ... *[ 65 ]* \
<br>**examples:**  *[ 1 ], [ 1 ], [ 1 ], [ 16 ], [ 28 ], [ 41 ], [ 19 ], [ 5 ], [ 11 ], [ 64 ]* ... \
<br>

<p>&nbsp;</p>

**lns_corp_23** (textlines)

Number of lines with corpus code 23   

 2 Special Decision Procedures other than Regular Law-Making 

 23 foreign policy

**class:**  numeric \
<br>**unique:**  16 \
<br>**NAs:**  0 \
<br>**range:** *[ 0 ]* ... *[ 29 ]* \
<br>**examples:**  *[ 0 ], [ 0 ], [ 0 ], [ 0 ], [ 0 ], [ 0 ], [ 0 ], [ 0 ], [ 0 ], [ 0 ]* ... \
<br>

<p>&nbsp;</p>

**lns_corp_25** (textlines)

Number of lines with corpus code 25   

 2 Special Decision Procedures other than Regular Law-Making 

 25 general rules on elections in parliament (if not coded as election of government (31), or election of specific officials (411; 421; 441; 6211; 6221; 632))

**class:**  numeric \
<br>**unique:**  34 \
<br>**NAs:**  0 \
<br>**range:** *[ 0 ]* ... *[ 80 ]* \
<br>**examples:**  *[ 10 ], [ 2 ], [ 0 ], [ 3 ], [ 77 ], [ 2 ], [ 3 ], [ 0 ], [ 0 ], [ 41 ]* ... \
<br>

<p>&nbsp;</p>

**lns_corp_26** (textlines)

Number of lines with corpus code 26   

 2 Special Decision Procedures other than Regular Law-Making 

 26 further special decision procedures (leading to a decision, e.g. resolution, or leading to a decree/act/bylaw (not mere debate or question time) but cannot be coded as regular law-making nor special decision procedures (21 - 24) )

**class:**  numeric \
<br>**unique:**  32 \
<br>**NAs:**  0 \
<br>**range:** *[ 0 ]* ... *[ 44 ]* \
<br>**examples:**  *[ 0 ], [ 0 ], [ 0 ], [ 0 ], [ 0 ], [ 1 ], [ 3 ], [ 0 ], [ 6 ], [ 6 ]* ... \
<br>

<p>&nbsp;</p>

**lns_corp_27** (textlines)

Number of lines with corpus code 27   

 2 Special Decision Procedures other than Regular Law-Making 

 27 procedures concerning laws that are hierarchically situated between regular laws and constitutional laws (above regular laws; e.g. organic laws in Spain)

**class:**  numeric \
<br>**unique:**  6 \
<br>**NAs:**  0 \
<br>**range:** *[ 0 ]* ... *[ 9 ]* \
<br>**examples:**  *[ 0 ], [ 0 ], [ 0 ], [ 0 ], [ 0 ], [ 0 ], [ 0 ], [ 0 ], [ 0 ], [ 0 ]* ... \
<br>

<p>&nbsp;</p>

**lns_corp_28** (textlines)

Number of lines with corpus code 28   

 2 Special Decision Procedures other than Regular Law-Making 

 28 emergency legislation

**class:**  numeric \
<br>**unique:**  6 \
<br>**NAs:**  0 \
<br>**range:** *[ 0 ]* ... *[ 32 ]* \
<br>**examples:**  *[ 0 ], [ 0 ], [ 0 ], [ 0 ], [ 0 ], [ 0 ], [ 0 ], [ 0 ], [ 0 ], [ 0 ]* ... \
<br>

<p>&nbsp;</p>

**lns_corp_29** (textlines)

Number of lines with corpus code 29   

 2 Special Decision Procedures other than Regular Law-Making 

 29 relationship to sub-national level (law-making, rights of participation of sub-national level)

**class:**  numeric \
<br>**unique:**  36 \
<br>**NAs:**  0 \
<br>**range:** *[ 0 ]* ... *[ 245 ]* \
<br>**examples:**  *[ 0 ], [ 0 ], [ 15 ], [ 0 ], [ 1 ], [ 0 ], [ 0 ], [ 20 ], [ 0 ], [ 48 ]* ... \
<br>

<p>&nbsp;</p>

**lns_corp_241** (textlines)

Number of lines with corpus code 241  

 2 Special Decision Procedures other than Regular Law-Making 

 24 EU 

 241 treatment of EU-bills and motions

**class:**  numeric \
<br>**unique:**  14 \
<br>**NAs:**  0 \
<br>**range:** *[ 0 ]* ... *[ 24 ]* \
<br>**examples:**  *[ 3 ], [ 0 ], [ 0 ], [ 0 ], [ 5 ], [ 0 ], [ 0 ], [ 0 ], [ 4 ], [ 5 ]* ... \
<br>

<p>&nbsp;</p>

**lns_corp_242** (textlines)

Number of lines with corpus code 242  

 2 Special Decision Procedures other than Regular Law-Making 

 24 EU 

 242 EU-committee: election and resignation 

**class:**  numeric \
<br>**unique:**  23 \
<br>**NAs:**  0 \
<br>**range:** *[ 0 ]* ... *[ 48 ]* \
<br>**examples:**  *[ 0 ], [ 0 ], [ 0 ], [ 0 ], [ 3 ], [ 0 ], [ 0 ], [ 0 ], [ 0 ], [ 0 ]* ... \
<br>

<p>&nbsp;</p>

**lns_corp_243** (textlines)

Number of lines with corpus code 243  

 2 Special Decision Procedures other than Regular Law-Making 

 24 EU 

 243 instructions to the government concerning EU decisions

**class:**  numeric \
<br>**unique:**  4 \
<br>**NAs:**  0 \
<br>**range:** *[ 0 ]* ... *[ 4 ]* \
<br>**examples:**  *[ 0 ], [ 0 ], [ 1 ], [ 0 ], [ 0 ], [ 0 ], [ 0 ], [ 0 ], [ 0 ], [ 0 ]* ... \
<br>

<p>&nbsp;</p>

**lns_corp_244** (textlines)

Number of lines with corpus code 244  

 2 Special Decision Procedures other than Regular Law-Making 

 24 EU 

 244 further rights of participation in EU matters (e.g. debates about EU topics not based on EU bills and motions, reaction to violations of subsidiary principle) 

**class:**  numeric \
<br>**unique:**  14 \
<br>**NAs:**  0 \
<br>**range:** *[ 0 ]* ... *[ 29 ]* \
<br>**examples:**  *[ 0 ], [ 13 ], [ 9 ], [ 0 ], [ 0 ], [ 0 ], [ 0 ], [ 24 ], [ 0 ], [ 0 ]* ... \
<br>

<p>&nbsp;</p>

**wds_corp_21** (textlines)

Number of words with corpus code 21   - see lns_corp_21   for more information.

**class:**  numeric \
<br>**unique:**  54 \
<br>**NAs:**  0 \
<br>**range:** *[ 0 ]* ... *[ 885 ]* \
<br>**examples:**  *[ 0 ], [ 0 ], [ 27 ], [ 0 ], [ 99 ], [ 258 ], [ 258 ], [ 0 ], [ 751 ], [ 18 ]* ... \
<br>

<p>&nbsp;</p>

**wds_corp_22** (textlines)

Number of words with corpus code 22   - see lns_corp_22   for more information.

**class:**  numeric \
<br>**unique:**  155 \
<br>**NAs:**  0 \
<br>**range:** *[ 0 ]* ... *[ 2938 ]* \
<br>**examples:**  *[ 137 ], [ 137 ], [ 0 ], [ 1542 ], [ 297 ], [ 489 ], [ 1096 ], [ 281 ], [ 806 ]* ... \
<br>

<p>&nbsp;</p>

**wds_corp_23** (textlines)

Number of words with corpus code 23   - see lns_corp_23   for more information.

**class:**  numeric \
<br>**unique:**  40 \
<br>**NAs:**  0 \
<br>**range:** *[ 0 ]* ... *[ 777 ]* \
<br>**examples:**  *[ 0 ], [ 635 ], [ 635 ], [ 0 ], [ 0 ], [ 0 ], [ 0 ], [ 0 ], [ 107 ], [ 0 ]* ... \
<br>

<p>&nbsp;</p>

**wds_corp_25** (textlines)

Number of words with corpus code 25   - see lns_corp_25   for more information.

**class:**  numeric \
<br>**unique:**  94 \
<br>**NAs:**  0 \
<br>**range:** *[ 0 ]* ... *[ 1942 ]* \
<br>**examples:**  *[ 1419 ], [ 0 ], [ 0 ], [ 565 ], [ 1470 ], [ 0 ], [ 0 ], [ 0 ], [ 1461 ], [ 80 * ... \
<br>

<p>&nbsp;</p>

**wds_corp_26** (textlines)

Number of words with corpus code 26   - see lns_corp_26   for more information.

**class:**  numeric \
<br>**unique:**  86 \
<br>**NAs:**  0 \
<br>**range:** *[ 0 ]* ... *[ 2217 ]* \
<br>**examples:**  *[ 501 ], [ 817 ], [ 0 ], [ 0 ], [ 1863 ], [ 0 ], [ 782 ], [ 736 ], [ 203 ], [ 7* ... \
<br>

<p>&nbsp;</p>

**wds_corp_27** (textlines)

Number of words with corpus code 27   - see lns_corp_27   for more information.

**class:**  numeric \
<br>**unique:**  15 \
<br>**NAs:**  0 \
<br>**range:** *[ 0 ]* ... *[ 475 ]* \
<br>**examples:**  *[ 0 ], [ 0 ], [ 0 ], [ 0 ], [ 0 ], [ 195 ], [ 0 ], [ 0 ], [ 0 ], [ 0 ]* ... \
<br>

<p>&nbsp;</p>

**wds_corp_28** (textlines)

Number of words with corpus code 28   - see lns_corp_28   for more information.

**class:**  numeric \
<br>**unique:**  8 \
<br>**NAs:**  0 \
<br>**range:** *[ 0 ]* ... *[ 775 ]* \
<br>**examples:**  *[ 0 ], [ 0 ], [ 0 ], [ 0 ], [ 0 ], [ 0 ], [ 0 ], [ 0 ], [ 0 ], [ 0 ]* ... \
<br>

<p>&nbsp;</p>

**wds_corp_29** (textlines)

Number of words with corpus code 29   - see lns_corp_29   for more information.

**class:**  numeric \
<br>**unique:**  70 \
<br>**NAs:**  0 \
<br>**range:** *[ 0 ]* ... *[ 8107 ]* \
<br>**examples:**  *[ 0 ], [ 0 ], [ 0 ], [ 0 ], [ 0 ], [ 0 ], [ 1014 ], [ 0 ], [ 7921 ], [ 0 ]* ... \
<br>

<p>&nbsp;</p>

**wds_corp_241** (textlines)

Number of words with corpus code 241  - see lns_corp_241  for more information.

**class:**  numeric \
<br>**unique:**  42 \
<br>**NAs:**  0 \
<br>**range:** *[ 0 ]* ... *[ 1348 ]* \
<br>**examples:**  *[ 0 ], [ 0 ], [ 0 ], [ 0 ], [ 128 ], [ 123 ], [ 122 ], [ 0 ], [ 0 ], [ 97 ]* ... \
<br>

<p>&nbsp;</p>

**wds_corp_242** (textlines)

Number of words with corpus code 242  - see lns_corp_242  for more information.

**class:**  numeric \
<br>**unique:**  50 \
<br>**NAs:**  0 \
<br>**range:** *[ 0 ]* ... *[ 1310 ]* \
<br>**examples:**  *[ 1243 ], [ 0 ], [ 0 ], [ 0 ], [ 0 ], [ 0 ], [ 0 ], [ 296 ], [ 1250 ], [ 934 ]* ... \
<br>

<p>&nbsp;</p>

**wds_corp_243** (textlines)

Number of words with corpus code 243  - see lns_corp_243  for more information.

**class:**  numeric \
<br>**unique:**  7 \
<br>**NAs:**  0 \
<br>**range:** *[ 0 ]* ... *[ 84 ]* \
<br>**examples:**  *[ 0 ], [ 0 ], [ 0 ], [ 19 ], [ 70 ], [ 70 ], [ 0 ], [ 0 ], [ 0 ], [ 0 ]* ... \
<br>

<p>&nbsp;</p>

**wds_corp_244** (textlines)

Number of words with corpus code 244  - see lns_corp_244  for more information.

**class:**  numeric \
<br>**unique:**  28 \
<br>**NAs:**  0 \
<br>**range:** *[ 0 ]* ... *[ 927 ]* \
<br>**examples:**  *[ 0 ], [ 0 ], [ 0 ], [ 0 ], [ 0 ], [ 0 ], [ 0 ], [ 0 ], [ 0 ], [ 0 ]* ... \
<br>

<p>&nbsp;</p>
## 7 raw corpus codes - 3 relationship to government 



**lns_corp_31** (textlines)

Number of lines with corpus code 31   

 3 Relationship to Government 

 31 election of government / mandatory investiture vote; entry into office

**class:**  numeric \
<br>**unique:**  9 \
<br>**NAs:**  0 \
<br>**range:** *[ 0 ]* ... *[ 18 ]* \
<br>**examples:**  *[ 1 ], [ 15 ], [ 1 ], [ 0 ], [ 0 ], [ 0 ], [ 1 ], [ 1 ], [ 0 ], [ 13 ]* ... \
<br>

<p>&nbsp;</p>

**lns_corp_32** (textlines)

Number of lines with corpus code 32   

 3 Relationship to Government 

 32 vote of no confidence / government resignation

**class:**  numeric \
<br>**unique:**  15 \
<br>**NAs:**  0 \
<br>**range:** *[ 0 ]* ... *[ 27 ]* \
<br>**examples:**  *[ 0 ], [ 15 ], [ 0 ], [ 0 ], [ 0 ], [ 9 ], [ 0 ], [ 0 ], [ 0 ], [ 0 ]* ... \
<br>

<p>&nbsp;</p>

**lns_corp_33** (textlines)

Number of lines with corpus code 33   

 3 Relationship to Government 

 33 vote of confidence

**class:**  numeric \
<br>**unique:**  8 \
<br>**NAs:**  0 \
<br>**range:** *[ 0 ]* ... *[ 9 ]* \
<br>**examples:**  *[ 7 ], [ 9 ], [ 2 ], [ 8 ], [ 0 ], [ 0 ], [ 0 ], [ 0 ], [ 0 ], [ 0 ]* ... \
<br>

<p>&nbsp;</p>

**lns_corp_34** (textlines)

Number of lines with corpus code 34   

 3 Relationship to Government 

 34 instructions to government, involvement of members of government in parliamentary activities (rights to compel witnesses [usually right of parliament against members of government], right to speak [usually members of government's right], request of information about state of execution of decisions of parliament)

**class:**  numeric \
<br>**unique:**  27 \
<br>**NAs:**  0 \
<br>**range:** *[ 0 ]* ... *[ 37 ]* \
<br>**examples:**  *[ 6 ], [ 36 ], [ 8 ], [ 1 ], [ 12 ], [ 6 ], [ 7 ], [ 1 ], [ 12 ], [ 1 ]* ... \
<br>

<p>&nbsp;</p>

**wds_corp_31** (textlines)

Number of words with corpus code 31   - see lns_corp_31   for more information.

**class:**  numeric \
<br>**unique:**  17 \
<br>**NAs:**  0 \
<br>**range:** *[ 0 ]* ... *[ 426 ]* \
<br>**examples:**  *[ 48 ], [ 27 ], [ 0 ], [ 0 ], [ 0 ], [ 0 ], [ 0 ], [ 0 ], [ 0 ], [ 0 ]* ... \
<br>

<p>&nbsp;</p>

**wds_corp_32** (textlines)

Number of words with corpus code 32   - see lns_corp_32   for more information.

**class:**  numeric \
<br>**unique:**  33 \
<br>**NAs:**  0 \
<br>**range:** *[ 0 ]* ... *[ 861 ]* \
<br>**examples:**  *[ 859 ], [ 93 ], [ 0 ], [ 55 ], [ 473 ], [ 248 ], [ 0 ], [ 0 ], [ 0 ], [ 0 ]* ... \
<br>

<p>&nbsp;</p>

**wds_corp_33** (textlines)

Number of words with corpus code 33   - see lns_corp_33   for more information.

**class:**  numeric \
<br>**unique:**  19 \
<br>**NAs:**  0 \
<br>**range:** *[ 0 ]* ... *[ 268 ]* \
<br>**examples:**  *[ 0 ], [ 0 ], [ 0 ], [ 0 ], [ 0 ], [ 0 ], [ 0 ], [ 0 ], [ 0 ], [ 62 ]* ... \
<br>

<p>&nbsp;</p>

**wds_corp_34** (textlines)

Number of words with corpus code 34   - see lns_corp_34   for more information.

**class:**  numeric \
<br>**unique:**  102 \
<br>**NAs:**  0 \
<br>**range:** *[ 0 ]* ... *[ 860 ]* \
<br>**examples:**  *[ 81 ], [ 348 ], [ 104 ], [ 360 ], [ 75 ], [ 64 ], [ 0 ], [ 64 ], [ 150 ], [ 13* ... \
<br>

<p>&nbsp;</p>
## 7 raw corpus codes - 4 relationship to others



**lns_corp_43** (textlines)

Number of lines with corpus code 43   

 4 Relationship to External Offices/Institutions apart from the Government 

 43 second chamber (if not coded as law-making (142))

**class:**  numeric \
<br>**unique:**  10 \
<br>**NAs:**  0 \
<br>**range:** *[ 0 ]* ... *[ 16 ]* \
<br>**examples:**  *[ 4 ], [ 0 ], [ 2 ], [ 0 ], [ 4 ], [ 0 ], [ 0 ], [ 0 ], [ 0 ], [ 0 ]* ... \
<br>

<p>&nbsp;</p>

**lns_corp_45** (textlines)

Number of lines with corpus code 45   

 4 Relationship to External Offices/Institutions apart from the Government 

 45 constitutional courts

**class:**  numeric \
<br>**unique:**  10 \
<br>**NAs:**  0 \
<br>**range:** *[ 0 ]* ... *[ 34 ]* \
<br>**examples:**  *[ 0 ], [ 0 ], [ 0 ], [ 5 ], [ 0 ], [ 21 ], [ 0 ], [ 0 ], [ 0 ], [ 0 ]* ... \
<br>

<p>&nbsp;</p>

**lns_corp_411** (textlines)

Number of lines with corpus code 411  

 4 Relationship to External Offices/Institutions apart from the Government 

 41 parliamentary support bodies (e.g. general accounting office, ombudsman, ...) 

 411 election and resignation

**class:**  numeric \
<br>**unique:**  14 \
<br>**NAs:**  0 \
<br>**range:** *[ 0 ]* ... *[ 46 ]* \
<br>**examples:**  *[ 0 ], [ 1 ], [ 0 ], [ 6 ], [ 6 ], [ 0 ], [ 0 ], [ 0 ], [ 0 ], [ 0 ]* ... \
<br>

<p>&nbsp;</p>

**lns_corp_412** (textlines)

Number of lines with corpus code 412  

 4 Relationship to External Offices/Institutions apart from the Government 

 41 parliamentary support bodies (e.g. general accounting office, ombudsman, ...) 

 412 competences and resources of external offices/institutions; relations to parliament (e.g. reports, questions, ...)

**class:**  numeric \
<br>**unique:**  13 \
<br>**NAs:**  0 \
<br>**range:** *[ 0 ]* ... *[ 22 ]* \
<br>**examples:**  *[ 17 ], [ 0 ], [ 0 ], [ 0 ], [ 1 ], [ 5 ], [ 0 ], [ 0 ], [ 17 ], [ 4 ]* ... \
<br>

<p>&nbsp;</p>

**lns_corp_421** (textlines)

Number of lines with corpus code 421  

 4 Relationship to External Offices/Institutions apart from the Government 

 42 head of state 

 421 election and resignation

**class:**  numeric \
<br>**unique:**  6 \
<br>**NAs:**  0 \
<br>**range:** *[ 0 ]* ... *[ 15 ]* \
<br>**examples:**  *[ 0 ], [ 0 ], [ 0 ], [ 0 ], [ 0 ], [ 0 ], [ 0 ], [ 1 ], [ 0 ], [ 0 ]* ... \
<br>

<p>&nbsp;</p>

**lns_corp_422** (textlines)

Number of lines with corpus code 422  

 4 Relationship to External Offices/Institutions apart from the Government 

 42 head of state 

 422 relation to parliament (if not coded as law-making (141, 144))

**class:**  numeric \
<br>**unique:**  4 \
<br>**NAs:**  0 \
<br>**range:** *[ 0 ]* ... *[ 6 ]* \
<br>**examples:**  *[ 0 ], [ 0 ], [ 0 ], [ 0 ], [ 0 ], [ 0 ], [ 0 ], [ 0 ], [ 0 ], [ 0 ]* ... \
<br>

<p>&nbsp;</p>

**lns_corp_441** (textlines)

Number of lines with corpus code 441  

 4 Relationship to External Offices/Institutions apart from the Government 

 44 constitutional courts 

 441 election and resignation

**class:**  numeric \
<br>**unique:**  3 \
<br>**NAs:**  0 \
<br>**range:** *[ 0 ]* ... *[ 4 ]* \
<br>**examples:**  *[ 0 ], [ 0 ], [ 0 ], [ 2 ], [ 0 ], [ 0 ], [ 0 ], [ 0 ], [ 0 ], [ 0 ]* ... \
<br>

<p>&nbsp;</p>

**lns_corp_442** (textlines)

Number of lines with corpus code 442  

 4 Relationship to External Offices/Institutions apart from the Government 

 44 constitutional courts 

 442 relation to parliament (if not coded as law-making (145))

**class:**  numeric \
<br>**unique:**  4 \
<br>**NAs:**  0 \
<br>**range:** *[ 0 ]* ... *[ 5 ]* \
<br>**examples:**  *[ 0 ], [ 0 ], [ 0 ], [ 0 ], [ 0 ], [ 0 ], [ 0 ], [ 0 ], [ 0 ], [ 0 ]* ... \
<br>

<p>&nbsp;</p>

**wds_corp_43** (textlines)

Number of words with corpus code 43   - see lns_corp_43   for more information.

**class:**  numeric \
<br>**unique:**  25 \
<br>**NAs:**  0 \
<br>**range:** *[ 0 ]* ... *[ 335 ]* \
<br>**examples:**  *[ 0 ], [ 0 ], [ 163 ], [ 0 ], [ 0 ], [ 0 ], [ 0 ], [ 0 ], [ 163 ], [ 0 ]* ... \
<br>

<p>&nbsp;</p>

**wds_corp_45** (textlines)

Number of words with corpus code 45   - see lns_corp_45   for more information.

**class:**  numeric \
<br>**unique:**  14 \
<br>**NAs:**  0 \
<br>**range:** *[ 0 ]* ... *[ 1001 ]* \
<br>**examples:**  *[ 0 ], [ 0 ], [ 0 ], [ 0 ], [ 0 ], [ 0 ], [ 0 ], [ 0 ], [ 0 ], [ 0 ]* ... \
<br>

<p>&nbsp;</p>

**wds_corp_411** (textlines)

Number of words with corpus code 411  - see lns_corp_411  for more information.

**class:**  numeric \
<br>**unique:**  27 \
<br>**NAs:**  0 \
<br>**range:** *[ 0 ]* ... *[ 1435 ]* \
<br>**examples:**  *[ 0 ], [ 0 ], [ 0 ], [ 0 ], [ 170 ], [ 414 ], [ 0 ], [ 0 ], [ 0 ], [ 0 ]* ... \
<br>

<p>&nbsp;</p>

**wds_corp_412** (textlines)

Number of words with corpus code 412  - see lns_corp_412  for more information.

**class:**  numeric \
<br>**unique:**  42 \
<br>**NAs:**  0 \
<br>**range:** *[ 0 ]* ... *[ 629 ]* \
<br>**examples:**  *[ 0 ], [ 60 ], [ 0 ], [ 0 ], [ 207 ], [ 171 ], [ 53 ], [ 110 ], [ 0 ], [ 148 ]* ... \
<br>

<p>&nbsp;</p>

**wds_corp_421** (textlines)

Number of words with corpus code 421  - see lns_corp_421  for more information.

**class:**  numeric \
<br>**unique:**  13 \
<br>**NAs:**  0 \
<br>**range:** *[ 0 ]* ... *[ 391 ]* \
<br>**examples:**  *[ 0 ], [ 0 ], [ 0 ], [ 0 ], [ 0 ], [ 0 ], [ 0 ], [ 0 ], [ 0 ], [ 33 ]* ... \
<br>

<p>&nbsp;</p>

**wds_corp_422** (textlines)

Number of words with corpus code 422  - see lns_corp_422  for more information.

**class:**  numeric \
<br>**unique:**  10 \
<br>**NAs:**  0 \
<br>**range:** *[ 0 ]* ... *[ 170 ]* \
<br>**examples:**  *[ 0 ], [ 0 ], [ 149 ], [ 0 ], [ 18 ], [ 0 ], [ 150 ], [ 0 ], [ 0 ], [ 0 ]* ... \
<br>

<p>&nbsp;</p>

**wds_corp_441** (textlines)

Number of words with corpus code 441  - see lns_corp_441  for more information.

**class:**  numeric \
<br>**unique:**  4 \
<br>**NAs:**  0 \
<br>**range:** *[ 0 ]* ... *[ 99 ]* \
<br>**examples:**  *[ 0 ], [ 0 ], [ 0 ], [ 0 ], [ 0 ], [ 0 ], [ 0 ], [ 0 ], [ 0 ], [ 0 ]* ... \
<br>

<p>&nbsp;</p>

**wds_corp_442** (textlines)

Number of words with corpus code 442  - see lns_corp_442  for more information.

**class:**  numeric \
<br>**unique:**  10 \
<br>**NAs:**  0 \
<br>**range:** *[ 0 ]* ... *[ 142 ]* \
<br>**examples:**  *[ 0 ], [ 37 ], [ 0 ], [ 0 ], [ 52 ], [ 142 ], [ 0 ], [ 0 ], [ 0 ], [ 0 ]* ... \
<br>

<p>&nbsp;</p>
## 7 raw corpus codes - 5 publicity



**lns_corp_51** (textlines)

Number of lines with corpus code 51   

 5 Generating Publicity 

 51 general rules regarding debate (e.g. time allotted for speaking, proportional representation of parties during debate, closure of debate) 

**class:**  numeric \
<br>**unique:**  64 \
<br>**NAs:**  0 \
<br>**range:** *[ 0 ]* ... *[ 111 ]* \
<br>**examples:**  *[ 8 ], [ 22 ], [ 9 ], [ 19 ], [ 19 ], [ 15 ], [ 71 ], [ 14 ], [ 108 ], [ 24 ]* ... \
<br>

<p>&nbsp;</p>

**lns_corp_52** (textlines)

Number of lines with corpus code 52   

 5 Generating Publicity 

 52 debates outside of law-making (e.g. topical hours ...)

**class:**  numeric \
<br>**unique:**  19 \
<br>**NAs:**  0 \
<br>**range:** *[ 0 ]* ... *[ 32 ]* \
<br>**examples:**  *[ 3 ], [ 0 ], [ 0 ], [ 3 ], [ 0 ], [ 0 ], [ 2 ], [ 0 ], [ 0 ], [ 0 ]* ... \
<br>

<p>&nbsp;</p>

**lns_corp_53** (textlines)

Number of lines with corpus code 53   

 5 Generating Publicity 

 53 question rights

**class:**  numeric \
<br>**unique:**  55 \
<br>**NAs:**  0 \
<br>**range:** *[ 0 ]* ... *[ 89 ]* \
<br>**examples:**  *[ 13 ], [ 11 ], [ 5 ], [ 13 ], [ 29 ], [ 50 ], [ 13 ], [ 10 ], [ 33 ], [ 18 ]* ... \
<br>

<p>&nbsp;</p>

**lns_corp_54** (textlines)

Number of lines with corpus code 54   

 5 Generating Publicity 

 54 petitions and petition committee

**class:**  numeric \
<br>**unique:**  25 \
<br>**NAs:**  0 \
<br>**range:** *[ 0 ]* ... *[ 49 ]* \
<br>**examples:**  *[ 15 ], [ 0 ], [ 9 ], [ 12 ], [ 9 ], [ 9 ], [ 0 ], [ 5 ], [ 15 ], [ 7 ]* ... \
<br>

<p>&nbsp;</p>

**lns_corp_55** (textlines)

Number of lines with corpus code 55   

 5 Generating Publicity 

 55 relationship to media and citizens (e.g. parliamentary TV, accreditation of journalists, publicity of meetings, admissibility of visitors); regulation of matters of confidentiality 

**class:**  numeric \
<br>**unique:**  31 \
<br>**NAs:**  0 \
<br>**range:** *[ 0 ]* ... *[ 67 ]* \
<br>**examples:**  *[ 27 ], [ 1 ], [ 12 ], [ 9 ], [ 9 ], [ 9 ], [ 9 ], [ 8 ], [ 7 ], [ 0 ]* ... \
<br>

<p>&nbsp;</p>

**lns_corp_56** (textlines)

Number of lines with corpus code 56   

 5 Generating Publicity 

 56 protocols and parliamentary documents; forwarding of documents and decisions to other bodies 

**class:**  numeric \
<br>**unique:**  36 \
<br>**NAs:**  0 \
<br>**range:** *[ 0 ]* ... *[ 61 ]* \
<br>**examples:**  *[ 9 ], [ 8 ], [ 15 ], [ 6 ], [ 6 ], [ 28 ], [ 5 ], [ 13 ], [ 9 ], [ 9 ]* ... \
<br>

<p>&nbsp;</p>

**wds_corp_51** (textlines)

Number of words with corpus code 51   - see lns_corp_51   for more information.

**class:**  numeric \
<br>**unique:**  171 \
<br>**NAs:**  0 \
<br>**range:** *[ 0 ]* ... *[ 1649 ]* \
<br>**examples:**  *[ 681 ], [ 546 ], [ 660 ], [ 551 ], [ 570 ], [ 498 ], [ 488 ], [ 980 ], [ 560 ]* ... \
<br>

<p>&nbsp;</p>

**wds_corp_52** (textlines)

Number of words with corpus code 52   - see lns_corp_52   for more information.

**class:**  numeric \
<br>**unique:**  43 \
<br>**NAs:**  0 \
<br>**range:** *[ 0 ]* ... *[ 1025 ]* \
<br>**examples:**  *[ 0 ], [ 275 ], [ 343 ], [ 236 ], [ 295 ], [ 0 ], [ 275 ], [ 0 ], [ 419 ], [ 0 * ... \
<br>

<p>&nbsp;</p>

**wds_corp_53** (textlines)

Number of words with corpus code 53   - see lns_corp_53   for more information.

**class:**  numeric \
<br>**unique:**  189 \
<br>**NAs:**  0 \
<br>**range:** *[ 0 ]* ... *[ 2691 ]* \
<br>**examples:**  *[ 622 ], [ 495 ], [ 75 ], [ 1222 ], [ 537 ], [ 279 ], [ 766 ], [ 1019 ], [ 0 ],* ... \
<br>

<p>&nbsp;</p>

**wds_corp_54** (textlines)

Number of words with corpus code 54   - see lns_corp_54   for more information.

**class:**  numeric \
<br>**unique:**  74 \
<br>**NAs:**  0 \
<br>**range:** *[ 0 ]* ... *[ 1106 ]* \
<br>**examples:**  *[ 457 ], [ 117 ], [ 630 ], [ 509 ], [ 0 ], [ 448 ], [ 0 ], [ 0 ], [ 211 ], [ 0 * ... \
<br>

<p>&nbsp;</p>

**wds_corp_55** (textlines)

Number of words with corpus code 55   - see lns_corp_55   for more information.

**class:**  numeric \
<br>**unique:**  128 \
<br>**NAs:**  0 \
<br>**range:** *[ 0 ]* ... *[ 1851 ]* \
<br>**examples:**  *[ 401 ], [ 401 ], [ 201 ], [ 249 ], [ 227 ], [ 146 ], [ 691 ], [ 249 ], [ 309 ]* ... \
<br>

<p>&nbsp;</p>

**wds_corp_56** (textlines)

Number of words with corpus code 56   - see lns_corp_56   for more information.

**class:**  numeric \
<br>**unique:**  147 \
<br>**NAs:**  0 \
<br>**range:** *[ 0 ]* ... *[ 1340 ]* \
<br>**examples:**  *[ 561 ], [ 712 ], [ 472 ], [ 712 ], [ 78 ], [ 464 ], [ 278 ], [ 712 ], [ 711 ],* ... \
<br>

<p>&nbsp;</p>
## 7 raw corpus codes - 6 committees



**lns_corp_66** (textlines)

Number of lines with corpus code 66   

 6 Internal Organization of Parliament 

 66 opposition

**class:**  numeric \
<br>**unique:**  2 \
<br>**NAs:**  0 \
<br>**range:** *[ 0 ]* ... *[ 1 ]* \
<br>**examples:**  *[ 0 ], [ 0 ], [ 1 ], [ 0 ], [ 0 ], [ 0 ], [ 0 ], [ 1 ], [ 0 ], [ 0 ]* ... \
<br>

<p>&nbsp;</p>

**lns_corp_67** (textlines)

Number of lines with corpus code 67   

 6 Internal Organization of Parliament 

 67 special bodies for emergency situations

**class:**  numeric \
<br>**unique:**  5 \
<br>**NAs:**  0 \
<br>**range:** *[ 0 ]* ... *[ 7 ]* \
<br>**examples:**  *[ 0 ], [ 0 ], [ 6 ], [ 6 ], [ 0 ], [ 0 ], [ 0 ], [ 0 ], [ 0 ], [ 6 ]* ... \
<br>

<p>&nbsp;</p>

**lns_corp_68** (textlines)

Number of lines with corpus code 68   

 6 Internal Organization of Parliament 

 68 parliamentary administration

**class:**  numeric \
<br>**unique:**  26 \
<br>**NAs:**  0 \
<br>**range:** *[ 0 ]* ... *[ 47 ]* \
<br>**examples:**  *[ 15 ], [ 3 ], [ 8 ], [ 7 ], [ 0 ], [ 15 ], [ 0 ], [ 3 ], [ 18 ], [ 8 ]* ... \
<br>

<p>&nbsp;</p>

**lns_corp_611** (textlines)

Number of lines with corpus code 611  

 6 Internal Organization of Parliament 

 61 plenary 

 611 agenda setting and removal of items from the agenda (general rules which are not specifically regulated under 114)

**class:**  numeric \
<br>**unique:**  73 \
<br>**NAs:**  0 \
<br>**range:** *[ 0 ]* ... *[ 200 ]* \
<br>**examples:**  *[ 0 ], [ 68 ], [ 0 ], [ 5 ], [ 20 ], [ 32 ], [ 0 ], [ 0 ], [ 97 ], [ 17 ]* ... \
<br>

<p>&nbsp;</p>

**lns_corp_612** (textlines)

Number of lines with corpus code 612  

 6 Internal Organization of Parliament 

 61 plenary 

 612 chairing of meetings and measures to uphold order

**class:**  numeric \
<br>**unique:**  32 \
<br>**NAs:**  0 \
<br>**range:** *[ 0 ]* ... *[ 60 ]* \
<br>**examples:**  *[ 5 ], [ 58 ], [ 19 ], [ 6 ], [ 21 ], [ 12 ], [ 4 ], [ 0 ], [ 2 ], [ 24 ]* ... \
<br>

<p>&nbsp;</p>

**lns_corp_613** (textlines)

Number of lines with corpus code 613  

 6 Internal Organization of Parliament 

 61 plenary 

 613 sitting times

**class:**  numeric \
<br>**unique:**  21 \
<br>**NAs:**  0 \
<br>**range:** *[ 0 ]* ... *[ 32 ]* \
<br>**examples:**  *[ 4 ], [ 3 ], [ 6 ], [ 10 ], [ 6 ], [ 6 ], [ 20 ], [ 6 ], [ 10 ], [ 4 ]* ... \
<br>

<p>&nbsp;</p>

**lns_corp_631** (textlines)

Number of lines with corpus code 631  

 6 Internal Organization of Parliament 

 63 committees (if not coded as more specific category (e.g. 13; 24; 54; 55; 72)) 

 631 general regulations regarding types of committees

**class:**  numeric \
<br>**unique:**  13 \
<br>**NAs:**  0 \
<br>**range:** *[ 0 ]* ... *[ 13 ]* \
<br>**examples:**  *[ 7 ], [ 8 ], [ 2 ], [ 0 ], [ 2 ], [ 1 ], [ 0 ], [ 1 ], [ 0 ], [ 1 ]* ... \
<br>

<p>&nbsp;</p>

**lns_corp_632** (textlines)

Number of lines with corpus code 632  

 6 Internal Organization of Parliament 

 63 committees (if not coded as more specific category (e.g. 13; 24; 54; 55; 72)) 

 632 membership and committee jurisdiction (area of influence-control .g. finance, economy, agriculture...)

**class:**  numeric \
<br>**unique:**  56 \
<br>**NAs:**  0 \
<br>**range:** *[ 0 ]* ... *[ 164 ]* \
<br>**examples:**  *[ 32 ], [ 1 ], [ 26 ], [ 25 ], [ 42 ], [ 8 ], [ 7 ], [ 7 ], [ 40 ], [ 5 ]* ... \
<br>

<p>&nbsp;</p>

**lns_corp_633** (textlines)

Number of lines with corpus code 633  

 6 Internal Organization of Parliament 

 63 committees (if not coded as more specific category (e.g. 13; 24; 54; 55; 72)) 

 633 formal organizational units of committee (e.g. chair of committee, sub-committees, staff)

**class:**  numeric \
<br>**unique:**  17 \
<br>**NAs:**  0 \
<br>**range:** *[ 0 ]* ... *[ 24 ]* \
<br>**examples:**  *[ 7 ], [ 7 ], [ 6 ], [ 4 ], [ 2 ], [ 2 ], [ 2 ], [ 2 ], [ 3 ], [ 5 ]* ... \
<br>

<p>&nbsp;</p>

**lns_corp_634** (textlines)

Number of lines with corpus code 634  

 6 Internal Organization of Parliament 

 63 committees (if not coded as more specific category (e.g. 13; 24; 54; 55; 72)) 

 634 agenda and procedures (details on how decisions are taken) within committees (if not coded as law-making (13))

**class:**  numeric \
<br>**unique:**  30 \
<br>**NAs:**  0 \
<br>**range:** *[ 0 ]* ... *[ 39 ]* \
<br>**examples:**  *[ 8 ], [ 8 ], [ 3 ], [ 33 ], [ 3 ], [ 18 ], [ 5 ], [ 1 ], [ 35 ], [ 6 ]* ... \
<br>

<p>&nbsp;</p>

**lns_corp_636** (textlines)

Number of lines with corpus code 636  

 6 Internal Organization of Parliament 

 63 committees (if not coded as more specific category (e.g. 13; 24; 54; 55; 72)) 

 636 investigative competencies of regular committees (NOT committees of inquiry (637))

**class:**  numeric \
<br>**unique:**  18 \
<br>**NAs:**  0 \
<br>**range:** *[ 0 ]* ... *[ 21 ]* \
<br>**examples:**  *[ 6 ], [ 0 ], [ 7 ], [ 0 ], [ 0 ], [ 6 ], [ 0 ], [ 6 ], [ 5 ], [ 5 ]* ... \
<br>

<p>&nbsp;</p>

**lns_corp_637** (textlines)

Number of lines with corpus code 637  

 6 Internal Organization of Parliament 

 63 committees (if not coded as more specific category (e.g. 13; 24; 54; 55; 72)) 

 637 committee of inquiry 

**class:**  numeric \
<br>**unique:**  25 \
<br>**NAs:**  0 \
<br>**range:** *[ 0 ]* ... *[ 78 ]* \
<br>**examples:**  *[ 0 ], [ 6 ], [ 0 ], [ 0 ], [ 0 ], [ 21 ], [ 1 ], [ 3 ], [ 0 ], [ 21 ]* ... \
<br>

<p>&nbsp;</p>

**lns_corp_638** (textlines)

Number of lines with corpus code 638  

 6 Internal Organization of Parliament 

 63 committees (if not coded as more specific category (e.g. 13; 24; 54; 55; 72)) 

 638 enquete commission

**class:**  numeric \
<br>**unique:**  11 \
<br>**NAs:**  0 \
<br>**range:** *[ 0 ]* ... *[ 20 ]* \
<br>**examples:**  *[ 0 ], [ 0 ], [ 0 ], [ 0 ], [ 0 ], [ 0 ], [ 0 ], [ 0 ], [ 0 ], [ 3 ]* ... \
<br>

<p>&nbsp;</p>

**lns_corp_639** (textlines)

Number of lines with corpus code 639  

 6 Internal Organization of Parliament 

 63 committees (if not coded as more specific category (e.g. 13; 24; 54; 55; 72)) 

 639 other special committees which are not explicitly referenced in this coding manual  (e.g. oversight committees in Switzerland)

**class:**  numeric \
<br>**unique:**  79 \
<br>**NAs:**  0 \
<br>**range:** *[ 0 ]* ... *[ 211 ]* \
<br>**examples:**  *[ 48 ], [ 11 ], [ 6 ], [ 0 ], [ 0 ], [ 6 ], [ 68 ], [ 6 ], [ 9 ], [ 5 ]* ... \
<br>

<p>&nbsp;</p>

**lns_corp_641** (textlines)

Number of lines with corpus code 641  

 6 Internal Organization of Parliament 

 64 parliamentary party groups 

 641 formation of parliamentary party groups

**class:**  numeric \
<br>**unique:**  11 \
<br>**NAs:**  0 \
<br>**range:** *[ 0 ]* ... *[ 12 ]* \
<br>**examples:**  *[ 0 ], [ 6 ], [ 0 ], [ 6 ], [ 11 ], [ 3 ], [ 0 ], [ 3 ], [ 5 ], [ 3 ]* ... \
<br>

<p>&nbsp;</p>

**lns_corp_642** (textlines)

Number of lines with corpus code 642  

 6 Internal Organization of Parliament 

 64 parliamentary party groups 

 642 rights and obligations of parliamentary party groups (if not coded more specifically as e.g. 112; 51; 52; 53)

**class:**  numeric \
<br>**unique:**  14 \
<br>**NAs:**  0 \
<br>**range:** *[ 0 ]* ... *[ 55 ]* \
<br>**examples:**  *[ 0 ], [ 0 ], [ 2 ], [ 0 ], [ 2 ], [ 0 ], [ 0 ], [ 0 ], [ 0 ], [ 0 ]* ... \
<br>

<p>&nbsp;</p>

**lns_corp_643** (textlines)

Number of lines with corpus code 643  

 6 Internal Organization of Parliament 

 64 parliamentary party groups 

 643 financial and staff resources

**class:**  numeric \
<br>**unique:**  7 \
<br>**NAs:**  0 \
<br>**range:** *[ 0 ]* ... *[ 6 ]* \
<br>**examples:**  *[ 4 ], [ 0 ], [ 1 ], [ 0 ], [ 0 ], [ 1 ], [ 0 ], [ 0 ], [ 0 ], [ 2 ]* ... \
<br>

<p>&nbsp;</p>

**lns_corp_651** (textlines)

Number of lines with corpus code 651  

 6 Internal Organization of Parliament 

 65 individual members of parlaiment 

 651 election, entry into office, resignation, incompatibilities, legal status, immunity, indemnity

**class:**  numeric \
<br>**unique:**  34 \
<br>**NAs:**  0 \
<br>**range:** *[ 0 ]* ... *[ 56 ]* \
<br>**examples:**  *[ 23 ], [ 13 ], [ 9 ], [ 56 ], [ 4 ], [ 6 ], [ 2 ], [ 8 ], [ 10 ], [ 6 ]* ... \
<br>

<p>&nbsp;</p>

**lns_corp_652** (textlines)

Number of lines with corpus code 652  

 6 Internal Organization of Parliament 

 65 individual members of parlaiment 

 652 rights and obligations of individual members of parliament (if not coded more specifically as e.g. 112; 51; 52; 53)

**class:**  numeric \
<br>**unique:**  29 \
<br>**NAs:**  0 \
<br>**range:** *[ 0 ]* ... *[ 67 ]* \
<br>**examples:**  *[ 8 ], [ 2 ], [ 3 ], [ 0 ], [ 4 ], [ 0 ], [ 3 ], [ 4 ], [ 1 ], [ 6 ]* ... \
<br>

<p>&nbsp;</p>

**lns_corp_653** (textlines)

Number of lines with corpus code 653  

 6 Internal Organization of Parliament 

 65 individual members of parlaiment 

 653 salary, financial and staff resources

**class:**  numeric \
<br>**unique:**  6 \
<br>**NAs:**  0 \
<br>**range:** *[ 0 ]* ... *[ 7 ]* \
<br>**examples:**  *[ 0 ], [ 0 ], [ 0 ], [ 0 ], [ 2 ], [ 0 ], [ 0 ], [ 1 ], [ 0 ], [ 0 ]* ... \
<br>

<p>&nbsp;</p>

**lns_corp_6211** (textlines)

Number of lines with corpus code 6211 

 6 Internal Organization of Parliament 

 62 parliamentary presiding bodies 

 621 president of parliament, vice presidents, secretaries and clerks 

 6211 election, resignation and internal decision rules

**class:**  numeric \
<br>**unique:**  26 \
<br>**NAs:**  0 \
<br>**range:** *[ 0 ]* ... *[ 36 ]* \
<br>**examples:**  *[ 18 ], [ 1 ], [ 9 ], [ 7 ], [ 10 ], [ 25 ], [ 4 ], [ 10 ], [ 7 ], [ 7 ]* ... \
<br>

<p>&nbsp;</p>

**lns_corp_6212** (textlines)

Number of lines with corpus code 6212 

 6 Internal Organization of Parliament 

 62 parliamentary presiding bodies 

 621 president of parliament, vice presidents, secretaries and clerks 

 6212 responsibilities (if not coded as more specific category  (e.g. 612))

**class:**  numeric \
<br>**unique:**  24 \
<br>**NAs:**  0 \
<br>**range:** *[ 0 ]* ... *[ 72 ]* \
<br>**examples:**  *[ 8 ], [ 6 ], [ 2 ], [ 1 ], [ 8 ], [ 14 ], [ 2 ], [ 0 ], [ 8 ], [ 2 ]* ... \
<br>

<p>&nbsp;</p>

**lns_corp_6221** (textlines)

Number of lines with corpus code 6221 

 6 Internal Organization of Parliament 

 62 parliamentary presiding bodies 

 622 council of elders or similar coordination body 

 6221 composition, election, resignation, internal decision rules

**class:**  numeric \
<br>**unique:**  12 \
<br>**NAs:**  0 \
<br>**range:** *[ 0 ]* ... *[ 13 ]* \
<br>**examples:**  *[ 7 ], [ 1 ], [ 3 ], [ 5 ], [ 0 ], [ 2 ], [ 0 ], [ 0 ], [ 5 ], [ 4 ]* ... \
<br>

<p>&nbsp;</p>

**lns_corp_6222** (textlines)

Number of lines with corpus code 6222 

 6 Internal Organization of Parliament 

 62 parliamentary presiding bodies 

 622 council of elders or similar coordination body 

 6222 responsibilities (if not coded as more specific category (e.g. 612))

**class:**  numeric \
<br>**unique:**  16 \
<br>**NAs:**  0 \
<br>**range:** *[ 0 ]* ... *[ 16 ]* \
<br>**examples:**  *[ 2 ], [ 12 ], [ 0 ], [ 0 ], [ 13 ], [ 0 ], [ 3 ], [ 4 ], [ 2 ], [ 6 ]* ... \
<br>

<p>&nbsp;</p>

**lns_corp_6351** (textlines)

Number of lines with corpus code 6351 

 6 Internal Organization of Parliament 

 63 committees 

 relations to other bodies 

 6351 relation to plenary (if not coded as 124; 134; 34)

**class:**  numeric \
<br>**unique:**  6 \
<br>**NAs:**  0 \
<br>**range:** *[ 0 ]* ... *[ 6 ]* \
<br>**examples:**  *[ 0 ], [ 0 ], [ 1 ], [ 0 ], [ 0 ], [ 0 ], [ 0 ], [ 0 ], [ 0 ], [ 0 ]* ... \
<br>

<p>&nbsp;</p>

**lns_corp_6352** (textlines)

Number of lines with corpus code 6352 

 6 Internal Organization of Parliament 

 63 committees 

 relations to other bodies 

 6352 relation to other committees

**class:**  numeric \
<br>**unique:**  8 \
<br>**NAs:**  0 \
<br>**range:** *[ 0 ]* ... *[ 7 ]* \
<br>**examples:**  *[ 2 ], [ 0 ], [ 0 ], [ 6 ], [ 0 ], [ 1 ], [ 0 ], [ 1 ], [ 0 ], [ 1 ]* ... \
<br>

<p>&nbsp;</p>

**wds_corp_66** (textlines)

Number of words with corpus code 66   - see lns_corp_66   for more information.

**class:**  numeric \
<br>**unique:**  2 \
<br>**NAs:**  0 \
<br>**range:** *[ 0 ]* ... *[ 41 ]* \
<br>**examples:**  *[ 0 ], [ 0 ], [ 0 ], [ 41 ], [ 0 ], [ 0 ], [ 0 ], [ 0 ], [ 0 ], [ 0 ]* ... \
<br>

<p>&nbsp;</p>

**wds_corp_67** (textlines)

Number of words with corpus code 67   - see lns_corp_67   for more information.

**class:**  numeric \
<br>**unique:**  8 \
<br>**NAs:**  0 \
<br>**range:** *[ 0 ]* ... *[ 137 ]* \
<br>**examples:**  *[ 0 ], [ 0 ], [ 0 ], [ 0 ], [ 0 ], [ 0 ], [ 124 ], [ 0 ], [ 137 ], [ 0 ]* ... \
<br>

<p>&nbsp;</p>

**wds_corp_68** (textlines)

Number of words with corpus code 68   - see lns_corp_68   for more information.

**class:**  numeric \
<br>**unique:**  77 \
<br>**NAs:**  0 \
<br>**range:** *[ 0 ]* ... *[ 1093 ]* \
<br>**examples:**  *[ 0 ], [ 0 ], [ 98 ], [ 126 ], [ 178 ], [ 90 ], [ 904 ], [ 906 ], [ 196 ], [ 0 * ... \
<br>

<p>&nbsp;</p>

**wds_corp_611** (textlines)

Number of words with corpus code 611  - see lns_corp_611  for more information.

**class:**  numeric \
<br>**unique:**  157 \
<br>**NAs:**  0 \
<br>**range:** *[ 0 ]* ... *[ 6791 ]* \
<br>**examples:**  *[ 3756 ], [ 0 ], [ 301 ], [ 301 ], [ 375 ], [ 0 ], [ 4757 ], [ 169 ], [ 140 ], * ... \
<br>

<p>&nbsp;</p>

**wds_corp_612** (textlines)

Number of words with corpus code 612  - see lns_corp_612  for more information.

**class:**  numeric \
<br>**unique:**  94 \
<br>**NAs:**  0 \
<br>**range:** *[ 0 ]* ... *[ 2221 ]* \
<br>**examples:**  *[ 136 ], [ 88 ], [ 88 ], [ 695 ], [ 741 ], [ 294 ], [ 0 ], [ 452 ], [ 439 ], [ * ... \
<br>

<p>&nbsp;</p>

**wds_corp_613** (textlines)

Number of words with corpus code 613  - see lns_corp_613  for more information.

**class:**  numeric \
<br>**unique:**  96 \
<br>**NAs:**  0 \
<br>**range:** *[ 0 ]* ... *[ 842 ]* \
<br>**examples:**  *[ 411 ], [ 98 ], [ 185 ], [ 165 ], [ 275 ], [ 161 ], [ 355 ], [ 166 ], [ 273 ],* ... \
<br>

<p>&nbsp;</p>

**wds_corp_631** (textlines)

Number of words with corpus code 631  - see lns_corp_631  for more information.

**class:**  numeric \
<br>**unique:**  56 \
<br>**NAs:**  0 \
<br>**range:** *[ 0 ]* ... *[ 518 ]* \
<br>**examples:**  *[ 439 ], [ 0 ], [ 17 ], [ 19 ], [ 200 ], [ 20 ], [ 112 ], [ 0 ], [ 475 ], [ 0 ]* ... \
<br>

<p>&nbsp;</p>

**wds_corp_632** (textlines)

Number of words with corpus code 632  - see lns_corp_632  for more information.

**class:**  numeric \
<br>**unique:**  243 \
<br>**NAs:**  0 \
<br>**range:** *[ 0 ]* ... *[ 1313 ]* \
<br>**examples:**  *[ 26 ], [ 735 ], [ 194 ], [ 856 ], [ 371 ], [ 0 ], [ 916 ], [ 493 ], [ 980 ], [* ... \
<br>

<p>&nbsp;</p>

**wds_corp_633** (textlines)

Number of words with corpus code 633  - see lns_corp_633  for more information.

**class:**  numeric \
<br>**unique:**  94 \
<br>**NAs:**  0 \
<br>**range:** *[ 0 ]* ... *[ 790 ]* \
<br>**examples:**  *[ 145 ], [ 255 ], [ 8 ], [ 219 ], [ 204 ], [ 156 ], [ 13 ], [ 175 ], [ 748 ], [* ... \
<br>

<p>&nbsp;</p>

**wds_corp_634** (textlines)

Number of words with corpus code 634  - see lns_corp_634  for more information.

**class:**  numeric \
<br>**unique:**  129 \
<br>**NAs:**  0 \
<br>**range:** *[ 0 ]* ... *[ 1288 ]* \
<br>**examples:**  *[ 277 ], [ 262 ], [ 1125 ], [ 1087 ], [ 277 ], [ 202 ], [ 381 ], [ 158 ], [ 137* ... \
<br>

<p>&nbsp;</p>

**wds_corp_636** (textlines)

Number of words with corpus code 636  - see lns_corp_636  for more information.

**class:**  numeric \
<br>**unique:**  84 \
<br>**NAs:**  0 \
<br>**range:** *[ 0 ]* ... *[ 878 ]* \
<br>**examples:**  *[ 88 ], [ 56 ], [ 31 ], [ 80 ], [ 127 ], [ 47 ], [ 0 ], [ 195 ], [ 0 ], [ 264 ]* ... \
<br>

<p>&nbsp;</p>

**wds_corp_637** (textlines)

Number of words with corpus code 637  - see lns_corp_637  for more information.

**class:**  numeric \
<br>**unique:**  55 \
<br>**NAs:**  0 \
<br>**range:** *[ 0 ]* ... *[ 2444 ]* \
<br>**examples:**  *[ 0 ], [ 0 ], [ 0 ], [ 120 ], [ 120 ], [ 449 ], [ 0 ], [ 0 ], [ 0 ], [ 0 ]* ... \
<br>

<p>&nbsp;</p>

**wds_corp_638** (textlines)

Number of words with corpus code 638  - see lns_corp_638  for more information.

**class:**  numeric \
<br>**unique:**  20 \
<br>**NAs:**  0 \
<br>**range:** *[ 0 ]* ... *[ 649 ]* \
<br>**examples:**  *[ 0 ], [ 0 ], [ 183 ], [ 0 ], [ 0 ], [ 0 ], [ 0 ], [ 0 ], [ 0 ], [ 0 ]* ... \
<br>

<p>&nbsp;</p>

**wds_corp_639** (textlines)

Number of words with corpus code 639  - see lns_corp_639  for more information.

**class:**  numeric \
<br>**unique:**  207 \
<br>**NAs:**  0 \
<br>**range:** *[ 0 ]* ... *[ 6014 ]* \
<br>**examples:**  *[ 956 ], [ 324 ], [ 323 ], [ 63 ], [ 249 ], [ 248 ], [ 163 ], [ 248 ], [ 264 ],* ... \
<br>

<p>&nbsp;</p>

**wds_corp_641** (textlines)

Number of words with corpus code 641  - see lns_corp_641  for more information.

**class:**  numeric \
<br>**unique:**  45 \
<br>**NAs:**  0 \
<br>**range:** *[ 0 ]* ... *[ 439 ]* \
<br>**examples:**  *[ 324 ], [ 137 ], [ 0 ], [ 0 ], [ 0 ], [ 0 ], [ 0 ], [ 137 ], [ 77 ], [ 198 ]* ... \
<br>

<p>&nbsp;</p>

**wds_corp_642** (textlines)

Number of words with corpus code 642  - see lns_corp_642  for more information.

**class:**  numeric \
<br>**unique:**  32 \
<br>**NAs:**  0 \
<br>**range:** *[ 0 ]* ... *[ 643 ]* \
<br>**examples:**  *[ 49 ], [ 0 ], [ 77 ], [ 0 ], [ 0 ], [ 149 ], [ 0 ], [ 42 ], [ 0 ], [ 30 ]* ... \
<br>

<p>&nbsp;</p>

**wds_corp_643** (textlines)

Number of words with corpus code 643  - see lns_corp_643  for more information.

**class:**  numeric \
<br>**unique:**  22 \
<br>**NAs:**  0 \
<br>**range:** *[ 0 ]* ... *[ 202 ]* \
<br>**examples:**  *[ 0 ], [ 0 ], [ 0 ], [ 28 ], [ 0 ], [ 0 ], [ 0 ], [ 0 ], [ 0 ], [ 28 ]* ... \
<br>

<p>&nbsp;</p>

**wds_corp_651** (textlines)

Number of words with corpus code 651  - see lns_corp_651  for more information.

**class:**  numeric \
<br>**unique:**  121 \
<br>**NAs:**  0 \
<br>**range:** *[ 0 ]* ... *[ 2439 ]* \
<br>**examples:**  *[ 78 ], [ 274 ], [ 78 ], [ 223 ], [ 78 ], [ 201 ], [ 225 ], [ 360 ], [ 274 ], [* ... \
<br>

<p>&nbsp;</p>

**wds_corp_652** (textlines)

Number of words with corpus code 652  - see lns_corp_652  for more information.

**class:**  numeric \
<br>**unique:**  113 \
<br>**NAs:**  0 \
<br>**range:** *[ 0 ]* ... *[ 2080 ]* \
<br>**examples:**  *[ 183 ], [ 224 ], [ 175 ], [ 224 ], [ 163 ], [ 175 ], [ 137 ], [ 86 ], [ 267 ],* ... \
<br>

<p>&nbsp;</p>

**wds_corp_653** (textlines)

Number of words with corpus code 653  - see lns_corp_653  for more information.

**class:**  numeric \
<br>**unique:**  14 \
<br>**NAs:**  0 \
<br>**range:** *[ 0 ]* ... *[ 328 ]* \
<br>**examples:**  *[ 0 ], [ 0 ], [ 58 ], [ 50 ], [ 0 ], [ 0 ], [ 0 ], [ 58 ], [ 0 ], [ 58 ]* ... \
<br>

<p>&nbsp;</p>

**wds_corp_6211** (textlines)

Number of words with corpus code 6211 - see lns_corp_6211 for more information.

**class:**  numeric \
<br>**unique:**  96 \
<br>**NAs:**  0 \
<br>**range:** *[ 0 ]* ... *[ 1308 ]* \
<br>**examples:**  *[ 385 ], [ 189 ], [ 308 ], [ 189 ], [ 212 ], [ 204 ], [ 39 ], [ 212 ], [ 142 ],* ... \
<br>

<p>&nbsp;</p>

**wds_corp_6212** (textlines)

Number of words with corpus code 6212 - see lns_corp_6212 for more information.

**class:**  numeric \
<br>**unique:**  106 \
<br>**NAs:**  0 \
<br>**range:** *[ 0 ]* ... *[ 1060 ]* \
<br>**examples:**  *[ 440 ], [ 320 ], [ 0 ], [ 407 ], [ 417 ], [ 402 ], [ 13 ], [ 44 ], [ 272 ], [ * ... \
<br>

<p>&nbsp;</p>

**wds_corp_6221** (textlines)

Number of words with corpus code 6221 - see lns_corp_6221 for more information.

**class:**  numeric \
<br>**unique:**  63 \
<br>**NAs:**  0 \
<br>**range:** *[ 0 ]* ... *[ 312 ]* \
<br>**examples:**  *[ 127 ], [ 0 ], [ 0 ], [ 0 ], [ 58 ], [ 128 ], [ 66 ], [ 126 ], [ 136 ], [ 154 * ... \
<br>

<p>&nbsp;</p>

**wds_corp_6222** (textlines)

Number of words with corpus code 6222 - see lns_corp_6222 for more information.

**class:**  numeric \
<br>**unique:**  61 \
<br>**NAs:**  0 \
<br>**range:** *[ 0 ]* ... *[ 598 ]* \
<br>**examples:**  *[ 0 ], [ 14 ], [ 0 ], [ 209 ], [ 0 ], [ 156 ], [ 0 ], [ 0 ], [ 0 ], [ 257 ]* ... \
<br>

<p>&nbsp;</p>

**wds_corp_6351** (textlines)

Number of words with corpus code 6351 - see lns_corp_6351 for more information.

**class:**  numeric \
<br>**unique:**  22 \
<br>**NAs:**  0 \
<br>**range:** *[ 0 ]* ... *[ 179 ]* \
<br>**examples:**  *[ 0 ], [ 0 ], [ 0 ], [ 0 ], [ 0 ], [ 128 ], [ 0 ], [ 27 ], [ 0 ], [ 0 ]* ... \
<br>

<p>&nbsp;</p>

**wds_corp_6352** (textlines)

Number of words with corpus code 6352 - see lns_corp_6352 for more information.

**class:**  numeric \
<br>**unique:**  42 \
<br>**NAs:**  0 \
<br>**range:** *[ 0 ]* ... *[ 323 ]* \
<br>**examples:**  *[ 0 ], [ 0 ], [ 20 ], [ 20 ], [ 0 ], [ 59 ], [ 0 ], [ 60 ], [ 234 ], [ 234 ]* ... \
<br>

<p>&nbsp;</p>
## 7 raw corpus codes - 7 to 999



**lns_corp_8** (textlines)

Number of lines with corpus code 8    

 8   General Rules Regarding Formation and Legislative Session; Discontinuity

**class:**  numeric \
<br>**unique:**  17 \
<br>**NAs:**  0 \
<br>**range:** *[ 0 ]* ... *[ 22 ]* \
<br>**examples:**  *[ 4 ], [ 10 ], [ 6 ], [ 9 ], [ 7 ], [ 0 ], [ 9 ], [ 10 ], [ 11 ], [ 3 ]* ... \
<br>

<p>&nbsp;</p>

**lns_corp_9** (textlines)

Number of lines with corpus code 9    

 9   Final Provisions

**class:**  numeric \
<br>**unique:**  13 \
<br>**NAs:**  0 \
<br>**range:** *[ 0 ]* ... *[ 12 ]* \
<br>**examples:**  *[ 0 ], [ 0 ], [ 1 ], [ 1 ], [ 0 ], [ 6 ], [ 0 ], [ 0 ], [ 0 ], [ 1 ]* ... \
<br>

<p>&nbsp;</p>

**lns_corp_10** (textlines)

Number of lines with corpus code 10   

 10  Miscellaneous (cannot be coded otherwise)

**class:**  numeric \
<br>**unique:**  48 \
<br>**NAs:**  0 \
<br>**range:** *[ 0 ]* ... *[ 164 ]* \
<br>**examples:**  *[ 3 ], [ 7 ], [ 3 ], [ 11 ], [ 4 ], [ 9 ], [ 19 ], [ 4 ], [ 164 ], [ 26 ]* ... \
<br>

<p>&nbsp;</p>

**lns_corp_71** (textlines)

Number of lines with corpus code 71   

 7 Change and Interpretation of the Standing Orders 

 71 rules regarding changing the standing orders

**class:**  numeric \
<br>**unique:**  12 \
<br>**NAs:**  0 \
<br>**range:** *[ 0 ]* ... *[ 25 ]* \
<br>**examples:**  *[ 0 ], [ 0 ], [ 0 ], [ 1 ], [ 0 ], [ 6 ], [ 3 ], [ 0 ], [ 0 ], [ 8 ]* ... \
<br>

<p>&nbsp;</p>

**lns_corp_72** (textlines)

Number of lines with corpus code 72   

 7 Change and Interpretation of the Standing Orders 

 72 rules regarding interpretation of and deviation from standing orders

**class:**  numeric \
<br>**unique:**  6 \
<br>**NAs:**  0 \
<br>**range:** *[ 0 ]* ... *[ 6 ]* \
<br>**examples:**  *[ 0 ], [ 0 ], [ 0 ], [ 0 ], [ 0 ], [ 0 ], [ 1 ], [ 0 ], [ 0 ], [ 1 ]* ... \
<br>

<p>&nbsp;</p>

**lns_corp_73** (textlines)

Number of lines with corpus code 73   

 7 Change and Interpretation of the Standing Orders 

 73 debate about standing orders and motions regarding the standing orders

**class:**  numeric \
<br>**unique:**  8 \
<br>**NAs:**  0 \
<br>**range:** *[ 0 ]* ... *[ 20 ]* \
<br>**examples:**  *[ 0 ], [ 0 ], [ 0 ], [ 0 ], [ 0 ], [ 1 ], [ 0 ], [ 0 ], [ 0 ], [ 0 ]* ... \
<br>

<p>&nbsp;</p>

**wds_corp_8** (textlines)

Number of words with corpus code 8    - see lns_corp_8    for more information.

**class:**  numeric \
<br>**unique:**  89 \
<br>**NAs:**  0 \
<br>**range:** *[ 0 ]* ... *[ 729 ]* \
<br>**examples:**  *[ 0 ], [ 39 ], [ 57 ], [ 237 ], [ 255 ], [ 0 ], [ 110 ], [ 111 ], [ 372 ], [ 18* ... \
<br>

<p>&nbsp;</p>

**wds_corp_9** (textlines)

Number of words with corpus code 9    - see lns_corp_9    for more information.

**class:**  numeric \
<br>**unique:**  45 \
<br>**NAs:**  0 \
<br>**range:** *[ 0 ]* ... *[ 633 ]* \
<br>**examples:**  *[ 0 ], [ 0 ], [ 0 ], [ 0 ], [ 0 ], [ 0 ], [ 0 ], [ 0 ], [ 0 ], [ 125 ]* ... \
<br>

<p>&nbsp;</p>

**wds_corp_10** (textlines)

Number of words with corpus code 10   - see lns_corp_10   for more information.

**class:**  numeric \
<br>**unique:**  162 \
<br>**NAs:**  0 \
<br>**range:** *[ 0 ]* ... *[ 3571 ]* \
<br>**examples:**  *[ 398 ], [ 275 ], [ 813 ], [ 978 ], [ 445 ], [ 467 ], [ 1917 ], [ 398 ], [ 95 ]* ... \
<br>

<p>&nbsp;</p>

**wds_corp_71** (textlines)

Number of words with corpus code 71   - see lns_corp_71   for more information.

**class:**  numeric \
<br>**unique:**  43 \
<br>**NAs:**  0 \
<br>**range:** *[ 0 ]* ... *[ 588 ]* \
<br>**examples:**  *[ 46 ], [ 0 ], [ 27 ], [ 0 ], [ 185 ], [ 0 ], [ 142 ], [ 0 ], [ 0 ], [ 0 ]* ... \
<br>

<p>&nbsp;</p>

**wds_corp_72** (textlines)

Number of words with corpus code 72   - see lns_corp_72   for more information.

**class:**  numeric \
<br>**unique:**  23 \
<br>**NAs:**  0 \
<br>**range:** *[ 0 ]* ... *[ 148 ]* \
<br>**examples:**  *[ 0 ], [ 148 ], [ 37 ], [ 0 ], [ 0 ], [ 0 ], [ 0 ], [ 0 ], [ 0 ], [ 0 ]* ... \
<br>

<p>&nbsp;</p>

**wds_corp_73** (textlines)

Number of words with corpus code 73   - see lns_corp_73   for more information.

**class:**  numeric \
<br>**unique:**  18 \
<br>**NAs:**  0 \
<br>**range:** *[ 0 ]* ... *[ 296 ]* \
<br>**examples:**  *[ 0 ], [ 0 ], [ 0 ], [ 0 ], [ 91 ], [ 15 ], [ 209 ], [ 0 ], [ 91 ], [ 15 ]* ... \
<br>

<p>&nbsp;</p>
## 7 raw corpus codes - from 7 to 999



**lns_corp_999** (textlines)

Number of lines with corpus code 999  

 999 Footnotes and Titles Without Relevant Content

**class:**  integer \
<br>**unique:**  265 \
<br>**NAs:**  0 \
<br>**range:** *[ 29 ]* ... *[ 1728 ]* \
<br>**examples:**  *[ 214 ], [ 36 ], [ 36 ], [ 410 ], [ 138 ], [ 102 ], [ 93 ], [ 94 ], [ 108 ], [ * ... \
<br>

<p>&nbsp;</p>

**wds_corp_999** (textlines)

Number of words with corpus code 999  - see lns_corp_999  for more information.

**class:**  integer \
<br>**unique:**  333 \
<br>**NAs:**  0 \
<br>**range:** *[ 38 ]* ... *[ 30211 ]* \
<br>**examples:**  *[ 646 ], [ 1154 ], [ 362 ], [ 280 ], [ 194 ], [ 1064 ], [ 328 ], [ 628 ], [ 643* ... \
<br>

<p>&nbsp;</p>
## 8 aggregated corpus codes



**lns_corp_agg_1** (textlines)

Number of lines with aggregated corpus code 1 - lawmaking               

 codes: 111, 112, 113, 114, 121, 122, 123, 124, 125, 131, 132, 133, 134, 141, 142, 143, 144, 145 

**class:**  integer \
<br>**unique:**  114 \
<br>**NAs:**  0 \
<br>**range:** *[ 9 ]* ... *[ 192 ]* \
<br>**examples:**  *[ 34 ], [ 33 ], [ 66 ], [ 186 ], [ 89 ], [ 52 ], [ 69 ], [ 99 ], [ 52 ], [ 188 * ... \
<br>

<p>&nbsp;</p>

**lns_corp_agg_2** (textlines)

Number of lines with aggregated corpus code 2 - special decission rules 

 codes: 21, 22, 23, 241, 242, 243, 244, 26, 27, 28, 29, 67, 71, 72, 73

**class:**  numeric \
<br>**unique:**  130 \
<br>**NAs:**  0 \
<br>**range:** *[ 0 ]* ... *[ 342 ]* \
<br>**examples:**  *[ 21 ], [ 62 ], [ 55 ], [ 3 ], [ 25 ], [ 0 ], [ 32 ], [ 140 ], [ 123 ], [ 5 ]* ... \
<br>

<p>&nbsp;</p>

**lns_corp_agg_3** (textlines)

Number of lines with aggregated corpus code 3 - elections               

 codes: 25, 31, 32, 33, 411, 421, 441 

**class:**  numeric \
<br>**unique:**  45 \
<br>**NAs:**  0 \
<br>**range:** *[ 0 ]* ... *[ 98 ]* \
<br>**examples:**  *[ 0 ], [ 0 ], [ 50 ], [ 0 ], [ 11 ], [ 50 ], [ 46 ], [ 19 ], [ 45 ], [ 4 ]* ... \
<br>

<p>&nbsp;</p>

**lns_corp_agg_4** (textlines)

Number of lines with aggregated corpus code 4 - government control      

 codes: 412, 53, 54, 636, 637, 66 

**class:**  integer \
<br>**unique:**  83 \
<br>**NAs:**  0 \
<br>**range:** *[ 1 ]* ... *[ 164 ]* \
<br>**examples:**  *[ 29 ], [ 56 ], [ 24 ], [ 67 ], [ 30 ], [ 33 ], [ 49 ], [ 85 ], [ 35 ], [ 24 ]* ... \
<br>

<p>&nbsp;</p>

**lns_corp_agg_5** (textlines)

Number of lines with aggregated corpus code 5 - puplicity               

 codes: 121, 51, 52, 53, 55, 56, 611, 612, 613 

**class:**  integer \
<br>**unique:**  137 \
<br>**NAs:**  0 \
<br>**range:** *[ 7 ]* ... *[ 290 ]* \
<br>**examples:**  *[ 77 ], [ 115 ], [ 99 ], [ 102 ], [ 153 ], [ 52 ], [ 17 ], [ 120 ], [ 11 ], [ 6* ... \
<br>

<p>&nbsp;</p>

**lns_corp_agg_6** (textlines)

Number of lines with aggregated corpus code 6 - not used            

 codes: 34, 422, 43, 442, 45, 6211, 6212, 6221, 6222, 631, 632, 633, 634, 6351, 6352, 638, 639, 641, 642, 643, 651, 652, 653, 68, 8, 9, 10, 999

**class:**  integer \
<br>**unique:**  265 \
<br>**NAs:**  0 \
<br>**range:** *[ 29 ]* ... *[ 1728 ]* \
<br>**examples:**  *[ 351 ], [ 1728 ], [ 163 ], [ 407 ], [ 207 ], [ 143 ], [ 93 ], [ 108 ], [ 51 ],* ... \
<br>

<p>&nbsp;</p>

**lns_corp_agg_7** (textlines)

Number of lines with aggregated corpus code 7 - not applicaple

**class:**  integer \
<br>**unique:**  205 \
<br>**NAs:**  0 \
<br>**range:** *[ 21 ]* ... *[ 464 ]* \
<br>**examples:**  *[ 142 ], [ 59 ], [ 136 ], [ 152 ], [ 146 ], [ 168 ], [ 117 ], [ 156 ], [ 274 ],* ... \
<br>

<p>&nbsp;</p>

**wds_corp_agg_1** (textlines)

Number of words with aggregated corpus code 1 - lawmaking               

 codes: 111, 112, 113, 114, 121, 122, 123, 124, 125, 131, 132, 133, 134, 141, 142, 143, 144, 145 

**class:**  integer \
<br>**unique:**  334 \
<br>**NAs:**  0 \
<br>**range:** *[ 638 ]* ... *[ 7885 ]* \
<br>**examples:**  *[ 3187 ], [ 3049 ], [ 3158 ], [ 2159 ], [ 2363 ], [ 2792 ], [ 3061 ], [ 7196 ],* ... \
<br>

<p>&nbsp;</p>

**wds_corp_agg_2** (textlines)

Number of words with aggregated corpus code 2 - special decission rules 

 codes: 21, 22, 23, 241, 242, 243, 244, 26, 27, 28, 29, 67, 71, 72, 73

**class:**  numeric \
<br>**unique:**  325 \
<br>**NAs:**  0 \
<br>**range:** *[ 0 ]* ... *[ 11364 ]* \
<br>**examples:**  *[ 10488 ], [ 551 ], [ 2712 ], [ 554 ], [ 325 ], [ 389 ], [ 391 ], [ 2326 ], [ 6* ... \
<br>

<p>&nbsp;</p>

**wds_corp_agg_3** (textlines)

Number of words with aggregated corpus code 3 - elections               

 codes: 25, 31, 32, 33, 411, 421, 441 

**class:**  numeric \
<br>**unique:**  128 \
<br>**NAs:**  0 \
<br>**range:** *[ 0 ]* ... *[ 2478 ]* \
<br>**examples:**  *[ 607 ], [ 260 ], [ 311 ], [ 311 ], [ 824 ], [ 1766 ], [ 337 ], [ 1450 ], [ 64 * ... \
<br>

<p>&nbsp;</p>

**wds_corp_agg_4** (textlines)

Number of words with aggregated corpus code 4 - government control      

 codes: 412, 53, 54, 636, 637, 66 

**class:**  integer \
<br>**unique:**  271 \
<br>**NAs:**  0 \
<br>**range:** *[ 16 ]* ... *[ 5511 ]* \
<br>**examples:**  *[ 1448 ], [ 242 ], [ 916 ], [ 2526 ], [ 135 ], [ 922 ], [ 1785 ], [ 2205 ], [ 1* ... \
<br>

<p>&nbsp;</p>

**wds_corp_agg_5** (textlines)

Number of words with aggregated corpus code 5 - puplicity               

 codes: 121, 51, 52, 53, 55, 56, 611, 612, 613 

**class:**  integer \
<br>**unique:**  368 \
<br>**NAs:**  0 \
<br>**range:** *[ 223 ]* ... *[ 10350 ]* \
<br>**examples:**  *[ 1806 ], [ 2723 ], [ 6051 ], [ 1576 ], [ 291 ], [ 3281 ], [ 4314 ], [ 2283 ], * ... \
<br>

<p>&nbsp;</p>

**wds_corp_agg_6** (textlines)

Number of words with aggregated corpus code 6 - not used            

 codes: 34, 422, 43, 442, 45, 6211, 6212, 6221, 6222, 631, 632, 633, 634, 6351, 6352, 638, 639, 641, 642, 643, 651, 652, 653, 68, 8, 9, 10, 999

**class:**  integer \
<br>**unique:**  333 \
<br>**NAs:**  0 \
<br>**range:** *[ 38 ]* ... *[ 30211 ]* \
<br>**examples:**  *[ 628 ], [ 314 ], [ 191 ], [ 863 ], [ 856 ], [ 301 ], [ 1042 ], [ 619 ], [ 227 * ... \
<br>

<p>&nbsp;</p>

**wds_corp_agg_7** (textlines)

Number of words with aggregated corpus code 7 - not applicaple

**class:**  integer \
<br>**unique:**  560 \
<br>**NAs:**  0 \
<br>**range:** *[ 1010 ]* ... *[ 13975 ]* \
<br>**examples:**  *[ 6594 ], [ 4430 ], [ 5978 ], [ 3356 ], [ 3104 ], [ 3366 ], [ 2955 ], [ 3236 ],* ... \
<br>

<p>&nbsp;</p>
## minority/majority



**pro_maj_mdf** (textlines, linelinkage)

Number of lines modified that were coded as majority friendly.

**class:**  numeric \
<br>**unique:**  16 \
<br>**NAs:**  87 \
<br>**range:** *[ 0 ]* ... *[ 32 ]* \
<br>**examples:**  *[ 0 ], [ NA ], [ 0 ], [ 0 ], [ 1 ], [ 0 ], [ 0 ], [ 0 ], [ 0 ], [ 0 ]* ... \
<br>

<p>&nbsp;</p>

**pro_min_mdf** (textlines, linelinkage)

Number of lines modified that were coded as minority friendly.

**class:**  numeric \
<br>**unique:**  17 \
<br>**NAs:**  87 \
<br>**range:** *[ 0 ]* ... *[ 25 ]* \
<br>**examples:**  *[ 0 ], [ 0 ], [ NA ], [ 0 ], [ 0 ], [ 0 ], [ 0 ], [ NA ], [ 0 ], [ 3 ]* ... \
<br>

<p>&nbsp;</p>

**pro_non_mdf** (textlines, linelinkage)

Number of lines modified that were coded as neither majority nor minority friendly.

**class:**  numeric \
<br>**unique:**  85 \
<br>**NAs:**  87 \
<br>**range:** *[ 0 ]* ... *[ 583 ]* \
<br>**examples:**  *[ 0 ], [ 2 ], [ 2 ], [ 1 ], [ 299 ], [ 7 ], [ 1 ], [ 1 ], [ 0 ], [ 5 ]* ... \
<br>

<p>&nbsp;</p>

**wds_pro_maj_mdf** (textlines, linelinkage)

Number of words modified that were coded as majority friendly.

**class:**  numeric \
<br>**unique:**  83 \
<br>**NAs:**  87 \
<br>**range:** *[ 0 ]* ... *[ 4008 ]* \
<br>**examples:**  *[ 0 ], [ 0 ], [ NA ], [ 0 ], [ 0 ], [ 0 ], [ 0 ], [ 0 ], [ 0 ], [ 0 ]* ... \
<br>

<p>&nbsp;</p>

**wds_pro_min_mdf** (textlines, linelinkage)

Number of words modified that were coded as minority friendly.

**class:**  numeric \
<br>**unique:**  83 \
<br>**NAs:**  87 \
<br>**range:** *[ 0 ]* ... *[ 1162 ]* \
<br>**examples:**  *[ 0 ], [ 2 ], [ 0 ], [ 0 ], [ NA ], [ NA ], [ 0 ], [ 0 ], [ 0 ], [ 82 ]* ... \
<br>

<p>&nbsp;</p>

**wds_pro_non_mdf** (textlines, linelinkage)

Number of words modified that were coded as neither majority nor minority friendly.

**class:**  numeric \
<br>**unique:**  317 \
<br>**NAs:**  87 \
<br>**range:** *[ 0 ]* ... *[ 11883 ]* \
<br>**examples:**  *[ 3 ], [ 275 ], [ 112 ], [ 48 ], [ 40 ], [ 39 ], [ 0 ], [ 0 ], [ NA ], [ 75 ]* ... \
<br>

<p>&nbsp;</p>

**pro_maj_ins** (textlines, linelinkage)

Number of lines inserted that were coded as majority friendly.

**class:**  numeric \
<br>**unique:**  15 \
<br>**NAs:**  87 \
<br>**range:** *[ 0 ]* ... *[ 38 ]* \
<br>**examples:**  *[ 1 ], [ 0 ], [ 0 ], [ 0 ], [ NA ], [ 0 ], [ 0 ], [ 0 ], [ 0 ], [ 0 ]* ... \
<br>

<p>&nbsp;</p>

**pro_min_ins** (textlines, linelinkage)

Number of lines inserted that were coded as minority friendly.

**class:**  numeric \
<br>**unique:**  15 \
<br>**NAs:**  87 \
<br>**range:** *[ 0 ]* ... *[ 17 ]* \
<br>**examples:**  *[ NA ], [ 1 ], [ 0 ], [ 0 ], [ 0 ], [ 0 ], [ NA ], [ 2 ], [ 0 ], [ 0 ]* ... \
<br>

<p>&nbsp;</p>

**pro_non_ins** (textlines, linelinkage)

Number of lines inserted that were coded as neither majority nor minority friendly.

**class:**  numeric \
<br>**unique:**  73 \
<br>**NAs:**  87 \
<br>**range:** *[ 0 ]* ... *[ 317 ]* \
<br>**examples:**  *[ 5 ], [ 19 ], [ 1 ], [ 2 ], [ 1 ], [ 0 ], [ 0 ], [ 6 ], [ 0 ], [ 37 ]* ... \
<br>

<p>&nbsp;</p>

**wds_pro_maj_ins** (textlines, linelinkage)

Number of words inserted that were coded as majority friendly.

**class:**  numeric \
<br>**unique:**  77 \
<br>**NAs:**  87 \
<br>**range:** *[ 0 ]* ... *[ 1439 ]* \
<br>**examples:**  *[ 0 ], [ 0 ], [ 0 ], [ 0 ], [ NA ], [ 0 ], [ 0 ], [ 0 ], [ 0 ], [ 0 ]* ... \
<br>

<p>&nbsp;</p>

**wds_pro_min_ins** (textlines, linelinkage)

Number of words inserted that were coded as minority friendly.

**class:**  numeric \
<br>**unique:**  80 \
<br>**NAs:**  87 \
<br>**range:** *[ 0 ]* ... *[ 601 ]* \
<br>**examples:**  *[ 0 ], [ 0 ], [ 0 ], [ 0 ], [ 0 ], [ 305 ], [ 0 ], [ 0 ], [ 0 ], [ 0 ]* ... \
<br>

<p>&nbsp;</p>

**wds_pro_non_ins** (textlines, linelinkage)

Number of words inserted that were coded as neither majority nor minority friendly.

**class:**  numeric \
<br>**unique:**  313 \
<br>**NAs:**  87 \
<br>**range:** *[ 0 ]* ... *[ 11108 ]* \
<br>**examples:**  *[ 621 ], [ 0 ], [ 589 ], [ 7 ], [ NA ], [ 6465 ], [ 282 ], [ 58 ], [ 12 ], [ 8 * ... \
<br>

<p>&nbsp;</p>

**pro_maj_del** (textlines, linelinkage)

Number of lines deleted that were coded as majority friendly.

**class:**  numeric \
<br>**unique:**  7 \
<br>**NAs:**  87 \
<br>**range:** *[ 0 ]* ... *[ 25 ]* \
<br>**examples:**  *[ 0 ], [ 0 ], [ 0 ], [ 0 ], [ NA ], [ 0 ], [ NA ], [ 0 ], [ 0 ], [ 0 ]* ... \
<br>

<p>&nbsp;</p>

**pro_min_del** (textlines, linelinkage)

Number of lines deleted that were coded as minority friendly.

**class:**  numeric \
<br>**unique:**  7 \
<br>**NAs:**  87 \
<br>**range:** *[ 0 ]* ... *[ 7 ]* \
<br>**examples:**  *[ 0 ], [ 0 ], [ 0 ], [ 0 ], [ 0 ], [ 0 ], [ 0 ], [ 0 ], [ 0 ], [ 0 ]* ... \
<br>

<p>&nbsp;</p>

**pro_non_del** (textlines, linelinkage)

Number of lines deleted that were coded as neither majority nor minority friendly.

**class:**  numeric \
<br>**unique:**  46 \
<br>**NAs:**  87 \
<br>**range:** *[ 0 ]* ... *[ 229 ]* \
<br>**examples:**  *[ 1 ], [ 1 ], [ 0 ], [ 16 ], [ 0 ], [ 0 ], [ NA ], [ 5 ], [ 0 ], [ 0 ]* ... \
<br>

<p>&nbsp;</p>

**wds_pro_maj_del** (textlines, linelinkage)

Number of words deleted that were coded as majority friendly.

**class:**  numeric \
<br>**unique:**  26 \
<br>**NAs:**  87 \
<br>**range:** *[ 0 ]* ... *[ 980 ]* \
<br>**examples:**  *[ 0 ], [ 0 ], [ 0 ], [ 0 ], [ 0 ], [ 0 ], [ 980 ], [ 0 ], [ NA ], [ 0 ]* ... \
<br>

<p>&nbsp;</p>

**wds_pro_min_del** (textlines, linelinkage)

Number of words deleted that were coded as minority friendly.

**class:**  numeric \
<br>**unique:**  26 \
<br>**NAs:**  87 \
<br>**range:** *[ 0 ]* ... *[ 192 ]* \
<br>**examples:**  *[ 0 ], [ 0 ], [ 0 ], [ 0 ], [ 0 ], [ 0 ], [ 0 ], [ 0 ], [ 0 ], [ 0 ]* ... \
<br>

<p>&nbsp;</p>

**wds_pro_non_del** (textlines, linelinkage)

Number of words deleted that were coded as neither majority nor minority friendly.

**class:**  numeric \
<br>**unique:**  179 \
<br>**NAs:**  87 \
<br>**range:** *[ 0 ]* ... *[ 5992 ]* \
<br>**examples:**  *[ 73 ], [ 0 ], [ 2018 ], [ 504 ], [ 0 ], [ 0 ], [ 0 ], [ 0 ], [ NA ], [ NA ]* ... \
<br>

<p>&nbsp;</p>

**pro_maj** (linelinkage)

Number of lines coded as majority friendly.

**class:**  numeric \
<br>**unique:**  24 \
<br>**NAs:**  87 \
<br>**range:** *[ 0 ]* ... *[ 44 ]* \
<br>**examples:**  *[ 2 ], [ 2 ], [ 1 ], [ 0 ], [ 0 ], [ 0 ], [ 0 ], [ 3 ], [ 33 ], [ NA ]* ... \
<br>

<p>&nbsp;</p>

**pro_min** (linelinkage)

Number of lines coded as minority friendly.

**class:**  numeric \
<br>**unique:**  21 \
<br>**NAs:**  87 \
<br>**range:** *[ 0 ]* ... *[ 37 ]* \
<br>**examples:**  *[ 0 ], [ NA ], [ 5 ], [ 0 ], [ 0 ], [ 0 ], [ 0 ], [ 1 ], [ 0 ], [ 3 ]* ... \
<br>

<p>&nbsp;</p>

**pro_non** (linelinkage)

Number of lines coded as neither majority nor minority friendly.

**class:**  numeric \
<br>**unique:**  121 \
<br>**NAs:**  87 \
<br>**range:** *[ 0 ]* ... *[ 778 ]* \
<br>**examples:**  *[ 9 ], [ 40 ], [ 7 ], [ 16 ], [ 186 ], [ 16 ], [ 2 ], [ NA ], [ 41 ], [ 19 ]* ... \
<br>

<p>&nbsp;</p>

**wds_pro_maj** (textlines, linelinkage)

Number of words coded as majority friendly.

**class:**  numeric \
<br>**unique:**  123 \
<br>**NAs:**  87 \
<br>**range:** *[ 0 ]* ... *[ 4022 ]* \
<br>**examples:**  *[ 0 ], [ 0 ], [ 0 ], [ 23 ], [ 0 ], [ 0 ], [ 110 ], [ 0 ], [ NA ], [ 0 ]* ... \
<br>

<p>&nbsp;</p>

**wds_pro_min** (textlines, linelinkage)

Number of words coded as minority friendly.

**class:**  numeric \
<br>**unique:**  124 \
<br>**NAs:**  87 \
<br>**range:** *[ 0 ]* ... *[ 1680 ]* \
<br>**examples:**  *[ 0 ], [ 40 ], [ 0 ], [ 0 ], [ 0 ], [ 0 ], [ 0 ], [ 0 ], [ NA ], [ NA ]* ... \
<br>

<p>&nbsp;</p>

**wds_pro_non** (textlines, linelinkage)

Number of words coded as neither majority nor minority friendly.

**class:**  numeric \
<br>**unique:**  475 \
<br>**NAs:**  87 \
<br>**range:** *[ 0 ]* ... *[ 22843 ]* \
<br>**examples:**  *[ 30 ], [ 1222 ], [ 342 ], [ 209 ], [ 50 ], [ 718 ], [ 799 ], [ 37 ], [ 686 ], * ... \
<br>

<p>&nbsp;</p>



# Appendix


## Coding Manual: Categories and Codes for Coding the Content of Parliamentary Standing Orders

### Basic Intuition:

Each and every code is exclusive, meaning that one subparagraph needs to have one code but one code only. For some codes there are notes on how to decide between multiple codes which may seem appropriate. Sometimes even the coding rules and additional notes will not help to decide between codes. In this case please let us know. Every decision accompanied by doubt should be documented.

### Further rules of the game:

-	Often sub-paragraphs can be coded differently, depending on whether or not one takes into consideration the overall context of the rule or the more specific regulation. If in doubt, code based on the overall context. Example: §14 GOBT: president grants vacation time &#8594; coded as rights and obligations of individual members of parliament if one takes into account the general context (652) and not as responsibility of the president (6212).

-	Rules which concern the interaction of two actors are attributed to the actor which takes the active part if he has discretion regarding this action. Example: §62 (2) GOBT: The plenary can request report of committee &#8594; coded as recall through the plenary (124) and not as report of committee to the plenary (134).

-	The right of those initiating a bill or law to be present at the committee meetings is coded as general right of individual members of parliament (652).



### Coding Scheme

**(1) Law Making**

&nbsp;

*Note: SPs that refer to both the plenary sessions and committees are coded as 12x; SPs dealing with both law-making and special decision procedures are coded as 1xx.*


* **11 Bills and Motions**
    + 111	types of bills and motions; printing and distribution of bills and motions to MPs
    + 112	right to initiate bills and motions 
    + 113	restrictions and deadlines (if not assignable to more specific category, e.g. code 121; 32; 134)
    + 114	legislative planning (concerns the whole term- general schedule)
* **12	Treatment of bills and motions in the plenary** *(Note: SPs including all stages of the treatment of bills and motions are coded as votes in the plenary (123); SPs which determine the subject of debate and vote are coded as subject of vote (123).)*
    + 121	debate in the plenary
    + 122	right of amendment in the plenary 
    + 123	subject of vote, rules of vote (including quorum), voting technology in the plenary
    + 124	the plenary as Committee of the Whole House *(Note: SPs referring to both committees and Committee of the Whole House are coded as committees (not 124 but 13x).)*
    + 125	referral to committee, withdrawal from committee
* **13	Treatment of bills and motions in committee** *(Note: SPs including all stages of the treatment of bills and motions in committee are coded as votes in committee (133); SPs which determine both the subject of debate and the subject of vote are coded as subject of vote in committee (133).)*
    + 131	debate in committee (including hearing) 
    + 132	amendment rights in committee
    + 133	subject of vote, rules of vote (including quorum), voting technology in committee
    + 134	report to the plenary


**(2) Special Decision Procedures other than Regular Law-Making**

&nbsp;

*Note: SPs which concern multiple special decision procedures apart from regular law-making are coded as follows: highest priority is given to constitutional matters, second highest priority is given to financial laws and budgeting, third highest priority is given to EU policy and fourth highest priority is given toforeign policy.*

* **21	constitutional change and amendment**
* **22	financial laws** (money bills) and budgeting
* **23	foreign policy**  (e.g. approval of law of nations, declaration of war *Note: If foreign policy and EU is treated together, the SP is coded as EU (241, 242, 243 or 244).*)
* **24	EU** *(Note: If foreign policy and EU is treated together, the SP is coded as EU (241, 242, 243 or 244))*
    + 241	treatment of EU-bills and motions
    + 242	EU-committee: election and resignation 
    + 243	instructions to the government concerning EU decisions
    + 244	further rights of participation in EU matters (e.g. debates about EU topics not based on EU bills and motions, reaction to violations of subsidiary principle) 
* **25	general rules on elections in parliament** (if not coded as election of government (31), or election of specific officials (411; 421; 441; 6211; 6221; 632))
* **26	further special decision procedures** leading to a decision, e.g. resolution, or leading to a decree/act/bylaw (not mere debate or question time) but cannot be coded as regular law-making nor special decision procedures (21-24)
* **27	procedures concerning laws that are hierarchically situated between regular laws and constitutional laws** (above regular laws; e.g. organic laws in Spain)
* **28 	emergency legislation**
* **29	relationship to sub-national level** (law-making, rights of participation of sub-national level)



**(3)	Relationship to Government**

&nbsp; 

*Note: If vote of no confidence and vote of confidence is treated together, the SP is coded as vote of no confidence (32).*

* **31	election of government / mandatory investiture vote; entry into office**
* **32	vote of no confidence / government resignation**
* **33	vote of confidence**
* **34	instructions to government, involvement of members of government in parliamentary activities** (rights to compel witnesses [usually right of parliament against members of government], right to speak [usually members of government's right], request of information about state of execution of decisions of parliament)


**(4)	Relationship to External Offices/Institutions apart from the Government**

* **41	parliamentary support bodies (e.g. general accounting office, ombudsman,...)**
    + 411	election and resignation
    + 412	competences and resources of external offices/institutions; relations to parliament (e.g. reports, questions, ...)
* **42	head of state**
    + 421	election and resignation
    + 422	relation to parliament (if not coded as law-making (141, 144))
* **43	second chamber (if not coded as law-making (142))**
* **44	constitutional courts**
    + 441	election and resignation
    + 442	relation to parliament (if not coded as law-making (145))
* **45	other external offices**


**(5)	Generating Publicity**

* **51	general rules regarding debate** (e.g. time allotted for speaking, proportional representation of parties during debate, closure of debate)
* **52	debates outside of law-making** (e.g. topical hours ...)
* **53	question rights**
* **54	petitions and petition committee**
* **55	relationship to media and citizens** (e.g. parliamentary TV, accreditation of journalists, publicity of meetings, admissibility of visitors); regulation of matters of confidentiality
* **56	protocols and parliamentary documents; forwarding of documents and decisions to other bodies**



**6	 Internal Organization of Parliament**

* **61	plenary**
    + 611	agenda setting and removal of items from the agenda (general rules which are not specifically regulated under 114)
    + 612	chairing of meetings and measures to uphold order
    + 613	sitting times *(Note: When members are to be present inside the parliament)*
* **62	parliamentary presiding bodies**
    + 621	president of parliament, vice presidents, secretaries and clerks
        * 6211	election, resignation and internal decision rules
        * 6212	responsibilities *(Note: if not coded as more specific category  (e.g. 612), Try to code in regard to the topic at first - 6212 only when no code corresponds)*
    + 622	council of elders or similar coordination body *(Note: The council of elders can be distinguished from the Presidency of Parliament (621) insofar as representatives of the parliamentary party groups are explicitly included.)*
        * 6221	composition, election, resignation, internal decision rules
        * 6222	responsibilities (if not coded as more specific category (e.g. 612))
* **63	committees** (if not coded as more specific category (e.g. 13; 24; 54; 55; 72))
    + 631	general regulations regarding types of committees
    + 632	membership and committee jurisdiction (area of influence-control .g. finance, economy, agriculture...)
    + 633	formal organizational units of committee *(Note: e.g. chair of committee, sub-committees, staff; This is about the appointment and election of the organizational units within committees and NOT about their responsibilities.)*
    + 634	agenda and procedures (details on how decisions are taken) within committees (if not coded as law-making (13))
    + 635	relations to other bodies
        * 6351	relation to plenary (if not coded as 124; 134; 34)
        * 6352 	relation to other committees
    + 636	investigative competencies of regular committees (NOT committees of inquiry (637))
		+ 637	committee of inquiry 
		+ 638	enquête commission
    + 639	other special committees which are not explicitly referenced in this coding manual  *(Note: e.g. oversight committees in Switzerland; Otherwise referenced are: EU-committee (242); committee of inquiry (637); petition committee (54); standing order committee (usually 72); council of elders or similar coordination body (622). Exception: committees which deal exclusively with the confirmation of the elections of members of parliament are coded as 651.)*
* **64	parliamentary party groups**
    + 641	formation of parliamentary party groups
    + 642	rights and obligations of parliamentary party groups (if not coded more specifically as e.g. 112; 51; 52; 53)
    + 643	financial and staff resources
* **65	individual members of parliament**
    + 651	election, entry into office, resignation, incompatibilities, legal status, immunity, indemnity
    + 652	rights and obligations of individual members of parliament (if not coded more specifically as e.g. 112; 51; 52; 53)
    + 653	salary, financial and staff resources
* **66	opposition**
* **67	special bodies for emergency situations**
* **68	parliamentary administration**



**7 	Change and Interpretation of the Standing Orders**

* **71	rules regarding changing the standing orders**
* **72	rules regarding interpretation of and deviation from standing orders**
* **73	debate about standing orders and motions regarding the standing orders**

**8 	General Rules Regarding Formation and Legislative Session; Discontinuity**

**9 	Final Provisions**

**10	Miscellaneous** (cannot be coded otherwise)

**999 	Footnotes and Titles Without Relevant Content**




