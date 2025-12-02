# utl-altair-slc-attempts-to-fix-the-autoexec-utf-8-error
Altair slc attempts to fix the autoexec utf-8 error;
    %let pgm=utl-altair-slc-attempts-to-fix-the-autoexec-utf8-error;

    %stop_submission;

    Altair slc attempts to fix the autoexec utf-8 error;

    too long to post in listserv, see github
    github

    https://github.com/rogerjdeangelis/utl-altair-slc-attempts-to-fix-the-autoexec-utf-8-error
    PROBLEM

    FIX THIS ERROR

      NOTE: AUTOEXEC processing beginning; file is C:\wpsoto\autoexec.sas
      NOTE: AUTOEXEC source line
      1       +ï»¿;;;;
               ^
      ERROR: Expected a statement keyword : found "?"

      Note 'ï»¿' is hex 'EFBBBF'x

    EVEN IF YOU REMOVE 'Ï»¿', 'EFBBBF'X, IT WILL COME BACK
    C:\wpsoto\autoexecbom.sas does not have the utf-8 codes.


      NOTE: AUTOEXEC processing beginning; file is C:\wpsoto\autoexecbom.sas
      NOTE: AUTOEXEC source line
      1       +  ï»¿%let _init_= %str(
               ^
      ERROR: Expected a statement keyword : found "?"

    I don't beleive users can solve this isuue. I think it is a problem
    witht the slc windows interface.


    CONTENTS

      1 Display the hidden utf_8 codes in your file
      2.Remove the utf-8 codes
      3 utf-8 gone error persists
        Show that the ERROR is still resent

    /*                   _
    (_)_ __  _ __  _   _| |_
    | | `_ \| `_ \| | | | __|
    | | | | | |_) | |_| | |_
    |_|_| |_| .__/ \__,_|\__|
            |_|
    */

    File is in the repo

    c:/wpsoto/autoexec.sas

    /*       _ _           _                     _    __      ___                 _
    / |   __| (_)___ _ __ | | __ _ _   _   _   _| |_ / _|    ( _ )   ___ ___   __| | ___  ___
    | |  / _` | / __| `_ \| |/ _` | | | | | | | | __| |_ ___ / _ \  / __/ _ \ / _` |/ _ \/ __|
    | | | (_| | \__ \ |_) | | (_| | |_| | | |_| | |_|  _|___| (_) || (_| (_) | (_| |  __/\__ \
    |_|  \__,_|_|___/ .__/|_|\__,_|\__, |  \__,_|\__|_|      \___/  \___\___/ \__,_|\___||___/
                    |_|            |___/
    */

    WHATS GOING ON.

    SAS does not allow reading BOM hex codes directly?
    This method forces an error and sas does a hex dump.
    This exposes the three BOM UTF-8 hexcodes.


    data _null_;
      /*--- OPEN THE FILE IN BINARY MODE ---*/
      infile "c:/wpsoto/autoexec.sas" recfm=n;
      input bom;
      /*-- DO A HEX DUMP BECAUSE OF ERROR ---*/
    run;

    NOTE BOM THREE BYTE HEXCODES
           123
           ---
      HAR  ?
      ONE  EBB
      UMR  FBF


    NOTE: Invalid data for BOM in line 1 columns 1-17
    RULE:     ----+----1----+----2----+----3----+----4----+----5----+----6----+----7----+----8
    1   CHAR  ?..**;....%%put "xxxx options ls=255 ps=65  nofmterr nocenter nodate nonumber
        ZONE  EBB00223000022777227777267766672673333277333226666767726666676726666762666766672
        NUMR  FBFDAAABDADA550540288880F049FE30C3D255003D6500EF6D45220EF35E4520EF41450EFE5D2520

         241  e;..  ods listing;..  options ls=255 ps=65..    nofmterr nocenter..    nodate no
        ZONE  63002266726677666300226776667267333327733300222266667677266666767002222666676266
        NUMR  5BDA00F430C9349E7BDA00F049FE30C3D255003D65DA0000EF6D45220EF35E452DA0000EF41450EF

         481  (sashelp);......   proc format;....     value num2mis..      .<-.Z      = 'MIS'.
        ZONE  27676667230000002227766266766730000222227667626763667002222222322522222232244520
        NUMR  831385C09BDADADA00002F306F2D14BDADA0000061C550E5D2D93DA000000ECDEA000000D07D937D
         721  NK','NOT DONE','ND','NA','UNKNOWN','Missing','MISSING','MISS' ='MIS'..      othe

        ZONE  44222445244442224422244222544445422246776662224455444222445522324452002222226766
        NUMR  EB7C7EF404FE57C7E47C7E17C75EBEF7E7C7D9339E77C7D9339E77C7D93370D7D937DA000000F485
         961  ,"V","W","X","Y","Z";..%let letters=A B C D E F G H I J K L M N O P Q R S T U V
        ZONE  22522252225222522252300266726677677342424242424242424242424242424252525252525252
        NUMR  C262C272C282C292C2A2BDA5C540C544523D102030405060708090A0B0C0D0E0F000102030405060

    /*___                                              _    __        ___                 _
    |___ \   _ __ ___ _ __ ___   _____   _____   _   _| |_ / _|      ( _ )   ___ ___   __| | ___  ___
      __) | | `__/ _ \ `_ ` _ \ / _ \ \ / / _ \ | | | | __| |_ _____ / _ \  / __/ _ \ / _` |/ _ \/ __|
     / __/  | | |  __/ | | | | | (_) \ V /  __/ | |_| | |_|  _|_____| (_) || (_| (_) | (_| |  __/\__ \
    |_____| |_|  \___|_| |_| |_|\___/ \_/ \___|  \__,_|\__|_|        \___/  \___\___/ \__,_|\___||___/

    */

     OPEN THE autoexec.sas that has the UTF-8 codes

     Remove the codes

     If you have the notepad++ hex viewer plugin you can verify that the UTF-8 codes are gone

     Save then autoexec.sas code in autoexecbom.sas

     Immediately make the autoexecbom.sas read-only so that the slc oe win 11 cannot
     corrupt it withe UTF-8 codes

     You need to update the slc config file

     C:\wpscfg\altairslc_local.cfg
       Change
       -AUTOEXEC 'C:\wpsoto\autoexec.sas'
       to
       -AUTOEXEC 'C:\wpsoto\autoexecbom.sas'

       I added thsis to my autoexec.sas code
       This provides a permanent 'work' library, so
       you don't lose work between ultraedit submissions

       libname workx "d:/wpswrkx";

    /*____         _    __        ___                                                                           _     _
    |___ /   _   _| |_ / _|      ( _ )    __ _  ___  _ __   ___   ___ _ __ _ __ ___  _ __   _ __   ___ _ __ ___(_)___| |_ ___
      |_ \  | | | | __| |_ _____ / _ \   / _` |/ _ \| `_ \ / _ \ / _ \ `__| `__/ _ \| `__| | `_ \ / _ \ `__/ __| / __| __/ __|
     ___) | | |_| | |_|  _|_____| (_) | | (_| | (_) | | | |  __/|  __/ |  | | | (_) | |    | |_) |  __/ |  \__ \ \__ \ |_\__ \
    |____/   \__,_|\__|_|        \___/   \__, |\___/|_| |_|\___| \___|_|  |_|  \___/|_|    | .__/ \___|_|  |___/_|___/\__|___/
                                         |___/                                             |_|
    */

    if interested in hex dump?
    https://github.com/rogerjdeangelis/utl_hex_dump_of_complex_text_file

    %utlrulr(
           uinflt =c:\wpsoto\autoexecbom.sas,
           /*--------------------------------*\
           | Control                          |
           \*--------------------------------*/
           uprnlen =80,  /* Linesize for Dump */
           ulrecl  =80,  /* maximum record length */
           urecfm   =f,
           uobs = 3,        /* number of obs to dump */
           uchrtyp =ascii,  /* ascii or ebcdic */
           /*--------------------------------*\
           | Outputs                          |
           \*--------------------------------*/
           uotflt =d:\txt\autoexechex.txt
           );

    filename inp 'd:\txt\autoexechex.txt';
    data _null_;
      infile inp;
      file print;
      input;
      put _infile_;
    run;quit;

    No UTF-8 BOM CODES IN FIRST THREE BYTES

    123
    %le
    1..
    266
    5C5


    The BOM hex codes have been removed

    ASCII Flatfile Ruler & Hex
    utlrulr
    c:\wpsoto\autoexecbom.sas
    d:\txt\autoexechex.txt


     --- Record Number ---  1   ---  Record Length ---- 80

    %let _init_= %str(.. /* filename wpswbhtm clear; */..  ods _all_ close;..  ods
    1...5....10...15...20...25...30...35...40...45...50...55...60...65...70...75...8
    26672566675322777200222266666666277776676266667322200226672566652666763002266722
    5C540F9E94FD053428DA0FA069C5E1D507037284D03C512B0AFDA00F430F1CCF03CF35BDA00F4300


     --- Record Number ---  2   ---  Record Length ---- 80

    listing;..  options ls=255 ps=65..    nofmterr nocenter..    nodate nonumber..
    1...5....10...15...20...25...30...35...40...45...50...55...60...65...70...75...8
    66776663002267766672673333277333002222666676772666667670022226666762666766670022
    C9349E7BDA00F049FE30C3D255003D65DA0000EF6D45220EF35E452DA0000EF41450EFE5D252DA00


     --- Record Number ---  3   ---  Record Length ---- 80

      noquotelenmax..    validvarname=upcase..    compress=no..    FORMCHAR='|----|+
    1...5....10...15...20...25...30...35...40...45...50...55...60...65...70...75...8
    22667767666666700222276666767666637766760022226667767736600222244544445327222272
    00EF15F45C5ED18DA000061C94612E1D5D503135DA00003FD02533DEFDA00006F2D3812D7CDDDDCB

    /*
    | | ___   __ _
    | |/ _ \ / _` |
    | | (_) | (_| |
    |_|\___/ \__, |
             |___/
    */

    /*--- Either win 11 or the altair slc is corrupting the autoexec ---*/


    1                                          Altair SLC       17:01 Monday, December  1, 2025

    NOTE: Copyright 2002-2025 World Programming, an Altair Company
    NOTE: Altair SLC 2026 (05.26.01.00.000758)
          Licensed to Roger DeAngelis
    NOTE: This session is executing on the X64_WIN11PRO platform and is running in 64 bit mode

    NOTE: AUTOEXEC processing beginning; file is C:\wpsoto\autoexecbom.sas
    NOTE: AUTOEXEC source line
    1       +  ï»¿%let _init_= %str(
               ^
    ERROR: Expected a statement keyword : found "?"
    NOTE: Library wpshelp assigned as follows:
          Engine:        WPD
          Physical Name: C:\Program Files\Altair\SLC\2026\sashelp

    /*              _
      ___ _ __   __| |
     / _ \ `_ \ / _` |
    |  __/ | | | (_| |
     \___|_| |_|\__,_|

    */
