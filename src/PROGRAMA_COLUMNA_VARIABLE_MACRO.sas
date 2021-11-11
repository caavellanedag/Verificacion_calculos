%LET VARIABLES = CHIP VALOR_AVALUO;



%let RUTA = \\prowin04\cavellaneda\EJERCICIOS\EJERCICIOS 2021\VERIFICACION_CALCULOS\Verificacion_calculos\input;

proc import datafile = "&RUTA.\211102_REPORTE_FINAL_M05.xlsx"
 out  =  VARS
 dbms  =  xlsx
 replace;
 sheet  =  "Diccionario";
/*namerow=7;
datarow=8;*/
range='A7:';
getnames=YES;
run;


proc sql;
  select VARIABLE
    into :VARIABLE separated by ' '
    from VARS;
quit;

%PUT &VARIABLE.;

data want1;
set COMUN.PREDIO_FINAL_2021 (keep = &VARIABLE.);
run;



