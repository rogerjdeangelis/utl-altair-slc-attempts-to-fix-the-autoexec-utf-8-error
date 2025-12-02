ods _all_ close;
ods listing;
options ls=255 ps=65
 nofmterr nocenter
 nodate nonumber
 noquotelenmax
 validvarname=upcase
 nolabel
 compress=no
 FORMCHAR='|----|+|---+=|-/\<>*'
;
 
run;quit;
 
/*---- useful for a persistent work library in ultraedit ----*/
libname workx sas7bdat "d:/wpswrkx";


*---- LETTERS ----*/

%let lettersq=
 "A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z";
%let letters=A B C D E F G H I J K L M N O P Q R S T U V W X Y Z;
%let letter=ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz;

/*---- NUMBERS ----*/

%let numbersq=%str("1","2","3","4","5","6","7","8","9","10");
%let numbers=1 2 3 4 5 6 7 8 9 10;
%let number=12345678910;

/*---- STATES  ----*/

%let states50q="AL","AK","AZ","AR","CA","CO","CT","DE","FL","GA","HI","ID","IL","IN","IA","KS","KY","LA","ME"
,"MD","MA","MI","MN","MS","MO","MT","NE","NV","NH","NJ","NM","NY","NC","ND","OH","OK","OR","PA","RI","SC","SD"
,"TN","TX","UT","VT","VA","WA","WV","WI","WY";

%let states50= %sysfunc(compbl(AL AK AZ AR CA CO CT DE FL GA HI ID IL IN IA KS KY LA ME MD MA MI MN MS MO MT
NE NV NH NJ NM NY NC ND OH OK OR PA RI SC SD TN TX UT VT VA WA WV WI WY)) ;

/*---- MONTHS  ----*/

%let monthsq="JAN","FEB","MAR","APR","MAY","JUN","JUL","AUG","SEP","OCT", "NOV", "DEC" ;
%let months = JAN FEB MAR APR MAY JUN JUL AUG SEP OCT NOV DEC;

%let monthsq=%str("JANUARY","FEBRUARY","MARCH","APRIL","MAY","JUNE","JULY","AUGUST","SEPTEMBER","OCTOBER","NOVEMBER","DECEMBER");
%let months=JANUARY FEBRUARY MARCH APRIL MAY JUNE JULY AUGUST SEPTEMBER OCTOBER NOVEMBER DECEMBER;                                

/*---- DAYS    ----*/

%let daysq="Monday","Tuesday","Wednesday","Thursday","Friday","Saturday","Sunday";
%let days=Monday Tuesday Wednesday Thursday Friday Saturday Sunday;

%let daysabvq="Mon","Tue","Wed","Thu","Fri","Sat","Sun";
%let daysabv=Mon Tue Wed Thu Fri Sat Sun;


/*---- STATES LONG NAMES 50  ----*/                                       
                                                                          
%let stateslnq=%sysfunc(compbl(%str(                                      
 "Alabama"        ,"Alaska"         ,"Arizona"        ,"Arkansas"         
,"California"     ,"Colorado"       ,"Connecticut"    ,"Delaware"         
,"Florida"        ,"Georgia"        ,"Hawaii"         ,"Idaho"            
,"Illinois"       ,"Indiana"        ,"Iowa"           ,"Kansas"           
,"Kentucky"       ,"Louisiana"      ,"Maine"          ,"Maryland"         
,"Massachusetts"  ,"Michigan"       ,"Minnesota"      ,"Mississippi"      
,"Missouri"       ,"Montana"        ,"Nebraska"       ,"Nevada"           
,"New Hampshire"  ,"New Jersey"     ,"New Mexico"     ,"New York"         
,"North Carolina" ,"North Dakota"   ,"Ohio"           ,"Oklahoma"         
,"Oregon"         ,"Pennsylvania"   ,"Rhode Island"   ,"South Carolina"   
,"South Dakota"   ,"Tennessee"      ,"Texas"          ,"Utah"             
,"Vermont"        ,"Virginia"       ,"Washington"     ,"West Virginia"    
,"Wisconsin"      ,"Wyoming")));                                          
  
data _null_;
  file print;
  put " ";
run;quit;
 
         